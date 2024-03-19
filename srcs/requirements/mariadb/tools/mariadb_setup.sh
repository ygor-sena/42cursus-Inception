#!/usr/bin/env bash

service mariadb start
mariadb -u root -e \
	"CREATE DATABASE IF NOT EXISTS $WP_DB_NAME; \
	CREATE USER '$WP_DB_USER'@'%' identified by '$WP_DB_PASSWORD'; \
	GRANT ALL ON $WP_DB_NAME.* TO '$WP_DB_USER'@'%' IDENTIFIED BY '$WP_DB_PASSWORD'; \
	FLUSH PRIVILEGES;"
