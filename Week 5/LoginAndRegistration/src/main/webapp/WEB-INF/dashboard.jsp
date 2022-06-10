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
<title>Dashboard</title>
</head>
<body class="text-secondary bg-dark">
	<div class="container bd-highlight">
		<h1>Welcome ${loggedInUser.firstName} ${loggedInUser.lastName}</h1>
		<p>This is your dashboard. Nothing to see here yet.</p>
		<a href="/logout">Logout</a>
	</div>
</body>
</html>