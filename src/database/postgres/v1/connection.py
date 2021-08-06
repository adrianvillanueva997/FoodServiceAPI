from sqlalchemy import create_engine

from src.utils.config import POSTGRESQL_URL

engine = create_engine(POSTGRESQL_URL)
