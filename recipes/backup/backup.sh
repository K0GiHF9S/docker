#!/bin/ash
set -eo pipefail
[ ! -e $TARGET_DIR ] && exit 0
BACKUP_FILE_NAME=$FILE_PREFIX-`/bin/date +%Y%m%d`.tar.gz

DATE=`/bin/date \'+%Y%m%d\'`

touch -m -d $(/bin/date -d -"$BACKUP_LIMIT" +%Y%m%d) /tmp/check

[ ! -e $BACKUP_DIR ] && mkdir -p $BACKUP_DIR
cd $TARGET_DIR
tar czfp $BACKUP_DIR/$BACKUP_FILE_NAME ./

find $BACKUP_DIR -not -newer /tmp/check -name \"*.tar.gz\" | xargs rm -f