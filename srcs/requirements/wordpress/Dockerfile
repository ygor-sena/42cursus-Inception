# syntax=docker/dockerfile:1
FROM debian:oldstable

WORKDIR /var/www/html/

RUN apt-get update && apt-get upgrade -y

# Install necessary packages to run wordpress and mariadb client
RUN apt-get install -y \
	wget \
	php-fpm \
	php-mysql \
	mariadb-client

# [Configure PHP to NGINX communication]
# Backup the default conf file
#RUN mv /etc/php/7.4/fpm/pool.d/www.conf /etc/php/7.4/fpm/pool.d/www.conf.default
# Copy the custom conf file
#COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/
# Create a symbolic link to the php-fpm binary to make it easier
# to run from anywhere in the container

RUN sed -i.default "/^listen\s=.*/c\listen = 0.0.0.0:9000" \
	/etc/php/[0-9]*.[0-9]*/fpm/pool.d/www.conf

#EXPOSE 9000

# Setup php: create PID directory for PHP-FPM
RUN mkdir -p /run/php
RUN chmod 755 /run/php

RUN ln -s $( find /usr/sbin -name 'php-fpm*') /usr/bin/php-fpm
# chown -R www-data:www-data /var/www/html/

# Install wp-cli to manage WordPress from CLI to user's bin directory
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -O /usr/local/bin/wp
RUN chmod +x /usr/local/bin/wp

# Setup wordpress by running the setup script
COPY tools/wp_setup.sh /usr/local/bin/wp_setup.sh
RUN chmod 755 /usr/local/bin/wp_setup.sh

# Copy Entrypoint script
COPY        ./tools/run_php_fpm.sh /usr/local/bin/
#RUN         chmod 755 /usr/local/bin/run_php_fpm.sh

#RUN ln -s $(find /usr/sbin -name 'php-fpm*') /usr/bin/php-fpm

#ENTRYPOINT  [ "bash", "/usr/local/bin/wp_setup.sh" ]

CMD ["php-fpm", "-F"]
