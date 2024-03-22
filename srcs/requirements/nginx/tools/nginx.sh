#!/usr/bin/env bash

# Create necessary directories
mkdir -p $NGINX_CERT_PATH

# Generate SSL certificate
openssl req -batch -x509 -sha256 -nodes -newkey rsa:2048 -days 365 -out $NGINX_CERT_PATH/inception.crt \
	-keyout $NGINX_CERT_PATH/inception.key \
	-subj "/C=BR/ST=Sao Paulo/L=Sao Paulo/O=42SP/OU=Inception/CN=$DOMAIN_NAME"

# Update the configuration file with the domain name and certificate path
sed -i "s|DOMAIN_NAME|${DOMAIN_NAME}|g" etc/nginx/conf.d/https.conf
sed -i "s|NGINX_CERT_PATH|${NGINX_CERT_PATH}|g" etc/nginx/conf.d/https.conf
