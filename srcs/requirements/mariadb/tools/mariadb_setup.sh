#!/usr/bin/env bash


service mariadb start && \
	mariadb -u root -e \
	"CREATE DATABASE IF NOT EXISTS $SQL_DATABASE; \
	CREATE USER '$SQL_USER'@'%' IDENTIFIED BY '$SQL_PASSWORD'; \
	GRANT ALL ON $SQL_DATABASE.* TO '$SQL_USER'@'%' IDENTIFIED BY '$SQL_PASSWORD'; \
	FLUSH PRIVILEGES;"
# service mariadb start
# mariadb -u root -e "CREATE DATABASE IF NOT EXISTS ${SQL_DATABASE};"
# mariadb -u root -e "CREATE USER IF NOT EXISTS '${SQL_USER}'@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
# mariadb -u root -e "GRANT ALL PRIVILEGES ON ${SQL_DATABASE}.* TO '${SQL_USER}'@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
# mariadb -u root -e "FLUSH PRIVILEGES;"
#mariadb -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"
#mysqladmin -u root -p ${SQL_ROOT_PASSWORD} shutdown

#service mariadb start
#mariadb -u root -p$SQL_ROOT_PASSWORD \

#	"CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`; \
#	CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}'; \ 
#	GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}'; \
#	FLUSH PRIVILEGES;"

# Set password for root user
#mariadb -u root -e "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('$SQL_ROOT_PASSWORD');"
#mariadb -u root -e "FLUSH PRIVILEGES;"

# Allow root user to login from any host
#mariadb -u root -p$SQL_ROOT_PASSWORD -e "GRANT ALL ON *.* TO 'root'@'localhost' IDENTIFIED BY '$SQL_ROOT_PASSWORD';"
#mariadb -u root -p$SQL_ROOT_PASSWORD -e "FLUSH PRIVILEGES;"

service mariadb stop

exec "$@"