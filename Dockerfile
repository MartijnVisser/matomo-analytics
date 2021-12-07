FROM php:7.4-apache-buster
#RUN chown -R www-data:www-data /var/www/html
#RUN docker-php-ext-install mysqli
RUN apt-get update && apt-get upgrade -y && apt-get install -y nano
RUN docker-php-ext-install mysqli && docker-php-ext-enable mysqli \
    && a2enmod headers \
    && sed -ri -e 's/^([ \t]*)(<\/VirtualHost>)/\1\tHeader set Access-Control-Allow-Origin "*"\n\1\2/g' /etc/apache2/sites-available/*.conf
ENV TERM xterm