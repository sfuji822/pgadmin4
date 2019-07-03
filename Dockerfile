FROM python:alpine
ENV PGADMIN_VERSION 4.9
ENV PGADMIN_SETUP_EMAIL admin@pgadmin.org
ENV PGADMIN_SETUP_PASSWORD admin
RUN apk --update add gcc make musl-dev libffi-dev python3-dev postgresql-dev &&\
    rm -rf /var/cache/apk/*
RUN pip3 --no-cache-dir install https://ftp.postgresql.org/pub/pgadmin/pgadmin4/v${PGADMIN_VERSION}/pip/pgadmin4-${PGADMIN_VERSION}-py2.py3-none-any.whl
COPY config_local.py /usr/local/lib/python3.7/site-packages/pgadmin4
COPY start-pgadmin4 /usr/local/bin
EXPOSE 5050
