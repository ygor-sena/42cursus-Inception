#!/bin/bash

docker stop $(docker ps -qa);
dockerrm $(docker ps -qa);
docker rmi -f $(docker images -qa);
docker volume rm $(docker volume ls -q);
docker network rm $(docker network ls -q) 2>/dev/null
docker system prune -a 