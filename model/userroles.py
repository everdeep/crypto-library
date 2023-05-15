from sqlalchemy import Column, Integer, ForeignKey
from sqlalchemy.orm import declarative_base

from .user import UserModel
from .role import RoleModel

Base = declarative_base()

class UserRoleModel(Base):
    __tablename__ = "roles_users"

    id = Column(Integer, primary_key=True)
    user_id = Column(
        Integer, ForeignKey(UserModel.id, ondelete="CASCADE"), nullable=False
    )
    role_id = Column(
        Integer, ForeignKey(RoleModel.id, ondelete="CASCADE"), nullable=False
    )
