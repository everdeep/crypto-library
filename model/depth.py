from sqlalchemy import Column, Integer, String, Float, DateTime, Enum
from sqlalchemy.orm import declarative_base
from sqlalchemy.sql import func

from uuid import uuid4

from cryptolib.enums import DepthSide

Base = declarative_base()


def get_uuid():
    return uuid4().hex


class DepthModel(Base):
    __tablename__ = "depth"

    id = Column(String(32), primary_key=True, unique=True, default=get_uuid)
    symbol = Column(String(20), nullable=False)
    price = Column(Float, nullable=False)
    quantity = Column(Float, nullable=False)
    side = Column(Enum(DepthSide), nullable=False)
    created_at = Column(DateTime, nullable=False, default=func.now())

    def as_dict(self):
        return {c.name: getattr(self, c.name) for c in self.__table__.columns}
