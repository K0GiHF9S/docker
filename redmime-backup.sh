docker-compose rm -sf redmine
docker-compose run --rm redmine app:backup:create
