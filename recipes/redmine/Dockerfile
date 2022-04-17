ARG REDMINE_TAG
FROM sameersbn/redmine:${REDMINE_TAG}

COPY runtime.patch /tmp

RUN cd ${REDMINE_RUNTIME_ASSETS_DIR} && \
    patch -u < /tmp/runtime.patch && \
    rm /tmp/runtime.patch

RUN DEPS='fonts-ipafont curl' \
    && apt-get update && apt-get -y --no-install-recommends install $DEPS \
    && rm -rf /var/lib/apt/lists/* && \
    fc-cache -fv

