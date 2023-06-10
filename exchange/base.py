import ccxt
import logging

from cryptolib.enums import OrderStatus, Signal, ExchangeType, Interval, OrderType
from cryptolib.model import TickerModel
from cryptolib.schema import TickerSchema
from cryptolib.config import config

from sqlalchemy import create_engine
from sqlalchemy.orm import Session


class Base:
    def __init__(
        self, api_key=None, api_secret=None, exchange_type: ExchangeType = None
    ):
        self.sandbox = config.API_SANDBOX if hasattr(config, "API_SANDBOX") else False

        # Use global dev api keys if user has no api keys
        if not api_key and config.DEBUG == True:
            self._load_dev_api_keys(exchange_type)
        else:
            self._api_key = api_key
            self._api_secret = api_secret

        self.exchange = ccxt.binance(
            {
                "apiKey": api_key,
                "secret": api_secret,
                "enableRateLimit": True,
            }
        )
        self.exchange.set_sandbox_mode(self.sandbox)

        # Create stream DB Engine
        self._db_engine = create_engine(
            config.SQLALCHEMY_DATABASE_URI, echo=False, pool_size=20
        )
        self._stream_engine = create_engine(
            config.STREAM_DB_URI, echo=False, pool_size=20
        )

    def _load_dev_api_keys(self, exchange_type: ExchangeType):
        """Load dev api keys from config"""
        if exchange_type == ExchangeType.BINANCE:
            self._api_key = config.BINANCE_API_KEY
            self._api_secret = config.BINANCE_API_SECRET
        elif exchange_type == ExchangeType.COINBASE:
            self._api_key = config.COINBASE_API_KEY
            self._api_secret = config.COINBASE_API_SECRET
        else:
            raise Exception("Error loading api key... Exchange type not supported")

    def _handle_exception(self, func):
        def wrapper(*args, **kwargs):
            try:
                return func(*args, **kwargs)
            except Exception as e:
                logging.error(f"Error in {func.__name__}: {e}")

        return wrapper

    def get_account(self) -> dict:
        """Get account information

        :return: The account details

        :rtype: dict
        """
        raise NotImplementedError

    def get_balance(self) -> list[dict]:
        """Get balance information

        :return: The balance details

        :rtype: list[dict]
        """
        raise NotImplementedError

    def get_ticker(self, symbol: str) -> dict:
        """Get ticker for a symbol

        :param symbol: The symbol to get ticker information for
        :type symbol: str

        :return: The ticker information for the symbol

        :rtype: dict
        """
        with Session(self._stream_engine) as session:
            ticker = session.query(TickerModel).filter_by(symbol=symbol).first()
            return TickerSchema().dump(ticker) if ticker else {}

    def get_last_price(self, symbol: str) -> float:
        """Get last price for a symbol

        :param symbol: The symbol to get ticker information for
        :type symbol: str

        :return: The ticker information for the symbol

        :rtype: float
        """
        return self.get_ticker(symbol).get("last_price", 0.0)

    def get_klines(self, symbol: str, interval: Interval) -> list:
        """Get klines for a symbol

        :param symbol: The symbol to get data for
        :type symbol: str

        :param interval: The interval to get data for
        :type interval: Interval

        :return: The symbol data

        :rtype: list
        """
        # return self.stream.get_klines(symbol, interval)
        raise NotImplementedError

    def get_historical_klines(self, symbol: str, **params) -> list[list]:
        """Get historical klines for a symbol

        :param symbol: The symbol to get data for
        :type symbol: str

        :param interval: The interval to get data for
        :type interval: str

        :param limit: The limit of data to get
        :type limit: int

        :return: The symbol data

        :rtype: list[list]
        """
        raise NotImplementedError

    def get_open_orders(self, symbol: str = None) -> list[dict]:
        """Get open orders

        :param symbol: The symbol to get open orders for
        :type symbol: str

        :return: The open orders

        :rtype: list[dict]
        """
        raise NotImplementedError

    def get_order(self, symbol: str, order_id: str) -> dict:
        """Get order

        :param symbol: The symbol to get order for
        :type symbol: str

        :param order_id: The order id to get order for
        :type order_id: str

        :return: The order

        :rtype: dict
        """
        raise NotImplementedError

    def get_order_id(self, order: dict) -> str:
        """Get order id

        :param order: The order to get id for
        :type order: dict

        :return: The order id

        :rtype: str
        """
        raise NotImplementedError

    def get_order_status(self, order: dict) -> OrderStatus:
        """Get order status

        :param order: The order to get status for
        :type order: dict

        :return: The order status

        :rtype: OrderStatus
        """
        raise NotImplementedError

    def create_order_params(
        self, config: dict, signal: Signal, last_price: float, **kwargs
    ) -> dict:
        """Create order parameters

        :param config: The bot config to create order parameters for
        :type config: dict

        :param signal: The signal of the order
        :type signal: Signal

        :param last_price: The last price of the symbol
        :type last_price: float

        :return: The order parameters

        :rtype: dict
        """
        min_cost = config["min_cost"]
        max_amount = config["max_amount"]

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
            "cost": float(
                f"{cost:.8f}"
            ),  # max 8 decimal place precision required by Binance
        }

    def create_order(self, order: dict) -> dict:
        """Create order

        :param symbol: The symbol to create order for
        :type symbol: str

        :param side: The side to create order for
        :type side: str

        :param type: The type to create order for
        :type type: str

        :param quantity: The quantity to create order for
        :type quantity: float

        :return: The order

        :rtype: dict
        """
        raise NotImplementedError

    def get_order_cost_and_amount(self, order: dict) -> dict:
        """Get order cost and amount

        :param order: The order to get cost and amount for
        :type order: dict

        :return: The order cost and amount

        :rtype: dict
        """
        raise NotImplementedError

    def get_min_order_cost(self, currency_pair: str) -> float:
        """Get minimum cost for a trade

        :param currency_pair: The currency pair to get minimum cost for
        :type currency_pair: str

        :return: The minimum cost

        :rtype: float
        """
        return 0.0

    def get_max_order_amount(self, currency_pair: str) -> float:
        """Get maximum amount for a trade

        :param currency_pair: The currency pair to get maximum amount for
        :type currency_pair: str

        :return: The maximum amount of the base currency that can be traded

        :rtype: float
        """
        return 0.0
