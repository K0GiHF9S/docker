@echo off
docker stop redmine
docker rm redmine
docker-compose run --rm redmine app:backup:create