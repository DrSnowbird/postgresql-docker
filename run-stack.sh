#!/bin/bash -x

echo "-----------------"
echo "To start up or shutdown PostgreSQL server"
echo "Arg1 choice: up (default if missing) or down"
echo "-----------------"

ACTION=${1:-up}

if [ "${ACTION}" == "up" ] || [ "${ACTION}" == "down" ]; then 
    echo "---- INFO ----: docker-compose action= ${ACTION}"
else
    echo "**** ERROR ****: Not supported action for docker-compose"
    exit 1
fi

#### ---- Docker Swarm ----
#docker stack deploy -c stack.yml postgres

#### ---- Docker ----
docker-compose -f stack.yml ${ACTION}

# wait for it to initialize completely, and visit http://swarm-ip:8080, http://localhost:8080, or http://host-ip:8080 (as appropriate).
#sleep 12
#firefox http://localhost:8080
