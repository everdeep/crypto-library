from threading import Lock
from cryptolib.enums import Interval
from unicorn_binance_websocket_api.manager import BinanceWebSocketApiManager


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
    CHANNELS = ["ticker", "kline_1m"]

    def __init__(self, sandbox: bool):
        self._sandbox = sandbox
        self._streams = []
        self.stream_data = {}

        self._manager = BinanceWebSocketApiManager(
            exchange=self.STREAM_URL if not sandbox else self.SANDBOX_URL,
            output_default="UnicornFy",
        )

        self.start()

    def start(self):
        """Start the websocket connection"""
        if len(self.CHANNELS) > 5:
            raise ValueError("Max 5 connections per IP")

        if len(self.MARKETS) > 1024:
            raise ValueError("Max 1024 markets per connection")

        for channel in self.CHANNELS:
            func = None
            if "kline" in channel:
                func = getattr(self, "_process_kline")
            else:
                func = getattr(self, f"_process_{channel}")

            stream = self._manager.create_stream(
                channel,
                markets=self.MARKETS,
                stream_label=channel,
                process_stream_data=func,
            )
            self._streams.append(stream)

    def stop(self):
        """Stop the websocket connection"""
        self._manager.stop_manager_with_all_streams()

    def _process_ticker(self, data):
        """Process new stream data"""
        try:
            stream_type = data["stream_type"].split("@")[1]
            if stream_type not in self.stream_data:
                self.stream_data[stream_type] = {}

            symbol = data.get("data", {})[0].get("symbol")
            self.stream_data[stream_type][symbol] = data.get("data", {})[0]
        except KeyError:
            pass

    def _process_kline(self, data):
        """Process new stream data"""
        try:
            stream_type = data["stream_type"].split("@")[1]
            if stream_type not in self.stream_data:
                self.stream_data[stream_type] = {}

            symbol = data["symbol"]
            self.stream_data[stream_type][symbol] = data.get("kline", {})
        except KeyError:
            pass

    def get_ticker(self, symbol: str) -> dict:
        """Get ticker

        :param symbol: The symbol to get ticker for
        :type symbol: str

        :return: The ticker
        :rtype: dict
        """
        return self.stream_data.get("ticker", {}).get(symbol, {})

    def get_klines(self, symbol: str, interval: Interval) -> list:
        """Get klines

        :param symbol: The symbol to get klines for
        :type symbol: str

        :return: The klines
        :rtype: list
        """
        return self.stream_data.get(f"kline_{interval.value}", {}).get(symbol, {})
