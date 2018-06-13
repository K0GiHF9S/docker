FROM sameersbn/gitlab:9.1.4

RUN apt-get update && apt-get -y install \
    curl \
    patch

RUN curl https://raw.githubusercontent.com/ksoichiro/gitlab-i18n-patch/master/patches/v9.1.4/app_ja.patch -o /tmp/app_ja.patch
RUN cd /home/git/gitlab && patch -p1 < /tmp/app_ja.patch

RUN gem install omniauth-redmine
RUN sed -i -e "/^gem 'rack-oauth2'/a gem 'omniauth-redmine'" /home/git/gitlab/Gemfile && \
    sudo -u git -H bundle install --without development test --path vendor/bundle --no-deployment
RUN mkdir /home/git/repositories && \
    bundle exec rake assets:precompile RAILS_ENV=production

COPY docker.patch /tmp/
RUN cd ${GITLAB_RUNTIME_DIR} && patch -p1 < /tmp/docker.patch