@echo off
docker stop redmine
docker rm redmine
if "%1" == "" (
    docker-compose run --rm redmine app:backup:restore
    pause
) else (
    docker-compose run --rm redmine app:backup:restore BACKUP=%1
)
