# Postgres installation on Kubernetes cluster

## Install 
```sh
./install.sh
```
* A random password will get assigned for `postgres` user if you have not specified a password.  The password may be obtained using following script:
```sh
./get_pwd.sh
```
## Test
* Make sure docker is running from machine you are testing.
* Connect to postgres:
```sh
docker run -it --rm postgres psql -h <hostname pointing to load balancer> -U postgres -p 5432
```
## Initialize DB
* Review `init_values.yaml` for  which DBs you would like to initialize.
* Run init postgres helm chart to create necessary DB, users, roles etc:
```sh
./init_db.sh
```
Be aware of version of helm chart corresponding to mosip version.

## Delete
Note that PVC and PV are not deleted after helm delete.  So if you would like to postgres again, make sure you delete PVC and PV.

## Troubleshooting
* If you face login issues even when the password entered is correct, it could be due to previous PVC, and PV.  Delete them, but exercise caution as this will delete all persistent data.

