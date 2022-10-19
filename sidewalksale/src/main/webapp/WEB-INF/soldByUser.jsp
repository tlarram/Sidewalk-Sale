<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Items Sold by the User</title>
<link rel="stylesheet" type="text/css" href="/css/dashboard.css">
</head>
<body>
<div class="header">
		<a href="/sidewalk-sale"><button>ON SALE NOW</button></a>
		<a href="/sidewalk-sale/add-item"><button>ADD LISTING</button></a>
		<h2 style="font-size: 35px">Sidewalk.<span class="dandelion"><em>Sale</em></span></h2>
		<a href="/#"><button>SAVED LISTINGS</button></a>
		<a href="/login"><button>ACCOUNT</button></a>
	</div>
	<c:forEach var="oneProduct" items="${products }">
		<c:choose>
			<c:when test="${oneProduct.seller.id == currentUser.id }">
			<div class="items">
			<div class="itemCard">
				<a href="/sidewalk-sale/details/${oneProduct.id }">
					<img alt="${oneProduct.name }" src="<c:url value="${oneProduct.photos}"/>">
				</a>
				<p> <c:out value="${oneProduct.name}"/> </p>
				<p><c:out value="${oneProduct.price}"/></p>
				<button class="yellowButton">Delete Listing</button> //Add a delete Product route
			</div>
			</div>
			</c:when>
		</c:choose>
	</c:forEach>
</body>
</html>