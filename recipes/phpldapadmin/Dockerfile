FROM osixia/phpldapadmin:0.9.0

RUN sed -r "s/^(\\\$servers = new Datastore\(\);)/\1\n\$config->custom->appearance['language'] = 'ja_JP';/g" -i /container/service/phpldapadmin/assets/config/config.php && \
    echo "ja_JP.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen --purge ja_JP.UTF-8 && \
    dpkg-reconfigure -f noninteractive locales && \
    update-locale LANG=ja_JP.UTF-8 LC_ALL=ja_JP.UTF-8 && \
    rm /etc/locale.gen
