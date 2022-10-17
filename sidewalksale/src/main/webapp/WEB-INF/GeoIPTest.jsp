<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>
<head>
<meta charset="ISO-8859-1">
<title>GeoIp Tester</title>
</head>
<body>
<form id="ipForm" action="GeoIPTest" method="POST">
        <input type="text" name = "ipAddress" id = "ip"/>
        <input type="submit" name="submit" value="submit" /> 
    </form>
        
<script src
   ="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js">
</script>
  
<script type="text/javascript">
    $(document).ready (function () {
        $.getJSON( "https://api.ipify.org?format=json", 
          function( data ) {
             console.log(data);
             $("#ip").val(data.ip) ;
        });
    });
</script>
</body>
</html>