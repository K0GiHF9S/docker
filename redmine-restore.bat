@echo off
docker-compose stop redmine
docker-compose rm -f redmine
if "%1" == "" (
    docker-compose run --rm redmine app:backup:restore
) else (
    docker-compose run --rm redmine app:backup:restore BACKUP=%1
)
