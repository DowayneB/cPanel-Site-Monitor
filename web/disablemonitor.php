<?php
 $data = file_get_contents('php://input');
 $dats = json_decode($data);
 $domain = $dats->domainName;
 $bypass = $dats->bypassLocation;
 exec("echo ''  > ".$bypass."ahsite.conf");
?>

