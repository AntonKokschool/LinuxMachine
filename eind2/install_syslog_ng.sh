#!/bin/bash
#docker
syslog=$1
#
#Master 10.0.0.4
#Slave 	10.0.0.5
#
salt "*" cmd.run 'apt-get update'
salt "*$syslog" cmd.run 'apt-get install -y syslog-ng syslog-ng-core'
#replace config file's
#salt-cp "*$syslog" ../salt_conf2/{syslog conf file} /etc/{location file to be placed}
##########################################
