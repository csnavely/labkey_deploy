FROM tomcat:9.0.22-jdk13-openjdk-oracle

####### Environment variables from tomcat and their paths
# CATALINA_BASE:   /usr/local/tomcat
# CATALINA_HOME:   /usr/local/tomcat
# CATALINA_TMPDIR: /usr/local/tomcat/temp
# JRE_HOME:        /usr
# CLASSPATH:       /usr/local/tomcat/bin/bootstrap.jar:/usr/local/tomcat/bin/tomcat-juli.jar

# Instructions adapted from here: https://www.labkey.org/Documentation/wiki-page.view?name=manualInstall

# Move the LabKey Server Libraries
COPY tomcat-lib /usr/local/tomcat/lib

# Configure your LabKey Home directory
RUN mkdir -p /usr/local/labkey
COPY labkeywebapp /usr/local/labkey/labkeywebapp
COPY modules /usr/local/labkey/modules
COPY pipeline-lib /usr/local/labkey/pipeline-lib

# Move the LabKey Server Configuration File
#COPY labkey.xml /usr/local/tomcat/conf/Catalina/localhost/
COPY ROOT.xml /usr/local/tomcat/conf/Catalina/localhost/
