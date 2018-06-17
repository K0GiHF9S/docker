FROM jenkins:2.60.3

USER root
RUN apt-get update && apt-get -y --no-install-recommends install \
    cppcheck \
    default-jre \
    doxygen \
    graphviz \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir /usr/share/plantuml/ \
    && curl -L https://sourceforge.net/projects/plantuml/files/latest/download -o /usr/share/plantuml/plantuml.jar

USER jenkins