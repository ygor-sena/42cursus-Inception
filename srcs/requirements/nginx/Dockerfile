# syntax=docker/dockerfile:1
FROM debian:oldstable

ARG NGINX_CERT_PATH
ARG DOMAIN_NAME

# Update and upgrade the system
RUN apt-get update && apt-get upgrade -y

# Install necessary packages
RUN apt-get install -y \
    nginx  \
    vim \
    curl \
    openssl

# Copy Nginx configuration
COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY tools/ etc/nginx/tools

# Set permissions for web root. The first one is the default web
# root dir for NGINX. The second command chances the owner of the
# web root to the user www-data, which is the standard user NGINX
# uses for running processes and owning files.
RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

# Make the setup script executable
RUN chmod +x /etc/nginx/tools/nginx.sh
RUN bash /etc/nginx/tools/nginx.sh

# Expose port and run Nginx
#EXPOSE 443

CMD [ "nginx", "-g", "daemon off;" ]