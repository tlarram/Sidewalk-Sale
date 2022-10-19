<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login Page</title>
<link rel="stylesheet" type="text/css" href="/css/dashboard.css">
<link rel="stylesheet" type="text/css" href="/css/register.css">
</head>
<body>
	 <div class="header">
		<a href="/sidewalk-sale"><button>ON SALE NOW</button></a>
		<a href="/sidewalk-sale/add-item"><button>ADD LISTING</button></a>
		<h2 style="font-size: 35px">Sidewalk.<span class="dandelion"><em>Sale</em></span></h2>
		<a href="//sidewalk-sale/saved-listings"><button>SAVED LISTINGS</button></a>
		<a href="/soldbyme"><button>MY LISTINGS</button></a>
	</div>
    <c:if test="${logoutMessage != null}">
        <c:out value="${logoutMessage}"></c:out>
    </c:if>
    <c:if test="${errorMessage != null}">
        <c:out value="${errorMessage}"></c:out>
    </c:if>
    <div class="container">
    	<div class="login">
    		<h1>Login</h1>
		    <form method="POST" action="/login">
		        <p>
		            <input type="text" id="email" name="email" placeholder="EMAIL"/>
		        </p>
		        <p>
		            <input type="password" id="password" name="password" placeholder="PASSWORD" />
		        </p>
		        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		        <!-- <input type="submit" class="yellowButton" value="Login!"/> -->
		        <button type="submit" class="yellowButton">LogIn</button>
		    </form>
		    <p>Don't have an account?</p>
			<a href="/registration"><button class="createButton">Create an Account</button></a>
		    </div>
	  </div>
</body>
</html>