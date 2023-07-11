#!/bin/sh

set -eu

docker-compose pull
DOCKER_BUILDKIT=1 docker-compose build
DOCKER_BUILDKIT=1 docker-compose up -d
sleep 20
hurl --test *.hurl
docker-compose down
