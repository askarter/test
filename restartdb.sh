#!/bin/bash
if [ -e /run/mysqld/mysqld.pid ]
then
exit
else
systemctl restart mysqld > /dev/null && date >> /root/checkdb/restartdb.log && echo "restart mysqld" >> /root/checkdb/restartdb.log
fi
if [ -e /run/mysqld/mysqld.pid ]
then
exit
else
date >> /root/checkdb/restartdb.log && echo "ERROR: restart dont successful" >> /root/checkdb/restartdb.log
fi
exit 0
