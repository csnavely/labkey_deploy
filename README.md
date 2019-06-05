# metlims
Instructions and Docker setup for running our LIMS

Download tar.gz file of production installation here:
https://www.labkey.com/products-services/labkey-server/download-community-edition/

Uncompress the tar file to the root of the repo.

Overall instructions:
https://www.labkey.org/Documentation/wiki-page.view?name=manualInstall

Instructions for setting up required components are here:
https://www.labkey.org/Documentation/wiki-page.view?name=installComponents#folder


# Overall Setup

## app
This is the LabKey Server with Apache Tomcat. Several LabKey community edition
files are needed from the tarball. The following files are copied into the 
container:
- labkeywebapp
- modules
- pipeline-lib
- labkey.xml
- tomcat-lib

They should be present in the same directory as the Dockerfile so that the
copies work. 


## db
At the moment is empty since we are using the base postgres:10 image.

# docker-compose.yml
This runs and connects the LabKey server with the Postgres database container.
