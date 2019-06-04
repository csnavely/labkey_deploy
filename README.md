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

This is the LabKey Server


## db

This is the PostGresSQL service

## web

This is the Apache/Tomcat

## volume1

This is interactive I/O to the SPIN GPFS path

## volume2

This is the ro mount of historical data on /project (or CSCRATCH or projectb)

