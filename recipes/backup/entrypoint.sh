#!/bin/ash
set -eo pipefail

if [ "${1:0:1}" = '-' ]; then
	set -- crond "$@"
fi

exec "$@"
