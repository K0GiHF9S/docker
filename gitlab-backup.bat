@echo off
docker stop gitlab
docker rm gitlab
docker-compose run --rm gitlab app:rake gitlab:backup:create