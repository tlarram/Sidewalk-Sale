<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Registration Page</title>
<link rel="stylesheet" type="text/css" href="/css/dashboard.css">
<link rel="stylesheet" type="text/css" href="/css/register.css">
</head>
<body>
    <div class="header">
		<a href="/sidewalk-sale"><button>ON SALE NOW</button></a>
		<a href="/#"><button>ADD LISTING</button></a>
		<h2 style="font-size: 35px">Sidewalk.<span class="dandelion"><em>Sale</em></span></h2>
		<a href="/#"><button>SAVED LISTINGS</button></a>
		<a href="/soldbyme"><button>MY LISTINGS</button></a>
	</div>
	<div class="container">
		<div class="login">
		    <h1>Register</h1>
		    <p><form:errors path="user.*"/></p>
		    <form:form method="POST" action="/registration" modelAttribute="user">
		     	<p>
		            <form:input path="firstName" placeholder="FIRST NAME"/>
		        </p>
		        <p>
		            <form:input path="lastName" placeholder="LAST NAME"/>
		        </p>
		        <p>
		            <form:input path="email" placeholder="EMAIL"/>
		        </p>
		        <p>
		            <form:password path="password" placeholder="PASSWORD"/>
		        </p>
		        <p>
		            <form:password path="passwordConfirmation" placeholder="CONFRIM PASSWORD"/>
		        </p>
		        <!-- <input type="submit" value="Register!"/> -->
		        <button type="submit" class="createButton">CREATE ACCOUNT</button>
	    	</form:form>
	    	<p>Already have an account?</p>
				<a href="/login"><button class="yellowButton">SIGN IN</button></a>
	    </div>
    </div>
</body>
</html>