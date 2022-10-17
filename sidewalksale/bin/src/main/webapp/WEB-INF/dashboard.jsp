<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home page</title>
<link rel="stylesheet" type="text/css" href="/css/dashboard.css">
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
    	<div class="description">
	    	<p>Welcome to <strong>Sidewalk Sale</strong>. I'd like this area to welcome the user by their first name if logged in 
	    	and display a logout button if they're logged in. otherwise, show: The items you are seeing are available in your area</p>
	    		<a href="/logout">LOG OUT</a>
	    </div>
		<div class="items">
			<div class="itemCard">
				<a href="/sidewalk-sale/details">
					<img alt="couch" src="<c:url value="image/couch.jpeg"/>">
				</a>
				<p>Couch</p>
				<p>$300</p>
				<button class="yellowButton">Save</button>
			</div>
			<div class="itemCard">
				<img alt="lamp" src="<c:url value="image/lamp.jpeg"/>">
				<p>Lamp</p>
				<p>$50</p>
				<button class="yellowButton">Save</button>
			</div>
			<div class="itemCard">
				<img alt="chair" src="<c:url value="image/chair.jpeg"/>">
				<p>Chair</p>
				<p>$500</p>
				<button class="yellowButton">Save</button>
			</div>
			<div class="itemCard">
				<img alt="lamp" src="<c:url value="image/lamp.jpeg"/>">
				<p>Lamp</p>
				<p>$50</p>
				<button class="yellowButton">Save</button>
			</div>
			<div class="itemCard">
				<img alt="couch" src="<c:url value="image/couch.jpeg"/>">
				<p>Couch</p>
				<p>$300</p>
				<button class="yellowButton">Save</button>
			</div>
			<div class="itemCard">
				<img alt="chair" src="<c:url value="image/chair.jpeg"/>">
				<p>Chair</p>
				<p>$500</p>
				<button class="yellowButton">Save</button>
			</div>
		</div>
		
    </div>
</body>
</html>