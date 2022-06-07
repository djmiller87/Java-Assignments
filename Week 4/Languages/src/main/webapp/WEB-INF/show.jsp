<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<meta charset="ISO-8859-1">
<title>${language.name}</title>
</head>
<body>
	<div style="width: 600px; margin: auto">
		<div>
			<a href="/languages">Dashboard</a>
		</div>
		<div class="card">
			<div class="card-body">
				<h4 class="card-title">Name: ${language.name}</h4>
				<p class="card-text">Creator: ${language.creator}</p>
				<p class="card-text">Version: ${language.version}</p>		
			</div>
			<div class="card-footer text-muted">
				<a href="/language/${language.id}/edit">Edit</a>
				<a href="/language/${language.id}/delete">Delete</a>
			</div>
		</div>
	</div>
</body>
</html>