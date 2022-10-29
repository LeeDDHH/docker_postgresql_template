FROM postgres:14.5-alpine
COPY ./script /docker-entrypoint-initdb.d
COPY ./config/postgresql.conf /etc/postgresql/postgresql.conf
