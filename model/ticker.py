from sqlalchemy import Column, Integer, String, Float, DateTime
from sqlalchemy.orm import declarative_base
from sqlalchemy.sql import func

Base = declarative_base()


class TickerModel(Base):
    __tablename__ = "tickers"

    id = Column(Integer, primary_key=True)
    symbol = Column(String(20), unique=True, nullable=False)
    price_change = Column(Float, nullable=False)
    price_change_percent = Column(Float, nullable=False)
    weighted_average_price = Column(Float, nullable=False)
    trade_before_24h_window = Column(Float, nullable=False)
    last_price = Column(Float, nullable=False)
    last_quantity = Column(Float, nullable=False)
    best_bid_price = Column(Float, nullable=False)
    best_bid_quantity = Column(Float, nullable=False)
    best_ask_price = Column(Float, nullable=False)
    best_ask_quantity = Column(Float, nullable=False)
    open_price = Column(Float, nullable=False)
    high_price = Column(Float, nullable=False)
    low_price = Column(Float, nullable=False)
    total_traded_base_asset_volume = Column(Float, nullable=False)
    total_traded_quote_asset_volume = Column(Float, nullable=False)
    total_nr_of_trades = Column(Float, nullable=False)
    updated_at = Column(
        DateTime, nullable=False, default=func.now(), onupdate=func.now()
    )

    def as_dict(self):
        return {c.name: getattr(self, c.name) for c in self.__table__.columns}
