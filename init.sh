#!/usr/bin/env bash
# ./init.sh local_proxy proxy.localhost
export NAME=$1
export DOMAIN=$2

# check container name
if [[ -z "$NAME" ]]; then
  echo "Missing container name" && exit 1
fi

# check host
if [[ -z "$DOMAIN" ]]; then
  echo "Missing domain name" && exit 1
fi

#create network
docker network create proxy-server-network

docker-compose -f $(dirname $0)/docker-compose.yml -p $NAME up
