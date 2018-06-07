# cPanel-Site-Monitor
cPanel plugin and script to get response codes for sites, configurable and bypassable from each individual cPanel

Easy to install.

1) download dom_site_monitor.zip and dom_installer.sh to root directory
2) run #> sh dom_installer.sh

Once plugin is installed, you can choose to, or where to mail the issue to by editing the 'mailissue' function in the dom_site_monitor script which has been moved to /usr/bin/

if you wish to use another password for the response code database, change the below files:
1) dom_installer.sh
2) /usr/local/cpanel/base/frontend/paper_lantern/dom_site_monitor/dbconnect.php

