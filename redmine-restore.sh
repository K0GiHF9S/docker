docker-compose rm -sf redmine
if [[ $# == 0 ]] ; then
    docker-compose run --rm redmine app:backup:restore
else
    docker-compose run --rm redmine app:backup:restore BACKUP=%1
fi
