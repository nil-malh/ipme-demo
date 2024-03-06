FROM chialab/php:8.2-apache

WORKDIR /var/www/html

COPY --chown=www-data:www-data . .
COPY 000-default.conf /etc/apache2/sites-available/000-default.conf

RUN composer install
