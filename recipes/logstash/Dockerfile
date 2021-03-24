FROM docker.elastic.co/logstash/logstash:7.10.1

RUN cd /usr/share/logstash && \
    curl -L https://downloads.mysql.com/archives/get/p/3/file/mysql-connector-java-8.0.18.tar.gz | tar zx && \
    mv mysql-connector-java-8.0.18/mysql-connector-java-8.0.18.jar . && \
    rm -rf mysql-connector-java-8.0.18