FROM eclipse-mosquitto

WORKDIR /mosquitto

RUN apk update && apk add --no-cache wget

COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/usr/sbin/mosquitto", "-c", "config/mosquitto.conf"]