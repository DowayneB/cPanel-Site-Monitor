<?php
try {
$db = new PDO('mysql:host=localhost;dbname=dom_site_monitor','database','pass');
} catch (PDOException $e) {
 print "Error!: ". $e->getMessage(). "</br>";
 die();
}
