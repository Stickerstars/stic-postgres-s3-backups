# pg_dump can dump servers older than itself, so the newest client is a safe
# default. Alpine 3.23 ships the Postgres 16, 17 and 18 clients; an older
# POSTGRES_VERSION needs an older ALPINE_VERSION (see README).
ARG ALPINE_VERSION=3.23
FROM alpine:${ALPINE_VERSION} as alpine

ARG POSTGRES_VERSION=18
RUN apk add --no-cache postgresql$POSTGRES_VERSION-client \
      aws-cli
WORKDIR /scripts

COPY backup.sh .
ENTRYPOINT [ "sh", "backup.sh" ]
