#!/usr/bin/env bash

# This script sets up a WordPress installation by performing the following steps:
# 1. Changes the ownership of the /var/www/html/ directory to www-data user and group.
# 2. Downloads the WordPress core files using the `wp core download` command.
# 3. Creates a wp-config.php file with the specified database credentials using the `wp config create` command.
# 4. Installs WordPress using the `wp core install` command with the specified site details.
# 5. Creates a new user with the specified username, email, and password using the `wp user create` command.
# 6. Activates the twentytwentythree theme using the `wp theme activate` command.
# 7. Updates all installed plugins using the `wp plugin update --all` command.
# 8. Installs and activates the Redis Cache plugin using the `wp plugin install redis-cache --activate` command.
# 9. Sets the WP_REDIS_HOST and WP_REDIS_PORT constants in the wp-config.php file.
# 10. Enables Redis object caching using the `wp redis enable` command.

# Note: This script assumes that the necessary environment variables (WP_DB_NAME, WP_DB_USER, WP_DB_PASSWORD,
# DOMAIN_NAME, WP_DB_EMAIL, WP_GUEST_USER, WP_GUEST_EMAIL, WP_GUEST_PASSWORD) are set before running the script.

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

sudo -u www-data sh -c "wp plugin install redis-cache --activate"
sudo -u www-data sh -c "wp config set WP_REDIS_HOST 'redis'"
sudo -u www-data sh -c "wp config set WP_REDIS_PORT 6379"
sudo -u www-data sh -c "wp config set WP_CACHE true"
sudo -u www-data sh -c "wp redis enable"

# On the same terminal, it executes this sh and also the cmds passed as argument
# by the user. It also replaces the current process with the one passed as argument
# https://stackoverflow.com/questions/39082768/what-does-set-e-and-exec-do-for-docker-entrypoint-scripts
exec "$@"
