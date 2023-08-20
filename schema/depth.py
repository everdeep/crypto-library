from marshmallow_enum import EnumField
from marshmallow_sqlalchemy import SQLAlchemyAutoSchema

from cryptolib.model import DepthModel
from cryptolib.enums import DepthSide

# IMPORTANT: This is needed to make the marshmallow_sqlalchemy work
# import after the models are defined and before the marshmallow schemas
from sqlalchemy.orm import configure_mappers

configure_mappers()


class DepthSchema(SQLAlchemyAutoSchema):
    side = EnumField(DepthSide, by_value=True)
    
    class Meta:
        model = DepthModel
