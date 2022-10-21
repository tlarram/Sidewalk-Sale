<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Details page page</title>
<link rel="stylesheet" type="text/css" href="/css/dashboard.css">
<link rel="stylesheet" type="text/css" href="/css/details.css">
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
		<div class="body">
			<div class="detailCard">
				<img class="detailImg" alt="couch" src="<c:url value="${product.photosImagePath }"/>">
				<div class="detailBody">
					<h3> <c:out value="${product.name }"/></h3>
					<p>PRICE: <c:out value="${product.price }"/></p>
					<p><c:out value="${product.description }"/></p>
				</div>
			</div>
			<div class="sellerCard">
				<p>Sold By: <c:out value="${product.seller.firstName }"/> <c:out value="${product.seller.lastName }"/> </p>
				<p>Location: <c:out value="${prducts.seller.location }"/></p> <!-- ADD THE LOCATION HERE PLEASE -->
				<h2>Contact The seller</h2>
 	
 	<form:form method="POST" modelAttribute="contact" action="/sidewalk-sale/contact" >
 		<table>
 			<tr>
 				<td>
 					<form:input path="name" placeholder="FULL NAME"/>
 					<form:errors path="name"/>
 				</td>
 			</tr>
 			<tr>
 				<td>
 					<form:input path="email" placeholder="EMAIL"/>
 				</td>
 			</tr>
 			<tr>
 				<td>
 					<form:input path="subject" placeholder="SUBJECT"/>
 				</td>
 			</tr>
 			<tr>
 				<td>
 					<form:textarea path="content" rows="5" cols="29" placeholder="MESSAGE"/>
 				</td>
 			</tr>
 			
 		</table>
 		<button type="submit" class="yellowButton">Send</button>
 	</form:form>
 	<p><c:out value="${msg }"/></p>
			</div>
		</div>
	</div>
</body>
</html>