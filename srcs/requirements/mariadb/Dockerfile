# This Dockerfile sets up a MariaDB container based on Debian Bullseye.
# It installs the MariaDB server, copies the custom configuration file,
# and runs a setup script to configure the database.
# The container will start the MariaDB server using the "mysqld_safe" command.

# syntax=docker/dockerfile:1
FROM debian:bullseye

# Define build arguments for WordPress database name, user, and passwords
ARG WP_DB_NAME
ARG WP_DB_USER
ARG WP_DB_PASSWORD

# Update the package lists, upgrade existing packages, and install MariaDB server
RUN apt-get update -y && \
	apt-get upgrade -y && \
	apt-get install -y mariadb-server

# Copy the custom MariaDB configuration file to the appropriate location
COPY conf/my.cnf /etc/mysql/my.cnf

# Copy the setup script to the container's bin directory
COPY tools/mariadb_setup.sh /usr/local/bin/mariadb_setup.sh

# Make the setup script executable
RUN chmod +x /usr/local/bin/mariadb_setup.sh && \
	/usr/local/bin/mariadb_setup.sh

# Set the default command to start the MariaDB server using "mysqld_safe"
CMD ["mysqld_safe"]
