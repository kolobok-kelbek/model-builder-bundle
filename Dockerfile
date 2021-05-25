FROM php:8.0-cli

WORKDIR /library

RUN useradd -s /bin/bash -d /home/worker/ -m -G sudo worker \
    ## update
    && apt-get -y update \
    ## install soft
    && apt-get install -y \
        libzip-dev \
        curl \
        git \
        vim \
    ## php extentions
    && docker-php-ext-install zip \
    ## install composer
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

USER worker
