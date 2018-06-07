var xhttp = new XMLHttpRequest(); 
function enable(domain,bypassloc,respcode){
   xhttp.open("POST", "enablecode.php",true);
   xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
   var data = {domainName : domain,bypassLocation : bypassloc, responseCode : respcode};
   xhttp.send(JSON.stringify(data));
}
function disable(domain, bypassloc, respcode){
   xhttp.open("POST", "disablecode.php",true);
   xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
   var data = {domainName : domain,bypassLocation : bypassloc, responseCode : respcode};
   xhttp.send(JSON.stringify(data));
}
function enableahm(domain,bypassloc){
   xhttp.open("POST", "enablemonitor.php",true);
   xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
   var data = {domainName : domain,bypassLocation : bypassloc};
   xhttp.send(JSON.stringify(data));
}
function disableahm(domain,bypassloc){
   xhttp.open("POST", "disablemonitor.php",true);
   xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
   var data = {domainName : domain,bypassLocation : bypassloc};
   xhttp.send(JSON.stringify(data));
}
