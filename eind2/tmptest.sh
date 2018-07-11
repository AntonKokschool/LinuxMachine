#!/bin/bash
echo "*$1*"
syslogmaster=master
echo "$syslogmaster"
#MuninNode
syslognode=slave
echo "$syslognode"
# Master        10.0.0.4
# Slave         10.0.0.5
salt "*" cmd.run 'apt-get update'
echo 'install muninmaster'
salt "*$syslogmaster" cmd.run 'apt-get install syslog-ng'
#chance config file's
salt-cp "*$muninmaster" ../salt_conf2/munin.conf /etc/munin/munin.conf
salt-cp "*$muninmaster" ../salt_conf2/apache.conf /etc/munin/apache.conf
##########################################
salt "*$muninnode" cmd.run 'apt-get install -y munin-node'
salt-cp "*$muninnode" ../salt_conf2/munin_node.conf /etc/munin/munin-node.conf
salt "*" cmd.run 'service munin-node restart'
salt "*$muninmaster" cmd.run 'service apache2 restart'
