ARG ALFRESCO_TAG
FROM alfresco/alfresco-content-repository-community:${ALFRESCO_TAG}

ARG TOMCAT_DIR=/usr/local/tomcat

USER root

ARG ALFRESCO_API_TAG
RUN mkdir -p $TOMCAT_DIR/webapps \
    && curl https://artifacts.alfresco.com/nexus/service/local/repositories/releases/content/org/alfresco/api-explorer/${ALFRESCO_API_TAG}/api-explorer-${ALFRESCO_API_TAG}.war \
    -sSL --output $TOMCAT_DIR/webapps/api-explorer.war

USER ${IMAGEUSERNAME}
