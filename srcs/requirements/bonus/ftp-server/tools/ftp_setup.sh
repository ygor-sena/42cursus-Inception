#!/usr/bin/env bash

# This script sets up an FTP server by performing the following steps:
# 1. Creates a new user with the specified username and assigns it to the root group.
# 2. Creates the necessary directories for the FTP server.
# 3. Updates the vsftpd.conf file to replace the placeholder "FTP_USER" with the actual username.
# 4. Sets the password for the FTP user.
# 5. Creates a new group with the same name as the FTP user.
# 6. Sets the ownership and permissions for the FTP user's home directory.

useradd --gid 0 -m "${FTP_USER}" -s /bin/bash

mkdir -p /home/${FTP_USER}/ftp
mkdir -p /var/run/vsftpd/empty

sed -i "s|FTP_USER|${FTP_USER}|g" /etc/vsftpd.conf

echo "${FTP_USER}:${FTP_PASSWORD}" | chpasswd

groupadd ${FTP_USER}

# Set the user's home directory
chown -R ${FTP_USER}:${FTP_USER} /home/${FTP_USER}/ftp
chmod 777 -R "/home/${FTP_USER}"

exec "$@"
