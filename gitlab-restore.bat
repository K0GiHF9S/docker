@echo off
docker-compose stop gitlab
docker-compose rm -f gitlab
if "%1" == "" (
    docker-compose run --rm gitlab app:rake gitlab:backup:restore
) else (
    docker-compose run --rm gitlab app:rake gitlab:backup:restore BACKUP=%1
)
