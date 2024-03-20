FROM debian:bullseye

RUN apt-get update -y && \
	apt-get upgrade -y && \
	apt-get install -y \
	redis-server \
	procps

COPY conf/redis.conf /etc/redis/redis.conf

COPY tools/redis_setup.sh /usr/local/bin/redis_setup.sh
RUN chmod +x /usr/local/bin/redis_setup.sh

ENTRYPOINT [ "redis_setup.sh" ]

CMD [ "redis-server" ]