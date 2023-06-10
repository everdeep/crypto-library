from sqlalchemy import Column, Integer, String, Float, DateTime, Boolean
from sqlalchemy.orm import declarative_base
from sqlalchemy.sql import func

Base = declarative_base()


class KlinesModel(Base):
    __tablename__ = "klines"

    id = Column(Integer, primary_key=True)
    symbol = Column(String(20), unique=True, nullable=False)
    kline_start_time = Column(Float, nullable=False)
    kline_close_time = Column(Float, nullable=False)
    interval = Column(String(20), nullable=False)
    first_trade_id = Column(Float, nullable=False)
    last_trade_id = Column(Float, nullable=False)
    open_price = Column(Float, nullable=False)
    close_price = Column(Float, nullable=False)
    high_price = Column(Float, nullable=False)
    low_price = Column(Float, nullable=False)
    base_volume = Column(Float, nullable=False)
    number_of_trades = Column(Float, nullable=False)
    is_closed = Column(Boolean, nullable=False)
    quote = Column(Float, nullable=False)
    taker_by_base_asset_volume = Column(Float, nullable=False)
    taker_by_quote_asset_volume = Column(Float, nullable=False)
    updated_at = Column(
        DateTime, nullable=False, default=func.now(), onupdate=func.now()
    )

    def as_dict(self):
        return {c.name: getattr(self, c.name) for c in self.__table__.columns}
