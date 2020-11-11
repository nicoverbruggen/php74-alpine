FROM php:7.4-alpine

# Install Xdebug and enable it
RUN apk add --no-cache $PHPIZE_DEPS \
    && pecl install xdebug \
    && docker-php-ext-enable xdebug \
    && apk del $PHPIZE_DEPS

# Install other dependencies
RUN apk add --no-cache git curl sqlite nodejs npm