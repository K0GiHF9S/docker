FROM sameersbn/redmine:4.0.4

COPY runtime.patch /tmp

RUN cd ${REDMINE_RUNTIME_ASSETS_DIR} && \
    patch -u < /tmp/runtime.patch && \
    rm /tmp/runtime.patch

RUN DEPS='fonts-ipafont' \
    && apt-get update && apt-get -y --no-install-recommends install $DEPS \
    && rm -rf /var/lib/apt/lists/* && \
    fc-cache -fv

RUN sed -i -E "s/^  # rmagick_font_path:.*/  rmagick_font_path: \/usr\/share\/fonts\/opentype\/ipafont-gothic\/ipagp.ttf/" $REDMINE_RUNTIME_ASSETS_DIR/config/redmine/configuration.yml