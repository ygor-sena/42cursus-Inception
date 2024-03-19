LOGIN=yde-goes
DOCKER_COMPOSE = docker-compose -f srcs/docker-compose.yml
VOLUMES = "/home/$(LOGIN)/data"

up:
	sudo mkdir -p "$(VOLUMES)/wordpress" "$(VOLUMES)/mariadb"
	$(DOCKER_COMPOSE) up -d --build

down:
	$(DOCKER_COMPOSE) down

start:
	$(DOCKER_COMPOSE) start

stop:
	$(DOCKER_COMPOSE) stop

ps:
	$(DOCKER_COMPOSE) ps

clean:
	$(DOCKER_COMPOSE) down --rmi all --volumes

fclean: clean
	sudo rm -rf $(VOLUMES)

prune: fclean
	docker system prune --all --force --volumes

.PHONY: shell up down start stop ps clean fclean prune
