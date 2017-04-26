#!/usr/bin/env bash

set -xeuo pipefail

export ENVIRONMENT=development
source ./configuration/${ENVIRONMENT}/config

if [ "$(uname)" == "Darwin" ]; then
	export DOCKERHOST_IP="${IP_ALIAS}"
else
    export DOCKERHOST_IP="$(ifconfig $(ip route | head -1 | awk '{ print $5 }') | grep "inet " | awk '{ print $2 }' | awk -F':' '{ print $2 }')"
fi
echo "DOCKERHOST_IP: $DOCKERHOST_IP"

export PORT=${PORT:-5555}

DOCKER_COMPOSE="docker-compose -p url_shortener-${ENVIRONMENT} -f docker-compose.yml -f docker-${ENVIRONMENT}.yml"

${DOCKER_COMPOSE} build
${DOCKER_COMPOSE} down || true
${DOCKER_COMPOSE} up
