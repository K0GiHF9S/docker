FROM sameersbn/gitlab:13.9.4

RUN DEPS='patch curl' \
    && apt-get update && apt-get -y --no-install-recommends install $DEPS \
    && rm -rf /var/lib/apt/lists/*

COPY docker.patch /tmp/
RUN cd ${GITLAB_RUNTIME_DIR} \
    && patch -p1 < /tmp/docker.patch \
    && rm /tmp/docker.patch

RUN cd ${GITLAB_INSTALL_DIR} \
    && sudo -u git -H bundle add omniauth-redmine --version "~> 0.0.2" \
    && mkdir -p ${GITLAB_LOG_DIR}/gitlab \
    && mkdir -p ${GITLAB_HOME}/repositories \
    && bundle exec rake assets:precompile RAILS_ENV=production \
    && rm -rf ${GITLAB_LOG_DIR}/gitlab \
    && rm -rf ${GITLAB_HOME}/repositories \
    && rm -f ${GITLAB_INSTALL_DIR}/.gitlab_shell_secret \
    && rm -f ${GITLAB_INSTALL_DIR}/.gitlab_workhorse_secret \
    && find ${GITLAB_HOME} ! -user ${GITLAB_USER} ! -type l | xargs chown ${GITLAB_USER}:
