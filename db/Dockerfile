FROM postgres:alpine3.14

COPY ./final_db.sql /docker-entrypoint-initdb.d
COPY ./test_db.sql /docker-entrypoint-initdb.d
