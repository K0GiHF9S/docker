ARG ELASTICSEARCH_TAG
FROM docker.elastic.co/elasticsearch/elasticsearch:${ELASTICSEARCH_TAG}

RUN elasticsearch-plugin install analysis-kuromoji
RUN elasticsearch-plugin install analysis-icu