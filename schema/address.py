from marshmallow_sqlalchemy import SQLAlchemyAutoSchema

from cryptolib.model import AddressModel

# IMPORTANT: This is needed to make the marshmallow_sqlalchemy work
# import after the models are defined and before the marshmallow schemas
from sqlalchemy.orm import configure_mappers

configure_mappers()


class AddressSchema(SQLAlchemyAutoSchema):
    class Meta:
        model = AddressModel
        include_fk = True
        load_instance = True
