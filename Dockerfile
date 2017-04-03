FROM alpine:3.5

ENV UNBOUND_LOG_QUERIES=no

EXPOSE 53/tcp 53/udp

RUN apk add --no-cache unbound dumb-init

COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
