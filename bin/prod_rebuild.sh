#!bin/sh

set -eu

CONTAINERNAME="postgres"
IMAGENAME="prod/postgres"
VOLUMENAME="db-store"
DIRECTORYNAME="`pwd`"
DIRECTORYNAME="`basename -- "$DIRECTORYNAME"`"
VOLUMENAME=$DIRECTORYNAME"_"$VOLUMENAME

if docker compose ps ${CONTAINERNAME} | grep -q running; then
  cmd="docker compose down"
  echo $cmd
  $cmd

  cmd="docker image rm ${IMAGENAME}"
  echo $cmd
  $cmd

  cmd="docker volume rm ${VOLUMENAME}"
  echo $cmd
  $cmd
else
  if docker images | grep -q ${IMAGENAME}; then
    cmd="docker image rm ${IMAGENAME}"
    echo $cmd
    $cmd
  fi

  if docker volume list | grep -q ${IMAGENAME}; then
    cmd="docker volume rm ${VOLUMENAME}"
    echo $cmd
    $cmd
  fi

  cmd="docker compose -f docker-compose.yml up -d"
  echo $cmd
  $cmd
fi
