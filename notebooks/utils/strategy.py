from enum import Enum
import numpy as np
import pandas as pd


class StrategyParamsEnum(Enum):
    """Enum for strategy parameters"""

    MACD = {"short_window": (1, 20), "long_window": (20, 40), "signal_window": (1, 5)}
    BOLLINGER_BANDS = {"window": (1, 40), "std": (1, 10)}
    STOCHASTIC_OSCILLATOR = {"window": (1, 60)}
    WILLIAMS_R = {"window": (1, 60)}
    AVERAGE_DIRECTIONAL_INDEX = {"window": (1, 60)}
    COMMODITY_CHANNEL_INDEX = {"window": (1, 60)}
    RSI = {"window": (1, 60)}
    CHAIKIN_OSCILLATOR = {"short_window": (1, 30), "long_window": (10, 40)}
    ACCUMULATION_DISTRIBUTION = {"window": (1, 60)}
    EASE_OF_MOVEMENT = {"window": (1, 60)}
    FORCE_INDEX = {"window": (1, 60)}
    ULTIMATE_OSCILLATOR = {"window1": (1, 20), "window2": (20, 40), "window3": (40, 60)}
    DONCHIAN_CHANNEL = {"window": (1, 60)}
    KELTNER_CHANNEL = {"window": (1, 60)}
    KNOW_SURE_THING = {
        "window1": (1, 15),
        "window2": (10, 25),
        "window3": (20, 35),
        "window4": (25, 40),
    }
    TRIX = {"window": (1, 60)}


