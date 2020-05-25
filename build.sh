#/bin/bash

docker image rm mysql-nanibank-api
docker build . -t mysql-nanibank-api
