import os
import logging
from threading import Lock
from cryptolib.enums import Interval, DepthSide
from cryptolib.model import TickerModel, KlinesModel, DepthModel
from cryptolib.schema import TickerSchema, DepthSchema
from cryptolib.config import config
from unicorn_binance_websocket_api.manager import BinanceWebSocketApiManager
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

# Log all the websocket messages to a file
logging.basicConfig(
    filename="../logs/stream.log",
    filemode="a",
    format="%(asctime)s - %(name)s - %(levelname)s - %(message)s",
    level=logging.INFO,
)

class SingletonMeta(type):
    # Thread safe singleton
    _instances = {}
    _lock: Lock = Lock()

    def __call__(cls, *args, **kwargs):
        """
        Possible changes to the value of the `__init__` argument do not affect
        the returned instance.
        """
        with cls._lock:
            if cls not in cls._instances:
                logging.info(f"Creating new instance of {cls}")
                instance = super().__call__(*args, **kwargs)
                cls._instances[cls] = instance
        return cls._instances[cls]


class Stream(metaclass=SingletonMeta):
    STREAM_URL = "binance.com"
    SANDBOX_URL = "binance.com-testnet"

    # NOTE: Max stream limit is 1024 per connection
    #       Stream amount is markets * channels. IP will get banned
    #       if we keep exceeding the limit
    MARKETS = [
        "rvnusdt",
        "btcdownusdt",
        "wavesusdt",
        "omusdt",
        "sntusdt",
        "shibusdt",
        "xzcusdt",
        "datausdt",
        "fluxusdt",
        "tvkusdt",
        "sandusdt",
        "burgerusdt",
        "aaveupusdt",
        "winusdt",
        "straxusdt",
        "kncusdt",
        "chessusdt",
        "xlmupusdt",
        "alcxusdt",
        "kmdusdt",
        "fxsusdt",
        "srmusdt",
        "pepeusdt",
        "sklusdt",
        "grtusdt",
        "dentusdt",
        "dgbusdt",
        "linkusdt",
        "aavedownusdt",
        "ctsiusdt",
        "btsusdt",
        "ardrusdt",
        "anyusdt",
        "keyusdt",
        "xtzusdt",
        "bswusdt",
        "trxupusdt",
        "stxusdt",
        "spellusdt",
        "nmrusdt",
        "bttcusdt",
        "fttusdt",
        "cvcusdt",
        "forusdt",
        "sxpupusdt",
        "bandusdt",
        "wingusdt",
        "hardusdt",
        "klayusdt",
        "troyusdt",
        "perlusdt",
        "gnousdt",
        "psgusdt",
        "irisusdt",
        "nknusdt",
        "mdtusdt",
        "unfiusdt",
        "wbtcusdt",
        "reefusdt",
        "sfpusdt",
        "peopleusdt",
        "tkousdt",
        "btcusdt",
        "acmusdt",
        "iostusdt",
        "astrusdt",
        "dotdownusdt",
        "adausdt",
        "rplusdt",
        "leverusdt",
        "dashusdt",
        "vibusdt",
        "dfusdt",
        "firousdt",
        "yfidownusdt",
        "woousdt",
        "btcupusdt",
        "rsrusdt",
        "audiousdt",
        "eosusdt",
        "stmxusdt",
        "bakeusdt",
        "qtumusdt",
        "dydxusdt",
        "uniusdt",
        "truusdt",
        "iotausdt",
        "hiveusdt",
        "radusdt",
        "fiousdt",
        "hotusdt",
        "bicousdt",
        "mcousdt",
        "ethbullusdt",
        "scrtusdt",
        "axsusdt",
        "hcusdt",
        "bnbbullusdt",
        "ethusdt",
        "atomusdt",
        "sysusdt",
        "dotusdt",
        "runeusdt",
        "plausdt",
        "hifiusdt",
        "dotupusdt",
        "kavausdt",
        "kp3rusdt",
        "xlmusdt",
        "filusdt",
        "cityusdt",
        "ssvusdt",
        "xrpusdt",
        "cocosusdt",
        "linausdt",
        "filupusdt",
        "tribeusdt",
        "gtousdt",
        "qkcusdt",
        "yfiupusdt",
        "xlmdownusdt",
        "elfusdt",
        "mdxusdt",
        "algousdt",
        "yggusdt",
        "oneusdt",
        "bttusdt",
        "gnsusdt",
        "ookiusdt",
        "slpusdt",
        "sxpdownusdt",
        "sushiusdt",
        "linkdownusdt",
        "rndrusdt",
        "promusdt",
        "audusdt",
        "atmusdt",
        "superusdt",
        "injusdt",
        "xvsusdt",
        "mobusdt",
        "jstusdt",
        "zenusdt",
        "gbpusdt",
        "flmusdt",
        "bccusdt",
        "btgusdt",
        "kdausdt",
        "ltcdownusdt",
        "alpacausdt",
        "ogusdt",
        "neblusdt",
        "sunusdt",
        "xvgusdt",
        "vgxusdt",
        "pyrusdt",
        "degousdt",
        "beamusdt",
        "lqtyusdt",
        "iotxusdt",
        "epxusdt",
        "xrpupusdt",
        "xrpbearusdt",
        "oaxusdt",
        "mblusdt",
        "vetusdt",
        "polyxusdt",
        "blzusdt",
        "vidtusdt",
        "perpusdt",
        "lptusdt",
        "farmusdt",
        "acausdt",
        "flokiusdt",
        "ghstusdt",
        "antusdt",
        "lendusdt",
        "roseusdt",
        "cosusdt",
        "btcstusdt",
        "ctxcusdt",
        "eurusdt",
        "darusdt",
        "utkusdt",
        "bchusdt",
        "dexeusdt",
        "tctusdt",
        "osmousdt",
        "voxelusdt",
        "rayusdt",
        "stratusdt",
        "icxusdt",
        "renusdt",
        "etcusdt",
        "vthousdt",
        "repusdt",
        "icpusdt",
        "movrusdt",
        "minausdt",
        "arusdt",
        "celousdt",
        "dockusdt",
        "chzusdt",
        "xrpdownusdt",
        "aptusdt",
        "bchupusdt",
        "bnxusdt",
        "bsvusdt",
        "trxdownusdt",
        "betausdt",
        "nearusdt",
        "ftmusdt",
        "twtusdt",
        "xemusdt",
        "funusdt",
        "trxusdt",
        "adaupusdt",
        "dogeusdt",
        "crvusdt",
        "badgerusdt",
        "ilvusdt",
        "fisusdt",
        "bnbbearusdt",
        "nexousdt",
        "juvusdt",
        "pundixusdt",
        "oceanusdt",
        "nulsusdt",
        "joeusdt",
        "eosbullusdt",
        "ltcupusdt",
        "stormusdt",
        "diausdt",
        "requsdt",
        "lokausdt",
        "storjusdt",
        "multiusdt",
        "galusdt",
        "ognusdt",
        "bondusdt",
        "arbusdt",
        "maticusdt",
        "sxpusdt",
        "stptusdt",
        "wanusdt",
        "avaxusdt",
        "atausdt",
        "mboxusdt",
        "lskusdt",
        "ongusdt",
        "bifiusdt",
        "cotiusdt",
        "wrxusdt",
        "ltcusdt",
        "alphausdt",
        "bntusdt",
        "snxusdt",
        "portousdt",
        "usdsusdt",
        "ampusdt",
        "barusdt",
        "duskusdt",
        "paxgusdt",
        "epsusdt",
        "enjusdt",
        "suiusdt",
        "qiusdt",
        "sushidownusdt",
        "bullusdt",
        "api3usdt",
        "gmtusdt",
        "gtcusdt",
        "ethbearusdt",
        "ambusdt",
        "achusdt",
        "mirusdt",
        "ancusdt",
        "gasusdt",
        "polyusdt",
        "ldousdt",
        "bkrwusdt",
        "yfiusdt",
        "gmxusdt",
        "reiusdt",
        "linkupusdt",
        "dntusdt",
        "ernusdt",
        "ethdownusdt",
        "hbarusdt",
        "compusdt",
        "glmrusdt",
        "eosbearusdt",
        "stgusdt",
        "mlnusdt",
        "rlcusdt",
        "maskusdt",
        "frontusdt",
        "bethusdt",
        "pntusdt",
        "jasmyusdt",
        "bzrxusdt",
        "galausdt",
        "unidownusdt",
        "ustcusdt",
        "tomousdt",
        "imxusdt",
        "powrusdt",
        "dcrusdt",
        "aliceusdt",
        "rampusdt",
        "uftusdt",
        "ethupusdt",
        "tfuelusdt",
        "cvpusdt",
        "cfxusdt",
        "scusdt",
        "eduusdt",
        "xtzupusdt",
        "rdntusdt",
        "ctkusdt",
        "keepusdt",
        "ankrusdt",
        "eosdownusdt",
        "hntusdt",
        "alpineusdt",
        "agldusdt",
        "bnbusdt",
        "eosupusdt",
        "venusdt",
        "tornusdt",
        "drepusdt",
        "xrpbullusdt",
        "mtlusdt",
        "mkrusdt",
        "prosusdt",
        "zrxusdt",
        "bnbupusdt",
        "clvusdt",
        "dodousdt",
        "sushiupusdt",
        "aergousdt",
        "viteusdt",
        "c98usdt",
        "paxusdt",
        "usdpusdt",
        "ksmusdt",
        "magicusdt",
        "adxusdt",
        "wtcusdt",
        "1inchupusdt",
        "uniupusdt",
        "tlmusdt",
        "trbusdt",
        "phbusdt",
        "solusdt",
        "1inchusdt",
        "luncusdt",
        "avausdt",
        "umausdt",
        "xmrusdt",
        "qntusdt",
        "ornusdt",
        "synusdt",
        "aaveusdt",
        "npxsusdt",
        "mithusdt",
        "ckbusdt",
        "autousdt",
        "oxtusdt",
        "santosusdt",
        "quickusdt",
        "apeusdt",
        "laziousdt",
        "bnbdownusdt",
        "zecusdt",
        "hftusdt",
        "waxpusdt",
        "thetausdt",
        "forthusdt",
        "aionusdt",
        "ontusdt",
        "nbsusdt",
        "ltousdt",
        "polsusdt",
        "cvxusdt",
        "daiusdt",
        "egldusdt",
        "bearusdt",
        "mcusdt",
        "nanousdt",
        "xnousdt",
        "celrusdt",
        "1inchdownusdt",
        "usdsbusdt",
        "neousdt",
        "rgtusdt",
        "glmusdt",
        "opusdt",
        "usdcusdt",
        "agixusdt",
        "adadownusdt",
        "batusdt",
        "rareusdt",
        "nuusdt",
        "phausdt",
        "ensusdt",
        "idexusdt",
        "fildownusdt",
        "akrousdt",
        "gxsusdt",
        "omgusdt",
        "yfiiusdt",
        "chrusdt",
        "auctionusdt",
        "idusdt",
        "tusdusdt",
        "ustusdt",
        "arpausdt",
        "xtzdownusdt",
        "balusdt",
        "pondusdt",
        "cakeusdt",
        "fidausdt",
        "tusdt",
        "fetusdt",
        "busdusdt",
        "xecusdt",
        "belusdt",
        "mftusdt",
        "asrusdt",
        "wnxmusdt",
        "astusdt",
        "steemusdt",
        "litusdt",
        "highusdt",
        "zilusdt",
        "flowusdt",
        "erdusdt",
        "rifusdt",
        "susdusdt",
        "lrcusdt",
        "hookusdt",
        "loomusdt",
        "bchdownusdt",
    ]

    # NOTE: Max 5 connections per IP
    CHANNELS = ["ticker"]
    # CHANNELS = ["ticker", "kline_1m", "depth5"]

    def __init__(
        self,
        sandbox: bool,
        markets: list[str] = None,
        channels: list[str] = None,
        db_enabled: bool = False,
    ):
        self._sandbox = sandbox
        self._streams = []
        self.stream_data = {}
        self.depth = []

        logging.info("Initializing Binance Websocket API")

        if markets:
            self.MARKETS = markets

        if channels:
            self.CHANNELS = channels

        logging.info(f"Streaming on {len(self.CHANNELS)} channels: {self.CHANNELS}")
        logging.info(f"Tracking {len(self.MARKETS)} markets: {self.MARKETS}")

        # Setup database if enabled
        self.db_enabled = db_enabled
        if self.db_enabled:
            logging.info("Database logging enabled. Connecting to database...")
            self._engine = create_engine(
                config.STREAM_DB_URI, echo=False, pool_size=20, max_overflow=0
            )
            self.Session = sessionmaker(bind=self._engine)

        # Setup websocket manager
        logging.info("Initializing websocket manager")
        self._manager = BinanceWebSocketApiManager(
            exchange=self.STREAM_URL if not self._sandbox else self.SANDBOX_URL,
            output_default="UnicornFy",
        )

        logging.info("Binance Websocket API Initialized")

        # self.start()

    def start(self):
        """Start the websocket connection"""

        logging.info("Starting websocket live connection")

        if len(self.CHANNELS) > 5:
            logging.warning("Max 5 connections per IP")
            raise ValueError("Max 5 connections per IP")

        if len(self.MARKETS) > 1024:
            logging.warning("Max 1024 markets per connection")
            raise ValueError("Max 1024 markets per connection")
        
        self.stream_data = {}

        for channel in self.CHANNELS:
            if "kline" in channel:
                func = getattr(self, "_process_kline")
            elif "depth" in channel:
                func = getattr(self, "_process_depth")
            else:
                func = getattr(self, f"_process_{channel}")

            logging.info(f"Creating stream for {channel}")
            
            stream = self._manager.create_stream(
                channel,
                markets=self.MARKETS,
                stream_label=channel,
                process_stream_data=func,
            )
            self._streams.append(stream)

            logging.info(f"Successfully created stream for {channel}")

    def stop(self):
        """Stop the websocket connection"""
        logging.info("Stopping websocket live connection")
        self._manager.stop_manager_with_all_streams()
        self._streams = []
        logging.info("Successfully stopped websocket live connection")

    def _process_ticker(self, data):
        """Process new stream data"""
        try:
            stream_type = data["stream_type"].split("@")[1]
            if stream_type not in self.stream_data:
                self.stream_data[stream_type] = {}

            symbol = data.get("data", {})[0].get("symbol")

            if self.db_enabled:
                self._save_db(
                    tablename=TickerModel.__tablename__,
                    symbol=symbol,
                    data=data.get("data", {})[0],
                )
            else:
                self.stream_data[stream_type][symbol] = data.get("data", {})[0]

        except KeyError as e:
            logging.error(f"Error processing ticker with key value: {e}")
            logging.error(f"Data: {data}")

    def _process_kline(self, data):
        """Process new stream data"""
        try:
            stream_type = data["stream_type"].split("@")[1]
            if stream_type not in self.stream_data:
                self.stream_data[stream_type] = {}

            symbol = data["symbol"]
            self.stream_data[stream_type][symbol] = data.get("kline", {})
        except KeyError as e:
            logging.error(f"Error processing kline with key value: {e}")
            logging.error(f"Data: {data}")

    def _process_depth(self, data):
        """Process new stream data"""
        try:
            stream_type = "depth"
            if stream_type not in self.stream_data:
                self.stream_data[stream_type] = {}

            symbol = data["symbol"]
            self.stream_data[stream_type][symbol] = {
                "bids": [[float(row[0]), float(row[1])] for row in data["bids"]],
                "asks": [[float(row[0]), float(row[1])] for row in data["asks"]],
            }

            if self.db_enabled:
                self._save_db(
                    tablename=DepthModel.__tablename__,
                    symbol=symbol,
                    data=data,
                )
        except KeyError as e:
            logging.error(f"Error processing depth with key value: {e}")
            logging.error(f"Data: {data}")

    def _remove_columns(self, data, columns):
        """Remove columns from data"""
        for column in columns:
            data.pop(column, None)

        return data

    def _save_db(self, tablename, symbol, data, **kwargs):
        """Save data to database"""
        if not self.db_enabled:
            return

        if not kwargs.get("interval") and tablename == KlinesModel.__tablename__:
            logging.warning("Missing interval argument for kline data")
            raise ValueError("Missing interval argument for kline data")

        with self.Session() as session:
            try:
                if tablename == TickerModel.__tablename__:
                    self._remove_columns(
                        data,
                        [
                            "event_time",
                            "stream_type",
                            "event_type",
                            "statistics_open_time",
                            "statistics_close_time",
                            "first_trade_id",
                            "last_trade_id",
                        ],
                    )
                    ticker = session.query(TickerModel).filter_by(symbol=symbol).first()
                    if ticker:
                        # update existing ticker
                        for key, value in data.items():
                            setattr(ticker, key, value)
                    else:
                        # create new ticker
                        ticker = TickerModel(**data)
                        session.add(ticker)

                elif tablename == KlinesModel.__tablename__:
                    kline = (
                        session.query(KlinesModel)
                        .filter_by(symbol=symbol, interval=kwargs["interval"])
                        .first()
                    )
                    if kline:
                        # update existing kline
                        for key, value in data.items():
                            setattr(kline, key, value)
                    else:
                        # create new kline
                        kline = KlinesModel(**data)
                        session.add(kline)

                elif tablename == DepthModel.__tablename__:
                    # Clear old data
                    session.query(DepthModel).filter_by(symbol=symbol).delete()
                    session.flush()

                    # Create new Bid records
                    for bid in data["bids"]:
                        depth = DepthModel(
                            symbol=symbol,
                            price=bid[0],
                            quantity=bid[1],
                            side=DepthSide.BID,
                        )
                        session.add(depth)

                    # Create new Ask records
                    for ask in data["asks"]:
                        depth = DepthModel(
                            symbol=symbol,
                            price=ask[0],
                            quantity=ask[1],
                            side=DepthSide.ASK,
                        )
                        session.add(depth)

            except Exception as e:
                logging.error(f"Failed to save {tablename} data to database: {e}")
                self.stop()

            session.commit()

    def get_ticker(self, symbol: str) -> dict:
        """Get ticker

        :param symbol: The symbol to get ticker for
        :type symbol: str

        :return: The ticker
        :rtype: dict
        """
        if self.db_enabled:
            with self.Session() as session:
                ticker = session.query(TickerModel).filter_by(symbol=symbol).first()
                return TickerSchema().dump(ticker)

        return self.stream_data.get("ticker", {}).get(symbol, {})

    def get_klines(self, symbol: str, interval: Interval) -> list:
        """Get klines

        :param symbol: The symbol to get klines for
        :type symbol: str

        :return: The klines
        :rtype: list
        """

        if self.db_enabled:
            with self.Session() as session:
                klines = (
                    session.query(KlinesModel)
                    .filter_by(symbol=symbol, interval=interval.value)
                    .first()
                )
                return klines

        return self.stream_data.get(f"kline_{interval.value}", {}).get(symbol, {})

    def get_depth(self, symbol: str) -> dict:
        """Get depth

        :param symbol: The symbol to get depth for
        :type symbol: str

        :return: The depth
        :rtype: dict
        """

        if self.db_enabled:
            with self.Session() as session:
                depth = session.query(DepthModel).filter_by(symbol=symbol).all()
                deserialised = DepthSchema(many=True).dump(depth)
                bids = [
                    [row["price"], row["quantity"]]
                    for row in deserialised
                    if row["side"] == DepthSide.BID.value
                ]
                asks = [
                    [row["price"], row["quantity"]]
                    for row in deserialised
                    if row["side"] == DepthSide.ASK.value
                ]
                return {"bids": bids, "asks": asks}

        return self.stream_data.get("depth", {}).get(symbol, {})
