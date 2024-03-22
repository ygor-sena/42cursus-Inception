# syntax=docker/dockerfile:1
FROM debian:bullseye

# Update and upgrade the system packages. Install Redis server and procps package
RUN apt-get update -y && \
	apt-get upgrade -y && \
	apt-get install -y \
	redis-server \
	procps          

# Copy the Redis configuration file to the appropriate location
COPY conf/redis.conf /etc/redis/redis.conf

# Copy the Redis setup script to the bin directory and make it executable
COPY tools/redis_setup.sh /usr/local/bin/redis_setup.sh
RUN chmod +x /usr/local/bin/redis_setup.sh

# Set the entrypoint to the Redis setup script
ENTRYPOINT [ "redis_setup.sh" ]

# Set the default command to start the Redis server
CMD [ "redis-server" ]