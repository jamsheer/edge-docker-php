FROM ubuntu:16.04

COPY . /

RUN /build.sh

ENV ENABLE_CRON=Off \
    PHP_DISPLAY_ERRORS=Off \
    PHP_OPCACHE_VALIDATE=On \
    PHP_MAX_CHILDREN=10 \
    PHP_TIMEZONE=Europe/London \
    NGINX_SSL=Off \
    NGINX_HSTS=Off \
    XDEBUG_ENABLE=Off \
    SMTP_HOST= \
    SMTP_PORT= \
    SMTP_USER= \
    SMTP_PASS= \
    SMTP_FROM=

EXPOSE 80 443

WORKDIR /var/www

ENTRYPOINT ["/entrypoint.sh"]

CMD ["/usr/bin/supervisord"]
