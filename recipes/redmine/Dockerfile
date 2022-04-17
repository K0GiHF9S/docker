ARG REDMINE_TAG
FROM sameersbn/redmine:${REDMINE_TAG}

RUN DEPS='fonts-ipafont' \
    && apt-get update && apt-get -y --no-install-recommends install $DEPS \
    && rm -rf /var/lib/apt/lists/* && \
    fc-cache -fv

RUN sed -i -E "s@:dalli_store@:mem_cache_store@g" $REDMINE_RUNTIME_ASSETS_DIR/config/redmine/additional_environment.rb
