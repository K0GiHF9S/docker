@echo off
docker-compose stop gitlab
docker-compose rm -f gitlab
docker-compose run --rm gitlab app:rake gitlab:backup:create