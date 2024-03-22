#!/usr/bin/env bash

# Start the MariaDB service
service mariadb start

# Create a new database if it doesn't already exist
# Create a new user with the provided username and password
# Grant all privileges on the database to the user
# Flush the privileges to apply the changes
mariadb -u root -e \
	"CREATE DATABASE IF NOT EXISTS $WP_DB_NAME; \
	CREATE USER '$WP_DB_USER'@'%' identified by '$WP_DB_PASSWORD'; \
	GRANT ALL ON $WP_DB_NAME.* TO '$WP_DB_USER'@'%' IDENTIFIED BY '$WP_DB_PASSWORD'; \
	FLUSH PRIVILEGES;"
