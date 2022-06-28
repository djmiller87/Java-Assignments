<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<meta charset="ISO-8859-1">
<title>Project Details</title>
</head>
<body class="text-secondary bg-dark">
	<div class="container bd-highlight">
	<h1 class="text-info">Project Details</h1>
	<h3>Project: ${project.title}</h3>
	<h3>Description: ${project.description}</h3>
	<h3>Due Date: <fmt:formatDate type = "date" value = "${project.date}" /></h3>
	<form action="/project/${project.id}/delete" method="post">
	    <input type="hidden" name="_method" value="delete">
	    <input type="submit" value="Delete" class="btn btn-danger mt-3">
	</form>
	<a href="/dashboard"><button class="btn btn-secondary mt-3">Back to Dashboard</button></a>
	<a href="/project/${project.id}/tasks"><button class="btn btn-secondary mt-3">See tasks!</button></a>
	</div>
</body>
</html>