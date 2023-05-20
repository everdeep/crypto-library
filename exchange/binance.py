import logging
import pandas as pd
from .base import Base

from cryptolib.enums import OrderStatus, OrderType, Signal
from binance.client import Client
from binance.exceptions import BinanceAPIException, BinanceOrderException


class Binance(Base):
    def __init__(self, api_key: str = None, api_secret: str = None):
        super().__init__(api_key, api_secret)

        self.fee = {
            "taker": 0.001,
            "maker": 0.001,
        }

        # binance client
        self.client = Client(
            api_key=self._api_key, api_secret=self._api_secret, testnet=self.sandbox
        )

        # TODO: Extract this out into a global scope so that it isn't called every minute separately by each bot
        self.exchange_info = self.get_exchange_info()
        # To summarise: just converts list of dicts into dict of dicts
        self.symbol_info = {
            item["symbol"]: {filter["filterType"]: filter for filter in item["filters"]}
            for item in self.exchange_info["symbols"]
        }

    def load_markets(self) -> None:
        self.tickers_info = self.exchange.load_markets()

    def get_exchange_info(self) -> dict:
        return self.client.get_exchange_info()

    def get_all_symbols(self) -> list:
        data = self.exchange.fetch_tickers()
        return data

    def get_klines(self, symbol: str, interval: str, limit: int) -> list[list]:
        res = _handle_exception(self.client.get_klines)(symbol=symbol, interval=interval, limit=limit)
        if res is None:
            logging.error(f"Error fetching k-lines data for symbol: {symbol}, interval: {interval}, limit: {limit}")
            return []
        
        return res

    def get_last_price(self, symbol: str) -> float:
        res = _handle_exception(self.client.get_symbol_ticker)(symbol=symbol)
        if res is None:
            logging.error(f"Error fetching last price for symbol: {symbol}")
            return 0.0
        
        return float(res["price"])


    def get_account(self) -> dict:
        res = _handle_exception(self.client.get_account)()
        if res is None:
            logging.error(
                f"Failed to get account information from Binance API: sandboxed - {self.sandbox} api_key: {self._api_key}"
            )

        return res

    def get_balance(self, symbol: str = None) -> list[dict]:
        balances = self.get_account()["balances"]
        if not balances:
            return []

        df = pd.DataFrame(balances).astype({"free": "float", "locked": "float"})
        # Only return the balance if it is greater than 0
        df = df[df["free"] > 0]

        if symbol:
            return df[df["asset"] == symbol].iloc[0].to_dict()

        return df.to_dict("records")

    def get_open_orders(self, symbol: str = None) -> list[dict]:
        res = _handle_exception(self.client.get_open_orders)(symbol=symbol)
        if res is None:
            logging.error(f"Failed to fetch open orders for symbol: {symbol}")
            return []
        else:
            return res

    def get_order(self, symbol: str, order_id: str) -> dict:
        """The return dictionary must contain the following keys:
        - amount: (float)
        - cost: (float)
        - fees: (dict)
        - status: (OrderStatus)
        """
        res = _handle_exception(self.exchange.fetch_order)(id=order_id, symbol=symbol)
        if res is None:
            logging.error(f"Failed to fetch order for orderId: {order_id}, symbol: {symbol}")

        return res

    def get_order_id(self, order: dict) -> str:
        """Returns the order id from the Binance APIs response"""
        return order.get("orderId")

    def get_order_status(self, order: dict) -> OrderStatus:
        # Ensure enum contains all possible values
        return OrderStatus[order.get("status")]

    def get_all_orders(
        self,
        symbol: str,
        limit: int = None,
        start_time: str = None,
        end_time: str = None,
        order_id: str = None,
    ) -> list[dict]:
        res = _handle_exception(self.client.get_all_orders)(
            symbol=symbol,
            limit=limit,
            start_time=start_time,
            end_time=end_time,
            order_id=order_id,
        )
        if res is None:
            logging.error(f"Failed to fetch orders for symbol: {symbol}")
            return []
        else:
            return res

    def create_order_params(
        self, config: dict, signal: Signal, last_price: float
    ) -> dict:
        # Min trade amount is often 10 USD
        min_cost = self.get_min_order_cost(config.currency_pair)

        # max amount of asset that one can buy/sell
        max_amount = self.get_max_order_amount(config.currency_pair)

        # Check funds then place order
        if signal == Signal.BUY:
            if config.currency_free < min_cost:
                return
            
            # Calculate the cost and buys the most it can with allocated funds
            amount = config.currency_free / last_price
            cost = (
                amount * last_price
                if amount < max_amount
                else max_amount * (last_price * 0.997)
            )
        else:
            if config.asset_free * last_price < min_cost:
                return

            # Always sells the most it can
            cost = config.asset_free if config.asset_free < max_amount else max_amount

        return {
            "symbol": config.currency_pair,
            "side": signal.name,
            "type": OrderType.MARKET.name,
            "cost": f"{cost:.8f}", # max 8 decimal place precision required by Binance
        }

    def create_order(self, order: dict) -> dict:
        if order["side"] == Signal.BUY.name:
            order["quoteOrderQty"] = order["cost"]
        else:
            order["quantity"] = order["cost"]
        order.pop("cost")

        res = _handle_exception(self.client.create_order)(**order)
        if res is None:
            logging.error(f"Order: {order}")

        return res

    def cancel_order(self, symbol: str, order_id: str) -> dict:
        return _handle_exception(self.client.cancel_order)(
            symbol=symbol, orderId=order_id
        )

    def get_order_cost_and_amount(self, order: dict) -> tuple[float, float]:
        cost = (
            order.get("cummulativeQuoteQty")
            if order.get("side") == "BUY"
            else order.get("executedQty")
        )
        amount = (
            order.get("executedQty")
            if order.get("side") == "BUY"
            else order.get("cummulativeQuoteQty")
        )
        return float(cost), float(amount)

    def get_min_order_cost(self, currency_pair: str) -> float:
        return float(self.symbol_info[currency_pair]["NOTIONAL"]["minNotional"])

    def get_max_order_amount(self, currency_pair: str) -> float:
        return float(self.symbol_info[currency_pair]["MARKET_LOT_SIZE"]["maxQty"])


def _handle_exception(func):
    def wrapper(*args, **kwargs):
        try:
            return func(*args, **kwargs)
        except BinanceAPIException as e:
            logging.error(e)
        except BinanceOrderException as e:
            logging.error(e)
        except Exception as e:
            logging.error(e)

    return wrapper
