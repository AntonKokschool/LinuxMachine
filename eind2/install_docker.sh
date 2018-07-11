#!/bin/bash
#docker
docker=$1
#
#Master 10.0.0.4
#Slave 	10.0.0.5
#
salt "*" cmd.run 'apt-get update'
salt "*$docker" cmd.run 'apt-get install -y docker-ce'
#replace config file's
#salt-cp "*$docker" ../salt_conf2/{docker conf file} /etc/{location file to be placed}
##########################################