class Strategy:
    def __init__(self, data, p=1.0):
        self.data = data
        self.p = p

    def apply_buy_probability(self, signals, a, b):
        for i in range(1, len(signals)):
            if type(b) == int:
                if a[i] > b:
                    signals[i] = np.random.choice([0, 1], p=[1 - self.p, self.p])
            else:
                if a[i] > b[i]:
                    signals[i] = np.random.choice([0, 1], p=[1 - self.p, self.p])
        return signals

    def macd(self, short_window=12, long_window=26, signal_window=9):
        """Plots the macd for a cryptocurrency symbol"""
        close = self.data.get("close")
        short_ema = close.ewm(span=short_window, adjust=False).mean()
        long_ema = close.ewm(span=long_window, adjust=False).mean()
        macd = short_ema - long_ema
        signals = macd.ewm(span=signal_window, adjust=False).mean()
        signals = pd.Series(0, index=self.data.index)
        signals[macd < signals] = -1
        signals = self.apply_buy_probability(signals, macd, signals)
        return signals

    def bollinger_bands(self, window=20, std=2):
        close = self.data.get("close")
        rolling_mean = close.rolling(window=window).mean()
        rolling_std = close.rolling(window=window).std()
        upper_band = rolling_mean + (rolling_std * std)
        lower_band = rolling_mean - (rolling_std * std)
        signals = pd.Series(0, index=self.data.index)
        # signals[self.data["close"] > upper_band] = 1
        signals[self.data["close"] < lower_band] = -1
        signals = self.apply_buy_probability(signals, self.data["close"], upper_band)
        return signals

    def stochastic_oscillator(self, window=14):
        """Plots the stochastic oscillator for a cryptocurrency symbol"""
        close = self.data.get("close")
        high = self.data.get("high")
        low = self.data.get("low")
        k = 100 * (
            (close - low.rolling(window).min())
            / (high.rolling(window).max() - low.rolling(window).min())
        )
        d = k.rolling(3).mean()
        signals = pd.Series(0, index=self.data.index)
        # signals[k > d] = 1
        signals[k < d] = -1
        signals = self.apply_buy_probability(signals, k, d)
        return signals

    def williams_r(self, window=14):
        """Plots the williams r for a cryptocurrency symbol"""
        close = self.data.get("close")
        high = self.data.get("high")
        low = self.data.get("low")
        r = 100 * (
            (high.rolling(window).max() - close)
            / (high.rolling(window).max() - low.rolling(window).min())
        )
        signals = pd.Series(0, index=self.data.index)
        signals[r < -80] = 1
        signals[r > -20] = -1
        signals = self.apply_buy_probability(
            signals,
        )
        return signals

    def average_directional_index(self, window=14):
        """Plots the average directional index for a cryptocurrency symbol"""
        close = self.data.get("close")
        high = self.data.get("high")
        low = self.data.get("low")
        tr = high - low
        tr1 = high - close.shift(1)
        tr2 = close.shift(1) - low
        tr = tr.combine(tr1, max).combine(tr2, max)
        tr = tr.rolling(window).sum()
        dm = high - high.shift(1)
        dm1 = low.shift(1) - low
        dm = dm.combine(dm1, max)
        dm = dm.clip(lower=0)
        dm = dm.rolling(window).sum()
        pdi = dm / tr
        mdi = -dm / tr
        dx = (pdi - mdi).abs() / (pdi + mdi)
        adx = dx.rolling(window).mean()
        signals = pd.Series(0, index=self.data.index)
        signals[adx < 20] = 1
        signals[adx > 50] = -1
        signals = self.apply_buy_probability(signals)
        return signals

    def commodity_channel_index(self, window=20):
        """Plots the commodity channel index for a cryptocurrency symbol"""
        close = self.data.get("close")
        high = self.data.get("high")
        low = self.data.get("low")
        tp = (high + low + close) / 3
        cci = (tp - tp.rolling(window).mean()) / (0.015 * tp.rolling(window).std())
        signals = pd.Series(0, index=self.data.index)
        signals[cci < -100] = 1
        signals[cci > 100] = -1
        signals = self.apply_buy_probability(signals)
        return signals

    def rsi(self, window=14):
        """Plots the relative strength index for a cryptocurrency symbol"""
        close = self.data.get("close")
        delta = close.diff()
        up_days = delta.clip(lower=0)
        down_days = -1 * delta.clip(upper=0)
        ema_up = up_days.ewm(com=window - 1, adjust=True).mean()
        ema_down = down_days.ewm(com=window - 1, adjust=True).mean()
        rs = ema_up / ema_down
        rsi = 100 - (100 / (1 + rs))
        signals = pd.Series(0, index=self.data.index)
        signals[rsi < 30] = 1
        signals[rsi > 70] = -1
        signals = self.apply_buy_probability(signals)
        return signals

    def trix(self, window=14):
        """Plots the trix for a cryptocurrency symbol"""
        close = self.data.get("close")
        ema1 = close.ewm(span=window, adjust=False).mean()
        ema2 = ema1.ewm(span=window, adjust=False).mean()
        ema3 = ema2.ewm(span=window, adjust=False).mean()
        trix = ema3.pct_change()
        signals = pd.Series(0, index=self.data.index)
        signals[trix > 0] = 1
        signals[trix < 0] = -1
        signals = self.apply_buy_probability(signals)
        return signals

    def chaikin_oscillator(self, short_window=3, long_window=10):
        """Plots the chaikin oscillator for a cryptocurrency symbol"""
        close = self.data.get("close")
        high = self.data.get("high")
        low = self.data.get("low")
        volume = self.data.get("volume")
        adl = ((close - low) - (high - close)) / (high - low)
        adl = adl * volume
        adl = adl.rolling(short_window).sum() - adl.rolling(long_window).sum()
        signals = pd.Series(0, index=self.data.index)
        signals[adl > 0] = 1
        signals[adl < 0] = -1
        signals = self.apply_buy_probability(signals)
        return signals

    def know_sure_thing(self, window1=10, window2=15, window3=20, window4=30):
        """Plots the know sure thing for a cryptocurrency symbol"""
        close = self.data.get("close")
        roc1 = close.diff(window1)
        roc2 = close.diff(window2)
        roc3 = close.diff(window3)
        roc4 = close.diff(window4)
        kst = (roc1 * 1) + (roc2 * 2) + (roc3 * 3) + (roc4 * 4)
        kst = kst.rolling(9).mean()
        signals = pd.Series(0, index=self.data.index)
        signals[kst > 0] = 1
        signals[kst < 0] = -1
        signals = self.apply_buy_probability(signals)
        return signals

    def ichimoku_cloud(self):
        """Plots the ichimoku cloud for a cryptocurrency symbol"""
        close = self.data.get("close")
        high = self.data.get("high")
        low = self.data.get("low")
        conv = (high.rolling(9).max() + low.rolling(9).min()) / 2
        base = (high.rolling(26).max() + low.rolling(26).min()) / 2
        span_a = (conv + base) / 2
        span_b = (high.rolling(52).max() + low.rolling(52).min()) / 2
        signals = pd.Series(0, index=self.data.index)
        signals[close > span_a] = 1
        signals[close < span_b] = -1
        signals = self.apply_buy_probability(signals)
        return signals

    def parabolic_sar(self):
        """Plots the parabolic sar for a cryptocurrency symbol"""
        close = self.data.get("close")
        high = self.data.get("high")
        low = self.data.get("low")
        sar = close.copy()
        af = 0.02
        max_af = 0.2
        long = True
        ep = low[0]
        hp = high[0]
        lp = low[0]
        for i in range(2, len(close)):
            if long:
                sar[i] = sar[i - 1] + af * (hp - sar[i - 1])
            else:
                sar[i] = sar[i - 1] + af * (lp - sar[i - 1])
            if long and low[i] < sar[i]:
                long = False
                sar[i] = hp
                lp = low[i]
                af = 0.02
            elif not long and high[i] > sar[i]:
                long = True
                sar[i] = lp
                hp = high[i]
                af = 0.02
            elif long and high[i] > hp:
                hp = high[i]
                af = min(af + 0.02, max_af)
            elif not long and low[i] < lp:
                lp = low[i]
                af = min(af + 0.02, max_af)
        signals = pd.Series(0, index=self.data.index)
        signals[close > sar] = 1
        signals[close < sar] = -1
        signals = self.apply_buy_probability(signals)
        return signals

    def inverse_cramer_transform(self):
        """Plots the inverse cramer transform for a cryptocurrency symbol"""
        close = self.data.get("close")
        high = self.data.get("high")
        low = self.data.get("low")
        hl2 = (high + low) / 2
        hl2 = hl2.ewm(10).mean()
        hl2 = hl2.diff()
        hl2 = hl2.ewm(21).mean()
        hl2 = hl2.ewm(4).mean()
        signals = pd.Series(0, index=self.data.index)
        signals[close > hl2] = 1
        signals[close < hl2] = -1
        signals = self.apply_buy_probability(signals)
        return signals

    def vwap(self):
        """Plots the volume weighted average price for a cryptocurrency symbol"""
        close = self.data.get("close")
        high = self.data.get("high")
        low = self.data.get("low")
        volume = self.data.get("volume")
        tp = (high + low + close) / 3
        vwap = (tp * volume).cumsum() / volume.cumsum()
        signals = pd.Series(0, index=self.data.index)
        signals[close > vwap] = 1
        signals[close < vwap] = -1
        signals = self.apply_buy_probability(signals)
        return signals
