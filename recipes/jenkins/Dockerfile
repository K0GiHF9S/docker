FROM jenkins:2.60.3

USER root
RUN apt-get update && apt-get -y --no-install-recommends install \
    cppcheck \
    default-jre \
    doxygen \
    graphviz \
    && rm -rf /var/lib/apt/lists/*

RUN wget https://bootstrap.pypa.io/get-pip.py && \
    python get-pip.py && \
    pip install python-redmine

USER jenkins