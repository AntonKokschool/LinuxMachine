#!/bin/bash
echo "$1"
#MuninMaster
muninmaster='slave'
#MuninNode
muninnode='master'
salt "*" cmd.run 'lsof -i'
salt "*" cmd.run 'apt-get --purge remove -y apache2 apache2-utils libcgi-fast-perl libapache2-mod-fcgid munin munin-node docker-ce syslog-ng syslog-ng-core'
salt "*" cmd.run 'lsof -i'
