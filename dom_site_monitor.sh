#!/bin/bash
#Script to do a daily monitor of websites
eWritten by Dowayne Breedt 

#The enable button creates a directory in the users home directory called ah_monitor, and inserts the site name into ahsite.conf, and adds / removes the site from the sitelist in /etc

#Additionally, any codes which are bypassed in the cPanel plugin are added to the bypasslist in the same directory. 



timestamp=$(date +%d%m%y)
day=$(date +%a" "%B" "%d" "%Y)
#config file locations
sites=/etc/dom_site_monitor/sitelist


#log file locations
errlogfile=/var/log/dom_site_monitor/errorlogs/error_log_$timestamp
runlogfile=/var/log/dom_site_monitor/runlogs/runlog_$timestamp
failedsitelist=/etc/dom_site_monitor/failedsitelist

recheck=false
#if -r flag is supplied then change the sitelist, and then make checkbypass email the issue.
if [[ $1 == '-r' ]] ; then
 recheck=true
 sites=$failedsitelist
 runlogfile=/var/log/dom_site_monitor/runlogs/runlog_$timestamp"_1"
fi
{

 logissue() {
  echo "adding $site to failed site list to be checked again in an hour."
  echo $site >> $failedsitelist 
 }

 mailissue() {
  echo "$day - $site - $code" >> $errlogfile
  #this only runs when -r flag is supplied, it is called from the checkbypass function depending on this flag.
  #get reason from db and mail to client
  errname=$(mysql --skip-column-names -e "select name from responsecodes.codes where code = $code")
  #echo $errname
  errreason=$(mysql --skip-column-names -e "select reason from responsecodes.codes where code = $code")
  #echo $errreason
  #get email address from WHM API, but don't mail the client yet.
  emailaddr=$(whmapi1 listaccts search=$site searchtype=domain | grep email: | awk '{print $2}')
  echo "issue found on $site, site logged in $errlogfile and also mailed to $emailaddr"
  rm /etc/dom_site_monitor/failedsitelist
 }
 
 checkbypass() {
   #set logging function depending on whether -r flag is used
   if [[ $recheck == true ]] ; then
     log=mailissue
   else
    log=logissue
   fi
   echo "$site returned a $code code"
   homedir=$(cat /etc/trueuserdomains | grep $site | awk '{print $2}')
   bypassfile=/home/$homedir/ah_monitor/bypasslist
   echo checking $bypassfile for $code
   if grep -q "$code" $bypassfile
    then
     echo "$code found in bypass list"
     bypassed=true
   else
    # code if not found
    $log
   fi
 }
 
  checkdomain(){
 
  code=$(curl -I --connect-timeout 10 --insecure $site?nocache | sed -n 1p | awk '{print $2}')
  # if 200 site is OK, so do based on other errors.
  codelength=$(expr length $code)
  if [[ codelength -lt 3 ]] ; then
   #this probably means that curl failed, try one more time after the script is done with failedsitelist.
   echo "curl timed out for $site ."
   failedsites=/etc/dom_site_monitor/failedsitelist_$timestamp
   echo $site >> $failedsites
  elif [[ $code != "200" ]] ; then
   # the response code is not 200, so check what's up, query the db with the code, and get the reason.
   # check for domain in bypasslist
   if [[ $code == 4** ]] ; then
    checkbypass
   elif [[ $code == 5** ]] ; then
    # check to see if client has chosen to bypass 300 codes
    checkbypass
   else
   # only check for 400's and 500's
   echo "o" /dev/null 
  fi
  else
   # response code OK, don't alert.
   echo "found no issues with $site"
  fi
 }
 
 # get response headers for each site only if they resolve to the server.
 #first delete old sitelist, and recompile depending on which sites are enabled from their home directories
 rm /etc/dom_site_monitor/sitelist
 files=$(find /home/*/ah_monitor/ahsite.conf)
 for file in $files ; do
  domain=$(cat $file)
  if [[ $domain != "" ]] ; then
   echo $domain >> /etc/dom_site_monitor/sitelist
  fi
 done
 for site in `cat $sites` ; do
  servip=$(whmapi1 listaccts search=$site searchtype=domain | grep ip: | awk '{print $2}')
  resolvip=$(dig $site +short);
  if [[ $servip == $resolvip ]] ; then
   checkdomain
  else
  #site is not resolving to server, do not check
   echo $site does not resolve to this server.
  fi
 done
 #now run checkdomain again with all the failed sites.
 if [[ -e $failedsites ]] ; then
  for site in `cat $failedsites` ; do
   checkdomain
  done
 fi
 #now do cleanup, remove failedsites list, and also check for logfiles older than 3 days and delete them, also refresh sitelist
 #remove failed sites
 if [[ -e $failedsites ]] ; then
  rm $failedsites
 fi
 #delete old logfiles
 find /var/log/dom_site_monitor/ -mtime +3 -type f -delete
 #refresh sitelist
 ##need to thnk about this
} >> $runlogfile
 
