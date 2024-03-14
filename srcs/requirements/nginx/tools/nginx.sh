#!/bin/bash

# REMOVE FOR EVAL!!
export NGINX_CERT_PATH=/etc/nginx/ssl
export DOMAIN_NAME="yde-goes.42.fr"

# Create necessary directories
mkdir -p $NGINX_CERT_PATH

# Generate SSL certificate
openssl req -x509 -nodes -out $NGINX_CERT_PATH/inception.crt \
    -keyout $NGINX_CERT_PATH/inception.key \
    -subj "/C=BR/ST=Sao Paulo/L=Sao Paulo/O=42SP/OU=Inception/CN=yde-goes.42.fr"

sed -i "s|DOMAIN_NAME|${DOMAIN_NAME}|g" /etc/nginx/nginx.conf
sed -i "s|NGINX_CERT_PATH|${NGINX_CERT_PATH}|g" /etc/nginx/nginx.conf

# On the same terminal, executes this sh and also the cmds passed as argument
# by the user. It also replaces the current process with the one passed as argument
# https://stackoverflow.com/questions/39082768/what-does-set-e-and-exec-do-for-docker-entrypoint-scripts
exec "$@"
