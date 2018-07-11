#!/bin/bash
#MuninMaster
muninmaster='master'
#MuninNode
muninnode='slave'
#docker
docker='master'
#syslog
syslog='master'
#
#Master 10.0.0.4
#Slave 	10.0.0.5
#
echo '########################################'
echo '########## install Munnin ##############'
echo '########################################'
bash /linux_opdrachten/LinuxMachine/eind2/install_config_munin.sh "$muninmaster" "$muninnode"
echo '########################################'
echo '########## Install Docker ##############'
echo '########################################'
bash /linux_opdrachten/LinuxMachine/eind2/install_docker.sh "$docker"
echo '########################################'
echo '########## Install Syslog ##############'
echo '########################################'
bash /linux_opdrachten/LinuxMachine/eind2/install_syslog_ng.sh "$syslog"
#replace config file's
#salt-cp "*$docker" ../salt_conf2/{docker conf file} /etc/{location file to be placed}
##########################################
