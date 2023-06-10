from marshmallow_sqlalchemy import SQLAlchemyAutoSchema

from cryptolib.model import TickerModel

# IMPORTANT: This is needed to make the marshmallow_sqlalchemy work
# import after the models are defined and before the marshmallow schemas
from sqlalchemy.orm import configure_mappers

configure_mappers()


class TickerSchema(SQLAlchemyAutoSchema):
    class Meta:
        model = TickerModel
