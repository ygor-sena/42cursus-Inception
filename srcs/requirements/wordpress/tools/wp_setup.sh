#!/usr/bin/env bash

chown -R www-data:www-data /var/www/html/

sudo -u www-data sh -c "wp core download"

sudo -u www-data sh -c "wp config create \
	--dbname=$WP_DB_NAME \
	--dbuser=$WP_DB_USER \
	--dbpass=$WP_DB_PASSWORD \
	--dbhost=mariadb \
	--dbcharset='utf8'"

sudo -u www-data sh -c "wp core install \
	--url=$DOMAIN_NAME \
	--title=Inception \
	--admin_user=$WP_DB_USER \
	--admin_password=$WP_DB_PASSWORD \
	--admin_email=$WP_DB_EMAIL \
	--skip-email"

sudo -u www-data sh -c "wp user create \
	$WP_GUEST_USER \
	$WP_GUEST_EMAIL \
	--role=author \
	--user_pass=$WP_GUEST_PASSWORD"

sudo -u www-data sh -c "wp theme activate twentytwentythree"

sudo -u www-data sh -c "wp plugin update --all"

# On the same terminal, it executes this sh and also the cmds passed as argument
# by the user. It also replaces the current process with the one passed as argument
# https://stackoverflow.com/questions/39082768/what-does-set-e-and-exec-do-for-docker-entrypoint-scripts
exec "$@"
