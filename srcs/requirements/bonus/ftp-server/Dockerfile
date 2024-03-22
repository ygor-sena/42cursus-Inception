# syntax=docker/dockerfile:1
FROM debian:bullseye

# Update the package lists and upgrade existing packages
RUN apt-get update -y && \
	apt-get upgrade -y && \
	apt-get install -y \
	vsftpd ftp

# Copy the vsftpd configuration file to the appropriate location
COPY conf/vsftpd.conf /etc/vsftpd.conf

# Copy the ftp_setup.sh script to the bin directory
COPY tools/ftp_setup.sh /usr/local/bin/ftp_setup.sh

# Make the ftp_setup.sh script executable
RUN chmod +x /usr/local/bin/ftp_setup.sh

# Expose the necessary ports for FTP communication
EXPOSE 20 21 21000-21010

# Set the entrypoint to run the ftp_setup.sh script
ENTRYPOINT [ "ftp_setup.sh" ]

# Set the default command to start the vsftpd service
CMD [ "vsftpd" ]