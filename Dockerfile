FROM php:8.2-apache as builder
RUN apt-get -y update
RUN apt-get -y install default-mysql-client mariadb-client
RUN apt-get -y install net-tools git unzip
RUN docker-php-ext-install pdo_mysql
RUN a2enmod rewrite
RUN a2enmod negotiation
COPY laravel-apache.conf /etc/apache2/sites-available/
RUN a2ensite laravel-apache
WORKDIR /var/www/example-app
RUN mkdir logs
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php -r "if (hash_file('sha384', 'composer-setup.php') === 'dac665fdc30fdd8ec78b38b9800061b4150413ff2e3b6f88543c636f7cd84f6db9189d43a81e5503cda447da73c7e5b6') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
RUN php composer-setup.php
RUN php -r "unlink('composer-setup.php');"
COPY composer.json ./
COPY composer.lock ./
RUN php composer.phar install --no-scripts
COPY . ./
RUN php composer.phar install
FROM builder
WORKDIR /var/www/example-app
RUN chown www-data:www-data .
USER www-data
COPY --from=builder --chown=www-data /var/www/example-app /var/www/example-app



