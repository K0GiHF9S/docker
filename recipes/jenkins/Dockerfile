FROM jenkins:2.60.3

USER root
RUN apt-get update && apt-get -y --no-install-recommends install \
    cppcheck \
    default-jre \
    doxygen \
    graphviz \
    fonts-ipafont \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /usr/lib/jvm/java-8-openjdk-amd64/jre/lib/fonts/fallback && \
    cd /usr/lib/jvm/java-8-openjdk-amd64/jre/lib/fonts/fallback && \
    ln -s /usr/share/fonts/opentype/ipafont-gothic/ipag.ttf && \
    ln -s /usr/share/fonts/opentype/ipafont-gothic/ipagp.ttf && \
    ln -s /usr/share/fonts/opentype/ipafont-mincho/ipam.ttf && \
    ln -s /usr/share/fonts/opentype/ipafont-mincho/ipamp.ttf

RUN wget https://bootstrap.pypa.io/get-pip.py && \
    python get-pip.py && \
    pip install python-redmine && \
    rm get-pip.py

USER jenkins