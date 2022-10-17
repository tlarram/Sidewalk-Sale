<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>Contact The seller</h2>
 	<p><c:out value="${msg }"/></p>
 	<form:form method="POST" modelAttribute="contact" action="/sidewalk-sale/contact" >
 		<table>
 			<tr>
 				<td>Name</td>
 				<td>
 					<form:input path="name" placeholder="FULL NAME" />
 					<form:errors path="name"/>
 				</td>
 			</tr>
 			<tr>
 				<td>Email</td>
 				<td>
 					<form:input path="email" placeholder="EMAIL"/>
 				</td>
 			</tr>
 			<tr>
 				<td>Subject</td>
 				<td>
 					<form:input path="subject" placeholder="SUBJECT"/>
 				</td>
 			</tr>
 			<tr>
 				<td>Message</td>
 				<td>
 					<form:textarea path="content" rows="5" cols="20"/>
 				</td>
 			</tr>
 			
 		</table>
 		<button type="submit" >Send</button>
 	</form:form>
</body>
</html>