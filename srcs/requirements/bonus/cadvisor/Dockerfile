# syntax=docker/dockerfile:1
FROM debian:bullseye

# Update and upgrade the system packages
RUN apt-get update -y && \
	apt-get upgrade -y && \
	apt-get install -y wget

# Set the working directory to /usr/local/bin
WORKDIR /usr/local/bin

# Download and install cadvisor
RUN wget https://github.com/google/cadvisor/releases/download/v0.49.1/cadvisor-v0.49.1-linux-amd64 \
	-O cadvisor && chmod +x cadvisor

# Set the default command to run cadvisor
CMD [ "cadvisor" ]