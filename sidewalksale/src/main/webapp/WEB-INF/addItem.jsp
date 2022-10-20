<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Item</title>
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
		<h2>Add your Item</h2>
		<form:form action="/sidewalk-sale/add-item" method="POST" modelAttribute="newProduct" enctype="multipart/form-data">
			<div>
				<form:input path="name" placeholder="PRODUCT NAME"></form:input>
				<form:errors path="name" style="color:darkRed"/>
			</div>
			<div>
				<form:input type="number" path="price" placeholder="0.00"/>
				<form:errors path="price" style="color:darkRed"/>
			</div>
			<div>
				<form:textarea rows="5" cols="24" path="description" placeholder="DESCRIPTION"/>
				<form:errors path="description" style="color:red"/>
			</div>
			<div>
				<form:label path="photos">Photo: *must be square. .png or .jpeg type</form:label>
			</div>
				<input type="file" name="image"  accept="image/png, image/jpeg"/>
			<div>
				<form:hidden path="seller" value="${userId }"/>
				<form:hidden path="location" value="${userLocation }"/>
				<button type="submit" class="yellowButton">Submit</button>
			</div>
		</form:form>
	</div>

</body>
</html>