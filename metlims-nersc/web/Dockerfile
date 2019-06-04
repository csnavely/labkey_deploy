FROM tomcat:7

RUN mkdir /usr/local/labkey
RUN mkdir /usr/local/labkey/apps /usr/local/labkey/labkey \
          /usr/local/labkey/backups /usr/local/labkey/src \
          /usr/local/labkey/src/labkey

ADD Labkey19.1.1-63156.2-community-bin /usr/local/labkey/src/labkey

RUN "echo $CATALINA_HOME"
RUN "echo $JAVA_HOME"
