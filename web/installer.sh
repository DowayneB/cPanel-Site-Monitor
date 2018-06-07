#!/bin/bash
cd /root
#download all files and unzip
wget http://deeznuts.dedicated.co.za/dom_site_monitor.zip
unzip dom_site_monitor
cd dom_site_monitor_installer
/usr/local/cpanel/scripts/install_plugin dom_site_monitor.tar.gz
#first create database, and it's user
mysql -e "create database dom_site_monitor; use dom_site_monitor; grant all privileges on dom_site_monitor to 'dom_site_monitor'@'localhost' identified by '8r56ai9y5M-1';"
mysql dom_site_monitor < responsecodes.sql
mysql -e "use dom_site_monitor; grant all privileges on codes to 'dom_site_monitor'@'localhost' identified by '8r56ai9y5M-1';"

#copy site_monitor script to /usr/bin/, and make executable.
cp dom_site_monitor.sh /usr/bin/dom_site_monitor
chmod 700 /usr/bin/dom_site_monitor

#create /etc/ and /var/log/ directories
mkdir /etc/dom_site_monitor
mkdir /var/log/dom_site_monitor

#move web files to plugin directory
cd web 
cp * /usr/local/cpanel/base/frontend/paper_lantern/dom_site_monitor/

#add crons
cat crons >> /etc/crontab
