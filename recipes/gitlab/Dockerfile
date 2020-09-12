FROM sameersbn/gitlab:13.3.4

RUN DEPS='patch curl' \
    && apt-get update && apt-get -y --no-install-recommends install $DEPS \
    && rm -rf /var/lib/apt/lists/*

COPY docker.patch /tmp/
RUN cd ${GITLAB_RUNTIME_DIR} \
    && patch -p1 < /tmp/docker.patch \
    && rm /tmp/docker.patch

RUN cd ${GITLAB_INSTALL_DIR} \
    && sed -i -e "/^gem 'rack-oauth2'/a gem 'omniauth-redmine'" Gemfile \
    && mkdir ${GITLAB_LOG_DIR}/gitlab \
    && sudo -u git -H bundle install -j$(nproc) --without development test aws --path vendor/bundle --no-deployment \
    && mkdir ${GITLAB_HOME}/repositories \
    && bundle exec rake assets:precompile RAILS_ENV=production \
    && rm -rf ${GITLAB_LOG_DIR}/gitlab \
    && rm -rf ${GITLAB_HOME}/repositories \
    && rm -f ${GITLAB_INSTALL_DIR}/.gitlab_shell_secret \
    && rm -f ${GITLAB_INSTALL_DIR}/.gitlab_workhorse_secret \
    && find ${GITLAB_HOME} ! -user ${GITLAB_USER} ! -type l | xargs chown ${GITLAB_USER}:
