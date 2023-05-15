from marshmallow.fields import List
from marshmallow_sqlalchemy import SQLAlchemyAutoSchema

from cryptolib.model import UserModel
from cryptolib.utils.marshmallow import Nested

# IMPORTANT: This is needed to make the marshmallow_sqlalchemy work
# import after the models are defined and before the marshmallow schemas
from sqlalchemy.orm import configure_mappers

configure_mappers()


class UserSchema(SQLAlchemyAutoSchema):
    class Meta:
        model = UserModel
        fields = (
            "id",
            "email",
            "first_name",
            "last_name",
            "username",
            "dob",
            "phone",
            "address",
            "portfolio",
            "settings",
            "roles",
            "is_verified",
        )
        

    settings = List(Nested("UserSettingsSchema"))
    address = Nested("AddressSchema")
    portfolio = Nested("PortfolioSchema")
    roles = List(Nested("RoleSchema"))
