#!/bin/bash

export IMAGE=$1
docker compose -f docker-compose.yaml up --detach