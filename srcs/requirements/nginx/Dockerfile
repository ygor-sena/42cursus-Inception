# This Dockerfile builds a Docker image for an Nginx web server with HTTPS support.
# It installs Nginx and OpenSSL, copies the Nginx configuration files, sets permissions
# for the web root directory, and runs a setup script to generate SSL certificates and
# configure Nginx. The CMD instruction starts the Nginx server in the foreground.

# syntax=docker/dockerfile:1
FROM debian:bullseye

ARG NGINX_CERT_PATH
ARG DOMAIN_NAME

# Update and upgrade the system
RUN apt-get update -y && \
	apt-get upgrade -y && \
	apt-get install -y \
    nginx  \
    openssl

# Copy Nginx configuration
COPY conf/https.conf /etc/nginx/conf.d/
COPY tools/ etc/nginx/tools

# Set permissions for web root. The first one is the default web
# root dir for NGINX. The second command changes the owner of the
# web root to the user www-data, which is the standard user NGINX
# uses for running processes and owning files.
RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

# Make the setup script executable
RUN chmod +x /etc/nginx/tools/nginx.sh
RUN bash /etc/nginx/tools/nginx.sh

CMD [ "nginx", "-g", "daemon off;" ]