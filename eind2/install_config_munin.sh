#!/bin/bash
echo "$1"
#MuninMaster
test='slave'
muninmaster='Thema24-15-UBU-17-10-slave:'
echo "$muninmaster"
#MuninNode
muninnode='master'
echo "$muninnode"
# Master	10.0.0.4
# Slave		10.0.0.5
muninnode='master'
salt "*" cmd.run 'apt-get update'
echo 'install muninmaster'
#salt "*slave" cmd.run 'apt-get install -y apache2 apache2-utils'
salt "*$test" cmd.run 'apt-get install -y apache2 apache2-utils'
salt "$muninmaster" cmd.run 'apt-get install -y apache2 apache2-utils'
echo 'testaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'
salt "*$muninmaster" cmd.run 'apt-get install -y libcgi-fast-perl libapache2-mod-fcgid'
salt "*$muninmaster" cmd.run 'a2enmod fcgid'
salt "*$muninmaster" cmd.run 'apt-get install -y munin'
#echo 'apt-get install -y munin'
#chance config file's
salt-cp "*$muninmaster" ../salt_conf2/munin.conf /etc/munin/munin.conf
salt-cp "*$muninmaster" ../salt_conf2/apache.conf /etc/munin/apache.conf
##########################################
salt "*$muninnode" cmd.run 'apt-get install -y munin-node'
salt-cp "*$muninnode" ../salt_conf2/munin_node.conf /etc/munin/munin-node.conf
salt "*" cmd.run 'service munin-node restart'
salt "*$muninmaster" cmd.run 'service apache2 restart'
