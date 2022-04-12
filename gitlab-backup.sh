docker-compose rm -sf gitlab
docker-compose run --rm gitlab app:rake gitlab:backup:create
