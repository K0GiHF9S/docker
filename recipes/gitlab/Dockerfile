FROM sameersbn/gitlab:9.1.4

COPY docker.patch /tmp/
RUN DEPS='curl patch' \
    && apt-get update && apt-get -y --no-install-recommends install $DEPS \
    && rm -rf /var/lib/apt/lists/* \
    && curl https://raw.githubusercontent.com/ksoichiro/gitlab-i18n-patch/master/patches/v9.1.4/app_ja.patch -o /tmp/app_ja.patch \
    && cd /home/git/gitlab \
    && patch -p1 < /tmp/app_ja.patch \
    && cd ${GITLAB_RUNTIME_DIR} \
    && patch -p1 < /tmp/docker.patch \
    && apt-get purge -y --auto-remove $DEPS \
    && rm /tmp/app_ja.patch \
    && rm /tmp/docker.patch

RUN cd /home/git/gitlab \
    && gem install omniauth-redmine \
    && sed -i -e "/^gem 'rack-oauth2'/a gem 'omniauth-redmine'" Gemfile \
    && sudo -u git -H bundle install --without development test --path vendor/bundle --no-deployment \
    && mkdir /home/git/repositories \
    && bundle exec rake assets:precompile RAILS_ENV=production
