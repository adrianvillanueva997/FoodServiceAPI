FROM postgres:alpine3.14

ADD ./final_db.sql /docker-entrypoint-initdb.d
ADD ./test_db.sql /docker-entrypoint-initdb.d
