# This Dockerfile sets up a Debian-based container for running WordPress.
# It installs necessary dependencies, configures PHP-FPM, installs wp-cli,
# and sets up WordPress using a setup script.

# syntax=docker/dockerfile:1
FROM debian:bullseye

# Set the working directory to /var/www/html/
WORKDIR /var/www/html/

# Update the package lists, upgrade installed packages, and install necessary dependencies
RUN apt-get update -y && \
	apt-get upgrade -y && \
	apt-get install -y \
	wget \
	php7.4-fpm \
	php7.4-mysql \
	mariadb-client \
	sudo

# Copy the www.conf file to the appropriate location for PHP-FPM configuration
COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

# Setup php: create PID directory for PHP-FPM
RUN mkdir -p /run/php && chmod 755 /run/php

# Create a symbolic link to the php-fpm binary to make it easier 
# to run from anywhere in the container
RUN ln -s $(find /usr/sbin -name 'php-fpm*') /usr/bin/php-fpm

# Install wp-cli to manage WordPress from CLI to user's bin directory
RUN wget "https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar" -O /usr/local/bin/wp
RUN chmod +x /usr/local/bin/wp

# Setup WordPress by running the setup script
COPY tools/wp_setup.sh /usr/local/bin/wp_setup.sh
RUN chmod +x /usr/local/bin/wp_setup.sh

# Set the entrypoint to the wp_setup.sh script
ENTRYPOINT [ "wp_setup.sh" ]

# Set the default command to run php-fpm in foreground mode
CMD [ "php-fpm", "-F" ]
