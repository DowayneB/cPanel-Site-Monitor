<?php
/**
* Written by Dowayne Breedt
*/
include("/usr/local/cpanel/php/cpanel.php");
include("dbconnect.php");
$cpanel = new CPANEL();
print $cpanel->header( 'Site Monitor' );


//<cpanel PHP="loadvars()">
$userdata = $_CPANEL['USERDATA'];
$home = $_ENV['HOME'];
$domain = $_ENV['DOMAIN'];
$_ENV['BYPASS_LOCATION'] = $home.'/ah_monitor/';
$bypassdir = $_ENV['BYPASS_LOCATION'];
$conf = $bypassdir.'ahsite.conf';
$responsecodes = $db->query("select * from dom_site_monitor.codes;");
$tarray = array();
exec("cat ".$bypassdir."bypasslist",$tarray);
$tempv = array();
foreach ($tarray as $item){
 $tempv[] = str_replace(',','',$item); 
}
$jsonarray = json_encode($tempv);
$confdomain = exec("cat ".$conf);
if ($confdomain == $domain){
 $checked = "checked";
}else{
 $checked = "";
}
print_r($cus);
?>
<link rel="stylesheet" href="style.css"></link>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="funcs.js"></script>
<script>

$(document).ready(function(){
    var bypassedcodes = JSON.parse('<?= $jsonarray; ?>');
        for (var i in bypassedcodes) {
          if (i <= bypassedcodes.length){
                $("#" + bypassedcodes[i]).prop("checked","true");
        }
    }   


    $("#sorry").click(function(){
        $("#dev-container").toggle();
    });
    $("#dev").click(function(){
        $("#env").toggle();
    });
    if( $("#testcheck").is(':checked') ) $("#codes").show();  
    $("#testcheck").click(function(){
    if( $("#testcheck").is(':checked') ){
      $("#codes").slideDown("slow");
      enableahm("<?php echo $domain; ?>","<?php echo $bypassdir; ?>");
    }else{
     $("#codes").slideUp("slow");
      disableahm("<?php echo $domain; ?>","<?php echo $bypassdir; ?>");
    }
    });
    $(".codes").click(function(){
    if( $(this).is(':checked') ) enable("<?php echo $domain; ?>"," <?php echo $bypassdir; ?>",$(this).attr("name")); else disable("<?php echo $domain; ?>", "<?php echo $bypassdir; ?>",$(this).attr("name")); 
    });
 
});
</script>
<div id="dev-container">
 </div>
 <div id="env" class="alert alert-warning" hidden>
  <?
   //print_r($_ENV);
  ?>
 </div>
 <div>
  <h3>Enable Site Monitor
  <label style="margin-bottom:-2px;" class="switch">
    <input id="testcheck" type="checkbox" <?php echo $checked; ?>>
    <span class="slider round"></span>
  </label></h3>
 </div>
 <div id="codes" class="panel panel-default" hidden>
  <div class="panel-heading">Response Codes</div>
  <div class="panel-body">
    <p>Below is a list and short description of site response codes. If any of these codes are found when requesting your web sites headers, we will mail you to notify you. If you want to disble the mails for a specific code, just tick the checkbox, and we will not mail you for that code</p>
  </div>

  <!-- Table -->
  <table class="table">
    <tr>
     <th>Code</th>
     <th>Reason</th>
     <th>Bypassed</th>
    </tr>
  <?
   foreach ($responsecodes as $row){
     print_r('<tr><td>'.$row[0].'</td><td>'.$row[1].'</td><td><input type="checkbox" class="codes" name="'.$row[0].'" id="'.$row[0].'"></td></tr>');
   }
  ?> 
  </table>
