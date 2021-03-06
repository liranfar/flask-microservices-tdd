#!/usr/bin/env bash

# ENV
export REACT_APP_USERS_SERVICE_URL=http://127.0.0.1

# build the containers
docker-compose -f ../docker-compose-dev.yml build

# fire up and update the containers as services
docker-compose -f ../docker-compose-dev.yml up -d

# or combined
# docker-compose -f docker-compose-dev.yml up -d --build

# init DBs
docker-compose -f ../docker-compose-dev.yml \
  run users python manage.py recreate_db

# seed DBs
docker-compose -f ../docker-compose-dev.yml \
  run users python manage.py seed_db

# run server-side tests
docker-compose -f ../docker-compose-dev.yml \
  run users python manage.py test

# run server-side code coverage
docker-compose -f ../docker-compose-dev.yml \
  run users python manage.py cov

# stop all containers
docker-compose -f ../docker-compose-dev.yml stop

# run client side tests
docker-compose -f docker-compose-dev.yml \
  run client npm test