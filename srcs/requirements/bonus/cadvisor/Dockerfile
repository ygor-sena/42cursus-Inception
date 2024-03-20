FROM debian:bullseye

RUN apt-get update -y && \
	apt-get upgrade -y && \
	apt-get install -y wget

WORKDIR /usr/local/bin

RUN wget https://github.com/google/cadvisor/releases/download/v0.49.1/cadvisor-v0.49.1-linux-amd64 \
	-O cadvisor && chmod +x cadvisor

CMD [ "cadvisor" ]