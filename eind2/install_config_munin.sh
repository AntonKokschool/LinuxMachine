#!/bin/bash
muninmaster=$1
echo "muninmaster is $muninmaster"
#MuninNode
muninnode=$2
echo "muninnode is $muninnode"
# Master        10.0.0.4
# Slave         10.0.0.5
salt "*" cmd.run 'apt-get update'
echo 'install muninmaster'
salt "*$muninmaster" cmd.run 'apt-get install -y apache2 apache2-utils'
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
