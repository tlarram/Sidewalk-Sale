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
		<a href="/soldbyme"><button>MY LISTINGS</button></a>
	</div>
	
	<div class="container">
    	<div class="description">
			<c:choose>
				<c:when test="${userLocation == null}">
					<div>
						<p><strong>Sidewalk Sale</strong> requires location to show you items listed in your area.
						Please click Accept to continue. Thank you</p>
						<div class="accept">
							<form id="ipForm" action="/location" method="POST">
				        		<input type="hidden" name = "ipAddress" id = "ip"/>
				        		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				        		<button type="submit" class="yellowButton">Accept</button>
				    		</form>
			    		</div>
					</div>
					<form id="logoutForm" method="POST" action="/logout">
					       <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					       <button type="submit">Logout</button>
					</form>
				</c:when>
				<c:otherwise>
					<h2> These items are listed in <c:out value="${userLocation}"/></h2>
					<form id="logoutForm" method="POST" action="/logout">
					       <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					       <button type="submit">Logout</button>
					</form>
				</c:otherwise>
			</c:choose>    	
	 </div>
		
		<div class="items">
			<c:forEach var="products" items="${productList }">
	   		<c:if test="${products.location == userLocation }">
				<div class="itemCard">
					<a href="/sidewalk-sale/details/${products.id }"><img src="${products.photosImagePath }"></a>
					<h3> <c:out value="${products.name }"/></h3>
					<p>PRICE: <c:out value="${products.price }"/></p>
					<p>DESCRIPTION: <c:out value="${products.description }"/></p>
					
					
						<form action="/saved/${products.id }" method="post" id="saveForm">
						<input type="hidden" name="_method" value="put">
						<input type="hidden" name="savedProducts" value="products">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
						<c:choose>
						<c:when test="${!products.savedBy.contains(currentUser)}"> 
							<button type="submit" class="yellowButton" id="saveBtn">SAVE</button>
						</c:when>
						<c:otherwise>
							<p style="color:grey"> You saved this item </p>
							
						</c:otherwise>
						</c:choose>
							</form>
				</div>
			</c:if>
			</c:forEach>
		</div>
		<div class="description">
			<h2> These items are listed outside of your city</h2>
		</div>
		<div class="items">
			<c:forEach var="products" items="${productList }">
	   		<c:if test="${products.location != userLocation }">
				<div class="itemCard">
					<a href="/sidewalk-sale/details/${products.id }"><img src="${products.photosImagePath }"></a>
					<h3> <c:out value="${products.name }"/></h3>
					<p>LOCATION: <c:out value="${products.location }"/></p>
					<p>PRICE: $<c:out value="${products.price }"/></p>
					<p>DESCRIPTION: <c:out value="${products.description }"/></p>
						<form action="/saved/${products.id }" method="post" id="saveForm">
						<input type="hidden" name="_method" value="put">
						<input type="hidden" name="savedProducts" value="products">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
						<c:choose>
						<c:when test="${!products.savedBy.contains(currentUser)}"> 
							<button type="submit" class="yellowButton" id="saveBtn">SAVE</button>
							
						</c:when>
						<c:otherwise>
							<p style="color:grey"> You saved this item </p>
							
						</c:otherwise>
						</c:choose>
							</form>
				</div>
			</c:if>
			</c:forEach>
		</div>
    </div>
    
    
    <script src ="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js">
	</script>
  
<script type="text/javascript">
    $(document).ready (function () {
        $.get( "https://api.ipify.org?format=json", 
          function( data ) {
             console.log(data);
             $("#ip").val(data.ip) ;
        });
    });
</script>
    
</body>
</html>