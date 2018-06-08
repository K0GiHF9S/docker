@echo off
docker-compose stop redmine
docker-compose rm -f redmine
docker-compose run --rm redmine app:backup:create