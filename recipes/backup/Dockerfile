FROM alpine:3.7

ENV MONTHLY_BACKUP_DIR="/var/backup/monthly" \
    MONTHLY_TARGET_DIR="/var/target/monthly" \
    MONTHLY_FILE_PREFIX="monthly-" \
    MONTHLY_BACKUP_LIMIT="3 month" \
    WEEKLY_BACKUP_DIR="/var/backup/weekly" \
    WEEKLY_TARGET_DIR="/var/target/weekly" \
    WEEKLY_FILE_PREFIX="weekly-" \
    WEEKLY_BACKUP_LIMIT="4 week"

COPY entrypoint.sh /
COPY crontab /etc/crontabs/root
COPY --chown=root:root backup.sh /usr/local/bin

RUN apk add --no-cache \
    coreutils \
    && chmod 755 /usr/local/bin/backup.sh

VOLUME [ "/var/backup" ]
CMD [ "-f", "-d", "8" ]
ENTRYPOINT [ "/entrypoint.sh" ]