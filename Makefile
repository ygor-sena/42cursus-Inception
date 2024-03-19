LOGIN=yde-goes
DOCKER_COMPOSE = docker-compose -f srcs/docker-compose.yml
VOLUMES = "/home/$(LOGIN)/data"

shell:
    @read -p "=> Enter service: " service; \
    $(DOCKER_COMPOSE) exec -it $$service /bin/bash

up:
	@ sudo mkdir -p "$(VOLUMES)/wordpress" "$(VOLUMES)/mariadb"
	@ $(DOCKER_COMPOSE) up -d --build

## Stop and Remove Containers
clean:
	@ $(DOCKER_COMPOSE) down --rmi all --volumes

## Full Cleanup (Remove Images and Volumes)
fclean: clean
	@ sudo rm -rf $(VOLUMES)

## Deep Cleanup (Remove Unused Objects)
prune: fclean
	@ docker system prune --all --force --volumes