FROM sameersbn/gitlab:9.1.4

COPY assets/runtime/ ${GITLAB_RUNTIME_DIR}/

RUN apt-get update && apt-get -y install patch curl
RUN curl https://raw.githubusercontent.com/ksoichiro/gitlab-i18n-patch/master/patches/v9.1.4/app_ja.patch -o /tmp/app_ja.patch
RUN cd /home/git/gitlab && patch -p1 < /tmp/app_ja.patch