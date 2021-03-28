ARG ALFRESCO_SEARCH_TAG
FROM alfresco/alfresco-search-services:${ALFRESCO_SEARCH_TAG}

# Configure Alfresco Service Name
RUN sed -i '/^bash.*/i sed -i "'"s/alfresco.host=localhost/alfresco.host=alfresco/g"'" ${DIST_DIR}/solrhome/templates/rerank/conf/solrcore.properties\n' \
    ${DIST_DIR}/solr/bin/search_config_setup.sh \
    && sed -i '/^bash.*/i sed -i "'"s/solr.host=localhost/solr.host=solr6/g"'" ${DIST_DIR}/solrhome/conf/shared.properties\n' \
    ${DIST_DIR}/solr/bin/search_config_setup.sh \
# Enable Cross Locale SOLR Configuration
    && sed -i '/^bash.*/i sed -i "'"/alfresco.cross.locale.datatype/s/^#//g"'" $DIST_DIR/solrhome/conf/shared.properties\n' \
    ${DIST_DIR}/solr/bin/search_config_setup.sh
