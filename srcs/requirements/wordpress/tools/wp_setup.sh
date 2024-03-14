#!/bin/bash

#export SQL_DATABASE="wordpress"
#export SQL_USER="root"
#export SQL_PASSWORD="wordpress"

# [WORDPRESS INSTALATION]
# Download and extract the latest version of WordPress
#wget https://wordpress.org/latest.tar.gz
#tar -xvf latest.tar.gz

# Move the WordPress files to the root of the web server
#mkdir -p /var/www/html/
#mv wordpress/* /var/www/html/
#rm -rf latest.tar.gz

# Set the correct permissions with standard web server user www-data
# chown -R www-data:www-data /var/www/html/

# Install wp-cli to manage WordPress from CLI to user's bin directory
# wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -O /usr/local/bin/wp
# chmod +x /usr/local/bin/wp

# [WORDPRESS CONFIGURATION]
# mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php
#wp config set DB_NAME $SQL_DATABASE --allow-root --path=/var/www/html/
#wp config set DB_USER $SQL_USER --allow-root --path=/var/www/html/
#wp config set DB_PASSWORD $SQL_PASSWORD --allow-root --path=/var/www/html/
#wp config set DB_HOST mariadb --allow-root --path=/var/www/html/
wp --allow-root core download

wp --allow-root config create \
	--dbname="$SQL_DATABASE" \
	--dbuser="$SQL_USER" \
	--dbpass="$SQL_PASSWORD" \
	--dbhost=mariadb \
	--dbcharset='utf8'

wp --allow-root core install \
	--url="$DOMAIN_NAME" \
	--title="Inception" \
	--admin_user=admin \
	--admin_password=admin \
	--admin_password=adminpwd \
	--admin_email=admin@email \
	--skip-email

wp --allow-root user create \
	guestwpuser \
	guestwpuser@gmail.com \
	--role=author \
	--user_pass=wp_user

wp --allow-root plugin update --all

