<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Welcome Page</title>
<link rel="stylesheet" type="text/css" href="/css/dashboard.css">
</head>
<body>
    <div class="header">
		<a href="/sidewalk-sale"><button>ON SALE NOW</button></a>
		<a href="/sidewalk-sale/add-item"><button>ADD LISTING</button></a>
		<h2 style="font-size: 35px">Sidewalk.<span class="dandelion"><em>Sale</em></span></h2>
		<a href="/sidewalk-sale/saved-listings"><button>SAVED LISTINGS</button></a>
		<a href="/login"><button>ACCOUNT</button></a>
	</div>
	
	<div class="container">
    	<div class="description">
	    	<h3>Welcome, <c:out value="${currentUser.firstName}"></c:out></h3>

	    	  
	    </div>
	<div class="items">
	  <c:forEach var="product" items="${savedProducts}"> 
	  <c:forEach var="savedBy" items="${product.savedBy}">
	     <c:if test = "${currentUser.id == savedBy.id  }">
	     
		
			<div class="itemCard">
				<a href="/sidewalk-sale/details/${product.id }">
					<img alt="${product.name }" src="<c:url value="${product.photos}"/>">
				</a>
				<p><c:out value="${product.name }"></c:out></p>
				<p><c:out value="${product.price }"></c:out></p>
				<button class="yellowButton">Save</button>
			</div>
			
		
		</c:if>
		</c:forEach>
		</c:forEach>
		 </div>
    </div>
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