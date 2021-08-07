import os
from os.path import join, dirname
from dotenv import load_dotenv
from slowapi import Limiter, _rate_limit_exceeded_handler
from slowapi.util import get_remote_address
from slowapi.errors import RateLimitExceeded


limiter = Limiter(key_func=get_remote_address)

dotenv_path = join(dirname(__file__), "../../.env")
load_dotenv(dotenv_path)

ENVIRONMENT = os.environ.get("environment")
POSTGRESQL_URL = (
    os.environ.get("prod_postgres_db")
    if ENVIRONMENT == "dev"
    else os.environ.get("test_postgres_db")
)
