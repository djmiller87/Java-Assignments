<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<meta charset="ISO-8859-1">
<title>Current Visit Count</title>
</head>
<body style="width: 800px; margin: auto;">
	<p>You have visited <a href="/your_server">http://your_server</a> <c:out value="${theCount}"></c:out> times.</p>
	<p><a href="/your_server">Test another visit?</a> or <a href="/your_server/add_two"> Test visit, add two?</a></p>
	<p><a href="/clear_session">Reset Count</a></p>
	
</body>
</html>