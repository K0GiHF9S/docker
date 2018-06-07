@echo off
docker stop gitlab
docker rm gitlab
if "%1" == "" (
    docker-compose run --rm gitlab app:rake gitlab:backup:restore
    pause
) else (
    docker-compose run --rm gitlab app:rake gitlab:backup:restore BACKUP=%1
)
