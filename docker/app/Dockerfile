FROM php:7.2-alpine

ARG TZ
ENV TZ=${TZ:-'Europe/London'}

ARG XDEBUG_REMOTE_ENABLE
ENV XDEBUG_REMOTE_ENABLE ${XDEBUG_REMOTE_ENABLE:-'on'}

ARG XDEBUG_REMOTE_HOST
ENV XDEBUG_REMOTE_HOST ${XDEBUG_REMOTE_HOST:-'host.docker.internal'}

ARG XDEBUG_REMOTE_PORT
ENV XDEBUG_REMOTE_PORT ${XDEBUG_REMOTE_PORT:-'9000'}

ARG XDEBUG_REMOTE_AUTOSTART
ENV XDEBUG_REMOTE_AUTOSTART ${XDEBUG_REMOTE_AUTOSTART:-'on'}

RUN set -ex \
    && apk add --no-cache $PHPIZE_DEPS curl git libxml2-dev tzdata libsodium g++ make autoconf libsodium-dev \
    && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone \
    && pecl install xdebug libsodium \
    && docker-php-ext-enable xdebug sodium \
    && docker-php-ext-install xml soap bcmath \
    && echo xdebug.remote_enable=${XDEBUG_REMOTE_ENABLE} >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo xdebug.remote_autostart=${XDEBUG_REMOTE_AUTOSTART} >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo xdebug.remote_host=${XDEBUG_REMOTE_HOST} >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo xdebug.remote_port=${XDEBUG_REMOTE_PORT} >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo xdebug.remote_handler=dbgp >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo xdebug.remote_connect_back=0 >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && curl -sS  https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin \
    && rm -rf /tmp/*

WORKDIR /app

CMD ["sh"]
