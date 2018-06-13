FROM jenkins:2.60.3

USER root
RUN apt-get update && apt-get -y install \
    cppcheck \
    default-jre \
    doxygen \
    graphviz

RUN mkdir /usr/share/plantuml/
RUN curl -L https://sourceforge.net/projects/plantuml/files/latest/download -o /usr/share/plantuml/plantuml.jar

USER jenkins