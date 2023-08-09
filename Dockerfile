FROM ubuntu:20.04
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=UTC
RUN apt-get update && apt-get install -y \
    curl \
    php \
    php-cli \
    php-json \
    php-mbstring \
    php-zip \
    && rm -rf /var/lib/apt/lists/*
WORKDIR /var/www/html/kafka
COPY . /var/www/html/kafka
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
COPY composer.json /var/www/html/kafka
RUN composer install