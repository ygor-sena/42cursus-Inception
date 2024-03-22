#!/usr/bin/env bash

# This script sets up Adminer, a web-based database management tool.
# It creates a directory for the Adminer files, downloads the latest version of Adminer,
# sets the appropriate ownership and permissions for the Adminer file.

# Create the directory for Adminer files
mkdir -p /var/www/html

# Download the latest version of Adminer
wget "http://www.adminer.org/latest.php" -O /var/www/html/adminer.php

# Set ownership to www-data user and group
chown www-data:www-data /var/www/html/adminer.php

# Set permissions to allow execution by owner and read by others
chmod 755 /var/www/html/adminer.php  
