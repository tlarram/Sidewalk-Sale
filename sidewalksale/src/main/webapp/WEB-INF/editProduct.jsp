<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Item</title>
<link rel="stylesheet" type="text/css" href="/css/dashboard.css">
<link rel="stylesheet" type="text/css" href="/css/register.css">
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
	    	<h3>Edit your Item</h3>
	   		<form id="logoutForm" method="POST" action="/logout">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				<button type="submit">Logout</button>
			</form>
	    </div>
	    
	    <form:form method="POST" modelAttribute="product" action="/product/edit/${product.id }"  >
 				<input type="hidden" name="_method" value="put">
 				<div>
 					<form:label path="name">NAME</form:label>
 					<div>
 					<form:input path="name"/>
 					<form:errors path="name" style="color:DarkRed"/>
 					</div>
 				</div>
 				<div>
 					<form:label path="price">PRICE</form:label>
 					<div>
 					<form:input path="price"/>
 					<form:errors path="price" style="color:DarkRed"/>
 					</div>
 				</div>
 				<div>
 					<form:label path="description">DESCRIPTION</form:label>
 					<div>
 					<form:textarea path="description"/>
 					<form:errors path="description" style="color:DarkRed"/>
 					</div>
 				</div>
 				<!-- this line must exist as to not delete the user who created the book -->
 				<form:hidden path="seller"/>
 				<button type="submit" class="yellowButton">Submit</button>
 			</form:form>
	</div>
</body>
</html>