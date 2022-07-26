FROM php:8.1-apache
LABEL MAINTAINER="Lar-Module"


#Install dependency
RUN apt update && apt install -y nocache \
	openssl \
	zlib1g-dev \
	libpng-dev \
	libwebp-dev \
	libonig-dev \
	libzip-dev \
	tzdata \
	libzip-dev \
	libzip4 \
	nano \
	zip \
	unzip \
	certbot  \
	python3-certbot-apache \
	&& rm -rf /var/lib/apt/lists/* \

WORKDIR /var/www/html

#Install extension PHP
RUN chmod +x /usr/local/bin/docker-php-ext-install && \
	docker-php-ext-configure gd --with-webp && \
	docker-php-ext-install gd mbstring pdo pdo_mysql mysqli zip

#Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

#Activate module apache2
RUN a2enmod rewrite
RUN a2enmod headers
RUN a2enmod ssl

CMD ["apachectl", "-D", "FOREGROUND"]

EXPOSE 81
