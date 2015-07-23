#!/bin/bash
exec >/dev/null
exec 2>/dev/null
(
trap "" TERM
while true
do
if [ -e /run/mysqld/mysqld.pid ]
then
echo "1" > /dev/null
else
systemctl restart mysqld > /dev/null && date >> /root/checkdb/restartdb.log && echo "restart mysqld" >> /root/checkdb/restartdb.log
fi
if [ -e /run/mysqld/mysqld.pid ]
then
echo "1" > /dev/null
else
date >> /root/checkdb/restartdb.log && echo "ERROR: restart dont successful" >> /root/checkdb/restartdb.log
fi
sleep 1
done
)&
