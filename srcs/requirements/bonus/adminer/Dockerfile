# syntax=docker/dockerfile:1
FROM debian:bullseye

# Update and upgrade the system packages
RUN apt-get update -y && \
	apt-get upgrade -y && \
	apt-get install -y \
	wget \
	php7.4-fpm

# Copy the www.conf file to the PHP-FPM pool.d directory
COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

# Setup PHP: create PID directory for PHP-FPM
RUN mkdir -p /run/php && chmod 755 /run/php

# Create a symbolic link for php-fpm
RUN ln -s $(find /usr/sbin -name 'php-fpm*') /usr/bin/php-fpm

# Copy the adminer_setup.sh script to the /usr/local/bin directory
COPY tools/adminer_setup.sh /usr/local/bin/adminer_setup.sh

# Make the adminer_setup.sh script executable
RUN chmod +x /usr/local/bin/adminer_setup.sh && \
	/usr/local/bin/adminer_setup.sh

# Set the default command to run php-fpm in foreground mode
CMD [ "php-fpm", "-F" ]