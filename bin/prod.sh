#!bin/sh

set -eu

CONTAINERNAME="postgres"

if docker compose ps ${CONTAINERNAME} | grep -q running; then
  cmd="docker compose down"
else
  cmd="docker compose -f docker-compose.yml up -d"
fi

echo $cmd
$cmd
