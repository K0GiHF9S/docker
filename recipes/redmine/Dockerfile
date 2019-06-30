FROM sameersbn/redmine:4.0.4

COPY runtime.patch /tmp

RUN cd ${REDMINE_RUNTIME_ASSETS_DIR} && \
    patch -u < /tmp/runtime.patch && \
    rm /tmp/runtime.patch