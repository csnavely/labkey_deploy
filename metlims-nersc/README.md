

### Create nfs volume.

Has to be done for dev and prod environments:

```bash
rancher volumes create --driver=rancher-nfs db.metlims-nersc
```

Also to create volumes for the app do the same:

```bash
export RANCHER_ENVIRONMENT=dev-cattle
rancher volume create --driver rancher-nfs app.metlims-nersc
export RANCHER_ENVIRONMENT=prod-cattle
rancher volume create --driver rancher-nfs app.metlims-nersc
```
