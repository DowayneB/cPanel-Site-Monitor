<?php
 $data = file_get_contents('php://input');
 $dats = json_decode($data);
 $domain = $dats->domainName;
 $bypass = $dats->bypassLocation;
 exec("mkdir -p $bypass 2> /tmp/test");
 exec("echo ".$domain." > ".$bypass."ahsite.conf");
 //exec("whoami > ".$bypass."ahsite.conf");
?>
