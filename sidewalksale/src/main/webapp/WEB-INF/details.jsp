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
		<a href="/#"><button>ADD LISTING</button></a>
		<h2 style="font-size: 35px">Sidewalk.<span class="dandelion"><em>Sale</em></span></h2>
		<a href="/#"><button>SAVED LISTINGS</button></a>
		<a href="/login"><button>ACCOUNT</button></a>
	</div>
	<div class="container">
		<div class="body">
			<div class="detailCard">
				<img class="detailImg" alt="couch" src="<c:url value="/image/couch.jpeg"/>">
				<div class="detailBody">
					<p>Couch</p>
					<p>Price: $300</p>
					<p>Condition: </p>
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod 
					tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, 
					quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo 
					consequat.</p>
				</div>
			</div>
			<div class="sellerCard">
				<p>Sold By: </p>
				<p>Location</p>
				<p>Seller Rating</p>
				<p><a href="/sidewalk-sale/contact">Contact this seller</a></p>
			</div>
		</div>
	</div>
</body>
</html>