ARG REDMINE_MYSQL_TAG
FROM groonga/mroonga:${REDMINE_MYSQL_TAG}

COPY --chown=root:root my.cnf /etc/mysql/conf.d/
RUN chmod 644 /etc/mysql/conf.d/my.cnf
