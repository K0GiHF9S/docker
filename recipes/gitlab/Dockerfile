ARG GITLAB_TAG
FROM sameersbn/gitlab:${GITLAB_TAG}

COPY docker.patch /tmp/
RUN DEPS='patch git-core' \
    && apt-get update && apt-get -y --no-install-recommends install ${DEPS} \
    && cd ${GITLAB_RUNTIME_DIR} \
    && patch -p1 --no-backup-if-mismatch < /tmp/docker.patch \
    && cd ${GITLAB_INSTALL_DIR} \
    && sudo -HEu git bundle add omniauth-redmine --version "~> 0.0.3" \
    && mkdir -p ${GITLAB_LOG_DIR}/gitlab \
    && chown -R ${GITLAB_USER}: ${GITLAB_LOG_DIR}/gitlab \
    && mkdir -p ${GITLAB_INSTALL_DIR}/node_modules \
    && chown -R ${GITLAB_USER}: ${GITLAB_INSTALL_DIR}/node_modules \
    && sudo -HEu git yarn install --production --pure-lockfile \
    && sudo -HEu git yarn add ajv@^4.0.0 \
    && sudo -HEu git bundle exec rake gitlab:assets:compile USE_DB=false SKIP_STORAGE_VALIDATION=true NODE_OPTIONS="--max-old-space-size=4096" \
    && rm -rf ${GITLAB_LOG_DIR}/gitlab \
    && rm -f ${GITLAB_INSTALL_DIR}/.gitlab_shell_secret \
    && rm -f ${GITLAB_INSTALL_DIR}/.gitlab_workhorse_secret \
    && DEBIAN_FRONTEND=noninteractive apt-get purge -y --auto-remove ${DEPS} \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf ${GITLAB_HOME}/.cache ${GITLAB_HOME}/.bundle ${GITLAB_HOME}/go \
    && rm -rf /root/.cache /root/.bundle ${GITLAB_INSTALL_DIR}/node_modules \
    && rm -r /tmp/*
