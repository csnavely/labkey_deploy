#!/bin/bash

SPIN_USER="bpb"
CONTAINER_NAME="metatlas_lims-app"
VERSION=`date "+%Y-%m-%d-%H-%M"`
echo "$VERSION"
docker image build --tag "$CONTAINER_NAME-app:$VERSION" .
docker image tag "$CONTAINER_NAME-app:$VERSION" "registry.spin.nersc.gov/$SPIN_USER/$NAME-app:$VERSION"
docker image push "registry.spin.nersc.gov/$SPIN_USER/$CONTAINER_NAME-app:$VERSION
