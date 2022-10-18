<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Welcome Page</title>
</head>
<body>

    <h1>Welcome Page <c:out value="${currentUser.username}"></c:out></h1>
	<c:choose>
	<c:when test="${userLocation == null}">
		<div>
			<h3>Sidewalk Sale requires location to show you items listed in your area.
			Please click Accept to continue. Thank you</h3>
			<form id="ipForm" action="/location" method="POST">
        		<input type="hidden" name = "ipAddress" id = "ip"/>
        		<input type="submit" name="submit" value="Accept" /> 
    		</form>
		</div>
	</c:when>
	<c:otherwise>
    	<form id="logoutForm" method="POST" action="/logout">
       	 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        	<input type="submit" value="Logout!" />
    	</form>
    </c:otherwise>
	</c:choose>
	
//JQuery to add to  seperate file later. 
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