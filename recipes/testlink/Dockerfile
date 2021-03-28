ARG TESTLINK_TAG
FROM bitnami/testlink:${TESTLINK_TAG}

RUN sed -e "s/^IncludeOptional \/opt\/bitnami\/apache\/conf\/vhosts\/\*\.conf/Include \/opt\/bitnami\/apache\/conf\/testlink.conf/g" -i /opt/bitnami/apache/conf/httpd.conf
COPY testlink.conf /opt/bitnami/apache/conf/