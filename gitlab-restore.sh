docker-compose rm -sf gitlab
if [ $# == 0 ]
    docker-compose run --rm gitlab app:rake gitlab:backup:restore
else
    docker-compose run --rm gitlab app:rake gitlab:backup:restore BACKUP=$1
fi
