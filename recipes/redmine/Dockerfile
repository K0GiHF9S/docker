ARG REDMINE_TAG
FROM sameersbn/redmine:${REDMINE_TAG}

RUN DEPS='fonts-ipafont' \
    && apt-get update && apt-get -y --no-install-recommends install $DEPS \
    && rm -rf /var/lib/apt/lists/* && \
    fc-cache -fv

RUN cd ${REDMINE_INSTALL_DIR} \
    && sudo -HEu ${REDMINE_USER} bundle config set path "${REDMINE_INSTALL_DIR}/vendor/bundle" \
    && sudo -HEu ${REDMINE_USER} bundle config set without development test \
    && sudo -HEu ${REDMINE_USER} bundle add oauth-plugin --git https://github.com/K0GiHF9S/oauth-plugin.git
RUN echo "require 'oauth/rack/oauth_filter'" >> ${REDMINE_INSTALL_DIR}/config/additional_environment.rb \
    && echo "config.middleware.use OAuth::Rack::OAuthFilter" >> ${REDMINE_INSTALL_DIR}/config/additional_environment.rb \
    && echo "config.active_job.queue_adapter = ActiveJob::QueueAdapters::AsyncAdapter.new max_threads: 3" >> ${REDMINE_INSTALL_DIR}/config/additional_environment.rb
