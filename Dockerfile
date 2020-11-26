FROM php:7.4-alpine

# Install Xdebug and enable it
RUN apk add --no-cache $PHPIZE_DEPS \
    && pecl install xdebug \
    && docker-php-ext-enable xdebug \
    && apk del $PHPIZE_DEPS

RUN echo "xdebug.mode=coverage" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

# Install other dependencies
RUN apk add --no-cache git curl sqlite nodejs npm