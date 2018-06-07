<?php
try {
$db = new PDO('mysql:host=localhost;dbname=dom_site_monitor','dom_site_monitor','8r56ai9y5M-1');
} catch (PDOException $e) {
 print "Error!: ". $e->getMessage(). "</br>";
 die();
}
