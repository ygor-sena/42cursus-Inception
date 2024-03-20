FROM debian:bullseye

RUN apt-get update -y && \
	apt-get upgrade -y && \
	apt-get install -y \
	wget \
	php7.4-fpm

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

# Setup php: create PID directory for PHP-FPM
RUN mkdir -p /run/php && chmod 755 /run/php

RUN ln -s $(find /usr/sbin -name 'php-fpm*') /usr/bin/php-fpm

COPY tools/adminer_setup.sh /usr/local/bin/adminer_setup.sh

RUN chmod +x /usr/local/bin/adminer_setup.sh && \
	/usr/local/bin/adminer_setup.sh

# Set the default command to run php-fpm in foreground mode
CMD [ "php-fpm", "-F" ]