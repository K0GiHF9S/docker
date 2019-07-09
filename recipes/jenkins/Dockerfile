FROM jenkinsci/blueocean:1.17.0-bcc31d32159f

USER root
RUN apk --no-cache add cppcheck \
                    openjdk8 \
                    doxygen \
                    graphviz \
                    python \
                    cloc

RUN cd /tmp && \
    wget -O IPAfont.zip https://ipafont.ipa.go.jp/old/ipafont/IPAfont00303.php && \
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

RUN wget https://bootstrap.pypa.io/get-pip.py && \
    python get-pip.py && \
    pip install python-redmine && \
    pip install python-gitlab && \
    pip install lizard && \
    pip install jinja2 && \
    rm get-pip.py

USER jenkins