import logging
import pandas as pd
from coinbase.wallet.client import Client
from coinbasepro.public_client import PublicClient

from cryptolib.enums import ExchangeType, OrderStatus, Signal, Interval
from cryptolib.model import CurrencyPairModel
from cryptolib.utils import interval_to_seconds

from sqlalchemy.orm import sessionmaker

from .base import Base


class Coinbase(Base):
    # Add stub method from parent

    def __init__(
        self, api_key: str = None, api_secret: str = None, passphrase: str = None
    ):
        super().__init__(api_key, api_secret, exchange_type=ExchangeType.COINBASE)

        self.fee = {
            "taker": 0.005,
            "maker": 0.005,
        }

        _API_URL = "https://api.coinbase.com"
        _API_PRO_URL = "https://api.pro.coinbase.com"
        _SANDBOX_URL = "https://api-public.sandbox.exchange.coinbase.com"

        API_VERSION = "2018-03-22"
        BASE_URL = _SANDBOX_URL if self.sandbox else _API_URL
        BASE_URL_PRO = _SANDBOX_URL if self.sandbox else _API_PRO_URL

        # coinbase client
        self.client = Client(
            api_key=self._api_key,
            api_secret=self._api_secret,
            base_api_uri=BASE_URL,
            api_version=API_VERSION,
        )
        self.client_pro = PublicClient(api_url=BASE_URL_PRO, rate_limit=0)

        self.Session = sessionmaker(bind=self._db_engine)

    def _map_symbol(self, symbol):
        with self.Session() as session:
            currency_pair: CurrencyPairModel = (
                session.query(CurrencyPairModel).filter_by(currency_pair=symbol).first()
            )
            if currency_pair is None:
                logging.error(f"Invalid symbol {symbol}")
                return {}

            return {
                "symbol": currency_pair.symbol,
                "pair": currency_pair.pair,
                "currency_pair": currency_pair.symbol + "-" + currency_pair.pair,
            }

    def get_account(self) -> dict:
        """Get account information

        :return: The account details

        :rtype: dict
        """
        res = self._handle_exception(self.client.get_accounts)()["data"]
        if res is None:
            logging.error(
                f"Failed to get account information from Coinbase API: sandboxed - {self.sandbox} api_key: {self._api_key}"
            )
            return {}

        return pd.DataFrame(res)

    def get_balance(self, symbol: str = None) -> list[dict]:
        """Get balance information

        :param symbol: The symbol to get balance information for
                       Not the currency pair. For example, BTC, ETH, etc.
        :type symbol: str

        :return: The balance details

        :rtype: list[dict]
        """
        accounts = self.get_account()
        balances = accounts[
            accounts["balance"].apply(lambda x: float(x.get("amount")) > 0)
            & accounts["id"].apply(lambda x: len(x) < 10)
        ]
        res = {
            balances.iloc[i]["id"]: {
                "free": float(balances.iloc[i]["balance"].get("amount")),
                "locked": 0.0,
                "total": float(balances.iloc[i]["balance"].get("amount")),
            }
            for i in range(len(balances))
        }

        if symbol:
            return res.get(symbol, {})
        
        return res

    def get_historical_klines(self, symbol: str, interval: str) -> list[list]:
        """Get klines for a symbol

        :param symbol: The symbol to get data for
        :type symbol: str

        :param interval: The interval of the data
        :type interval: int

        :return: The symbol data

        :rtype: DataFrame
        """

        symbol = self._map_symbol(symbol).get("currency_pair")
        if not symbol:
            return []

        granularity = interval_to_seconds(Interval(interval))
        # Coinbase only supports these intervals
        # 1m, 5m, 15m, 1h, 6h, 1d
        # https://docs.cloud.coinbase.com/exchange/reference/exchangerestapi_getproductcandles
        if granularity not in [60, 300, 900, 3600, 21600, 86400]:
            logging.error(f"Invalid interval {interval} for API: Coinbase")
            return []

        res = self._handle_exception(self.client_pro.get_product_historic_rates)(
            symbol, granularity=granularity
        )
        if res is None:
            logging.error(f"Failed to get klines for {symbol}")
            return []

        data = pd.DataFrame(
            res,
            columns=[
                "time",
                "high",
                "low",
                "open",
                "close",
                "volume",
            ],
        )
        data.set_index("time", inplace=True)
        return data

    def get_open_orders(self, symbol: str = None) -> list[dict]:
        """Get open orders

        :param symbol: The symbol to get open orders for
        :type symbol: str

        :return: The open orders

        :rtype: list[dict]
        """
        symbol = self._map_symbol(symbol).get("symbol")
        if not symbol:
            return []

        buys = self._handle_exception(self.client.get_buys)(
            symbol, status="created"
        ).get("data", [])
        sells = self._handle_exception(self.client.get_sells)(
            symbol, status="created"
        ).get("data", [])

        return buys + sells

    def get_order(self, symbol: str, order_id: str, **kwargs) -> dict:
        """Get order

        :param symbol: The symbol to get order for
        :type symbol: str

        :param order_id: The order id to get order for
        :type order_id: str

        :return: The order

        :rtype: dict
        """
        return self._handle_exception(self.client.get_buy)(symbol, order_id)

    def get_order_id(self, order: dict) -> str:
        """Get order id

        :param order: The order to get id for
        :type order: dict

        :return: The order id

        :rtype: str
        """
        return order["id"]

    def get_order_status(self, order: dict) -> OrderStatus:
        """Get order status

        :param order: The order to get status for
        :type order: dict

        :return: The order status

        :rtype: OrderStatus
        """
        return order["status"]

    def create_order_params(self, config: dict, signal: Signal, last_price: float):
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
        # Min trade amount is often 10 USD
        min_cost = 0.0

        # max amount of asset that one can buy/sell
        max_amount = 0.0

        return super().create_order_params(
            config, signal, last_price, max_amount, min_cost
        )

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
        self.client.buy('2bbf394c-193b-5b2a-9155-3b4732659ede',
                 amount="10",
                 currency="BTC",
                 payment_method="83562370-3e5c-51db-87da-752af5ab9559")

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
