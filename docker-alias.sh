#!/bin/bash

function attach()
{
  docker exec -t -i "$1" sh
}

function _docker_containers_list()
{
services=$(docker ps --format '{{.Names}}' 2>/dev/null)
if [ -z $services ]; then
echo "This is not a valid Docker Compose folder"
else
  _arguments "1: :($services)"
fi

}

compdef _docker_containers_list attach

