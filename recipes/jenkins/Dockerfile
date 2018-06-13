FROM jenkins:2.60.3

USER root
RUN apt-get update && apt-get -y install \
    cppcheck \
    default-jre \
    doxygen \
    graphviz

# RUN curl -L https://downloads.sourceforge.net/projects/plantuml/files/plantuml.jar -o /usr/local/bin
COPY plantuml.jar /usr/local/bin/

USER jenkins