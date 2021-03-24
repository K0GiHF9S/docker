FROM jenkinsci/blueocean:1.24.4

USER root
RUN cd /tmp && \
    wget -O IPAfont.zip http://moji.or.jp/wp-content/ipafont/IPAfont/IPAfont00303.zip && \
    unzip IPAfont.zip && \
    mkdir -p /usr/share/fonts/opentype/ipafont-gothic && \
    mkdir -p /usr/share/fonts/opentype/ipafont-mincho && \
    cp IPAfont*/ipag*.ttf /usr/share/fonts/opentype/ipafont-gothic && \
    cp IPAfont*/ipam*.ttf /usr/share/fonts/opentype/ipafont-mincho && \
    rm -r IPAfont* && \
    mkdir -p /usr/lib/jvm/java-1.8-openjdk/lib/fonts/fallback && \
    cd /usr/lib/jvm/java-1.8-openjdk/lib/fonts/fallback && \
    ln -s /usr/share/fonts/opentype/ipafont-gothic/ipag.ttf && \
    ln -s /usr/share/fonts/opentype/ipafont-gothic/ipagp.ttf && \
    ln -s /usr/share/fonts/opentype/ipafont-mincho/ipam.ttf && \
    ln -s /usr/share/fonts/opentype/ipafont-mincho/ipamp.ttf

RUN apk --no-cache add cppcheck \
                    openjdk8 \
                    doxygen \
                    graphviz \
                    python3-dev \
                    py3-pip \
                    cloc && \
    pip3 install --upgrade pip

RUN pip3 install python-redmine && \
    pip3 install python-gitlab && \
    pip3 install lizard && \
    pip3 install jinja2

USER jenkins