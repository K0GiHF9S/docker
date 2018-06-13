FROM jenkins:2.60.3

USER root
RUN apt-get update && apt-get -y install \
    cppcheck \
    default-jre \
    doxygen \
    graphviz

USER jenkins

RUN mkdir /usr/share/plantuml/
# RUN curl -L https://downloads.sourceforge.net/projects/plantuml/files/plantuml.jar -o /usr/share/plantuml/plantuml.jar
COPY plantuml.jar /usr/share/plantuml/
