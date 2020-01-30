FROM sameersbn/gitlab:12.1.2

COPY docker.patch /tmp/
RUN DEPS='patch' \
    && apt-get update && apt-get -y --no-install-recommends install $DEPS \
    && rm -rf /var/lib/apt/lists/* \
    && cd ${GITLAB_RUNTIME_DIR} \
    && patch -p1 < /tmp/docker.patch \
    && apt-get purge -y --auto-remove $DEPS \
    && rm /tmp/docker.patch \
    && cd ${GITLAB_INSTALL_DIR} \
    && gem install omniauth-redmine \
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
COPY --chown=git:git redmine_64.png ${GITLAB_INSTALL_DIR}/app/assets/images/auth_buttons/
COPY --chown=git:git auth_helper.rb ${GITLAB_INSTALL_DIR}/app/helpers/
RUN chmod 644 ${GITLAB_INSTALL_DIR}/app/assets/images/auth_buttons/redmine_64.png \
    ${GITLAB_INSTALL_DIR}/app/helpers/auth_helper.rb