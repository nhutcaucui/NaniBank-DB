#/bin/bash

echo "STOP RUNNING COMMON MYSQL CONTAINER"
#docker exec mysql-nanibank-user mysqld --shutdown
docker stop -t 30 mysql-nanibank-user
docker rm -f mysql-nanibank-user
echo "DONE STOPPING"
#docker build . -t mysql:latest --no-cache
echo "STARTING RUNNING COMMON MYSQL CONTAINER"
docker run --name mysql-nanibank-user -d \
           -v mysql-nanibank-user-volume:/var/lib/mysql \
                --network common-net \
		-p 33060:3306 \
		-e MYSQL_ROOT_PASSWORD=nanibank \
                --restart always \
           mysql-nanibank-user:latest

echo "AWAIT CONTAINER BEING UP"
sleep 3
mysql -P 33060 --protocol=tcp -u root --password=nanibank --reconnect < user-db-product.sql
mysql -P 33060 --protocol=tcp -u root --password=nanibank --reconnect < company-db-product.sql
mysql -P 33060 --protocol=tcp -u root --password=nanibank --reconnect < partner-db-product.sql
#mysql -P 33061 --protocol=tcp -u root --password=nanibank < dummyinsert.sql
echo "DONE STARTING"
