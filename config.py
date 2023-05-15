import os
from dotenv import load_dotenv

load_dotenv()


# Flask config class
class Config:
    SQLALCHEMY_DATABASE_URI = os.environ.get("SQLALCHEMY_DATABASE_URI")

config = Config()
