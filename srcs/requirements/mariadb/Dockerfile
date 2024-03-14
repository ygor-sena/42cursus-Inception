# syntax=docker/dockerfile:1
FROM debian:oldstable

ARG SQL_DATABASE
ARG SQL_ROOT_PASSWORD
ARG SQL_USER
ARG SQL_PASSWORD

# Update, upgrade, and install mariadb-server in a single layer
RUN apt-get update && apt-get upgrade -y && \
	apt-get install mariadb-server -y

# Copy configuration and setup script files
COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf
COPY tools/mariadb_setup.sh /usr/local/bin/mariadb_setup.sh

# Make the setup script executable
RUN chmod +x /usr/local/bin/mariadb_setup.sh
RUN bash /usr/local/bin/mariadb_setup.sh


# RUN echo "[mysqld] \n\
# skip-networking=0 \n\
# skip-bind-address" >> /etc/mysql/my.cnf

# RUN service mariadb start && \
# 	mariadb -u root -e \
# 	"CREATE DATABASE IF NOT EXISTS $SQL_DATABASE; \
# 	CREATE USER '$SQL_USER'@'%' identified by '$SQL_PASSWORD'; \
# 	GRANT ALL ON $SQL_DATABASE.* TO '$SQL_USER'@'%' IDENTIFIED BY '$SQL_PASSWORD'; \
# 	FLUSH PRIVILEGES;" && \
# 	service mariadb stop

# Expose the MariaDB port
# EXPOSE 3306

# Use the setup script as the entrypoint
# Run MariaDB
CMD [ "mysqld_safe" ]

