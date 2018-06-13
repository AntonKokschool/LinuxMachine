#!/bin/bash
echo "$1"
##is gedaan
#salt "*$1" cmd.run 'apt-get update > update.txt'
#salt "*$1" cmd.run 'apt-get install -y apache2 apache2-utils > install.txt'
#salt "*$1" cmd.run 'apt-get install -y libcgi-fast-perl libapache2-mod-fcgid > iets.txt'
#salt "*$1" cmd.run 'a2enmod fcgid'
#echo 'a2enmod fcgid'
#salt "*$1" cmd.run 'apt-get install -y munin'
#echo 'apt-get install -y munin'
#chance config file
tmpfile=/etc/munin/munin.conf
salt "*$1" cmd.run "sed -i 's|#dbdir|dbdir|' $tmpfile"
salt "*$1" cmd.run "sed -i 's|/var/cache/munin/www|/var/www/munin|' $tmpfile"
salt "*$1" cmd.run "sed -i 's|#htmldir|htmldir|' $tmpfile"
salt "*$1" cmd.run "sed -i 's|#logdir|logdir|' $tmpfile"
salt "*$1" cmd.run "sed -i 's|#rundir|rundir|' $tmpfile"
salt "*$1" cmd.run "sed -i 's|#tmpldir|tmpldir|' $tmpfile"

salt "*$1" cmd.run "sed -i 's|##|#|' $tmpfile"
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#salt "*$1" cmd.run ""
salt "*$1" cmd.run "mkdir /var/www/munin"
salt "*$1" cmd.run "chown munin:munin /var/www/munin"
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
salt "*$1" cmd.run "sed -i 's|localhost.localdomain|MuninMaster|' $tmpfile"

#Apache.conf
tmpfile=/etc/munin/apache.conf
salt "*$1" cmd.run "sed -i 's|/var/cache/munin/www|/var/cache/munin/www|' $tmpfile"
salt "*$1" cmd.run "sed -i 's|Order allow|#Order allow|' $tmpfile"
salt "*$1" cmd.run "sed -i 's|Allow from localhost|#Allow from localhost|' $tmpfile"
salt "*$1" cmd.run "sed -i 's|Options None|#Options None|' $tmpfile"

#salt "*$1" cmd.run "sed -n 'H;${x;s/^\n//;s/This file can be used .*$/Options FollowSymLinks SymLinksIfOwnerMatch\n&/;p;}' $tmpfile"
#salt "*$1" cmd.run "sed -n 'H;${x;s/^\n//;s/Options FollowSymLinks SymLinksIfOwnerMatch .*$/Require all granted\n&/;p;}' $tmpfile"
#sed -n 'H;${x;s/^\n//;s/Options FollowSymLinks SymLinksIfOwnerMatch .*$/Require all granted\n&/;p;}' /etc/munin/apache.conf


#sed -n 'H;${x;s/^\n//;s/This file can be used .*$/Options FollowSymLinks SymLinksIfOwnerMatch\n&/;p;}' resolv.conf
#sed -n 'H;${x;s/^\n//;s/Options FollowSymLinks SymLinksIfOwnerMatch .*$/Require all granted\n&/;p;}' resolv.conf
