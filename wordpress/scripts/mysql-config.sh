#!/bin/bash

# Start service
/usr/bin/mysqld_safe > /dev/null 2>&1 &

# Wait for confirmation of MySQL service startup
RET=1
while [[ RET -ne 0 ]]; do
  sleep 5 && ps -ef | grep mysql > /dev/null 2>&1 && RET=$?
done

# Set root password
mysqladmin -uroot password "$MYSQL_PASSWORD"

# Create database
mysql -uroot -p"${MYSQL_PASSWORD}" -e "CREATE DATABASE ${MYSQL_DATABASE}; GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USERNAME}'@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}'; FLUSH PRIVILEGES;"

# Stop MySQL server
killall mysqld
