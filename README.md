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

Should be something like this:

```
[bpb@Benjamins-MBP-4 ~ 03:09 PM] ~/repos/metlims/metlims-nersc (master) > tree -L 2
.
├── app
│   ├── Dockerfile
│   ├── LabKey19.1.1-63156.2-community-bin
│   ├── build.sh
│   ├── example_labkey.xml
│   ├── labkey.xml
│   ├── labkeywebapp
│   ├── modules
│   ├── pipeline-lib
│   └── tomcat-lib
├── docker-compose.yml
└── rancher-compose.yml
```

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

# example_labkey.xml_string
This is what your "labkey.xml" file needs to contain.  You will have to have the password in a file that you put in secrets like This

```
rancher secret create db.metlims-nersc.postgres_password2 postgres.env
```

You will have to create (and maybe remove) an nfs volume like This

```
rancher volume create --driver rancher-nfs db.metlims-nersc
rancher volume rm db.metlims-nersc
```

Other useful commands

```
docker login registry.spin.nersc.gov
rancher exec -it metlims-nersc/db /bin/bash
```

push the local docker image to the registry with "build.sh" which does this:

```
#!/bin/bash

SPIN_USER="bpb20"
CONTAINER_NAME="metatlas_lims-app"
VERSION=`date "+%Y-%m-%d-%H-%M"`
echo "$VERSION"
docker image build --tag "$CONTAINER_NAME:$VERSION" .
docker image tag "$CONTAINER_NAME:$VERSION" "registry.spin.nersc.gov/$SPIN_USER/$CONTAINER_NAME:$VERSION"
docker image push "registry.spin.nersc.gov/$SPIN_USER/$CONTAINER_NAME:$VERSION"
```

Change the version of the image in docker-compose.yml each time you do this.

Your folder for the app should look something like this after unpacking the LabKey Community edition.  You will have to move some of the folders out of the LabKey original folder.

```
[bpb@Benjamins-MBP-4 ~ 03:07 PM] ~/repos/metlims/metlims-nersc/app (master) > tree -L 1
.
├── Dockerfile
├── LabKey19.1.1-63156.2-community-bin
├── build.sh
├── example_labkey.xml
├── labkey.xml
├── labkeywebapp
├── modules
├── pipeline-lib
└── tomcat-lib
```
