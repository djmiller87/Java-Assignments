<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<head>
<meta charset="ISO-8859-1">
<title>Show Book</title>
</head>
<body class="text-secondary bg-dark">
	<div  class="container bd-highlight">
		<div class="d-flex justify-content-between bd-highlight mb-2 m-5">
			<div class="m-5">
				<h1 class="text-decoration-underline text-primary">${book.title}</h1>
				<c:choose>
					<c:when test="${loggedInUser.id == book.user.id}">	
						<h3>You read ${book.title} by ${book.author}</h3>		
					</c:when>
					<c:otherwise>
						<h3 class="my-4">${book.user.name} read ${book.title} by ${book.author}</h3>
					</c:otherwise>
				</c:choose>					
			</div>
			<div>
				<a href="/dashboard">back to the shelves</a>
			</div>
		</div>
		<div>
			<c:choose>
					<c:when test="${loggedInUser.id == book.user.id}">	
						<h5>Here are your thoughts:</h5>			
					</c:when>
					<c:otherwise>
						<h5>Here are ${book.user.name}'s thoughts:</h5>						
					</c:otherwise>
				</c:choose>	
		</div>
		<div class="m-5">
			<p>${book.thoughts}</p>
		</div>
		<div>
			<c:if test="${loggedInUser.id == book.user.id}">			
				<a href="/book/${book.id}/edit">Edit</a>
			</c:if>
		</div>
	</div>
</body>
</html>