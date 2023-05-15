from sqlalchemy import Column, ForeignKey, Table, Integer
from sqlalchemy.orm import declarative_base

from .user import UserModel
from .role import RoleModel

Base = declarative_base()

roles_users = Table(
    "roles_users",
    Base.metadata,
    Column('user_id', ForeignKey(UserModel.id, ondelete="CASCADE"), primary_key=True),
    Column('role_id', ForeignKey(RoleModel.id, ondelete="CASCADE"), primary_key=True),
)