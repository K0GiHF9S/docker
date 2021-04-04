ARG ALFRESCO_SHARE_TAG
FROM alfresco/alfresco-share:${ALFRESCO_SHARE_TAG}

ARG TOMCAT_DIR=/usr/local/tomcat

ARG SERVER_NAME

RUN sed -i '/Connector port="8080"/a scheme="https" secure="true"' $TOMCAT_DIR/conf/server.xml \
  && sed -i "/Connector port=\"8080\"/a proxyName=\"alfresco.${SERVER_NAME}\" proxyPort=\"443\"" $TOMCAT_DIR/conf/server.xml

# Patch for https://github.com/Alfresco/acs-community-packaging/issues/367
RUN sed -i 's@<show-authorization-status>true</show-authorization-status>@<show-authorization-status>false</show-authorization-status>@' \
  $TOMCAT_DIR/shared/classes/alfresco/web-extension/share-config-custom.xml

# Hide Repositry library in the header
RUN sed -i 's@<visible>false</visible>@<visible>true</visible>@' \
  $TOMCAT_DIR/shared/classes/alfresco/web-extension/share-config-custom.xml
