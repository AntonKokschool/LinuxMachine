#!/bin/bash
echo "$1"
#MuninMaster
muninmaster='slave'
#MuninNode
muninnode='master'
:"
Master 	10.0.0.4
Slave 	10.0.0.5
"

muninnode='master'
salt "*" cmd.run 'apt-get update'
salt "*$muninmaster" cmd.run 'apt-get install -y apache2 apache2-utils'
salt "*$muninmaster" cmd.run 'apt-get install -y libcgi-fast-perl libapache2-mod-fcgid'
salt "*$muninmaster" cmd.run 'a2enmod fcgid'
salt "*$muninmaster" cmd.run 'apt-get install -y munin'
#echo 'apt-get install -y munin'
#chance config file's
salt-cp "*$muninmaster" ../salt_conf/munin.conf /etc/munin/munin.conf
salt-cp "*$muninmaster" ../salt_conf/apache.conf /etc/munin/apache.conf
##########################################
salt "*$muninnode" cmd.run 'apt-get install -y munin-node'
salt-cp "*$muninnode" ../salt_conf/munin_node.conf /etc/munin/munin-node.conf
salt "*" cmd.run 'service munin-node restart'
salt "*$muninmaster" cmd.run 'service apache2 restart'
