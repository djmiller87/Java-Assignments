<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<meta charset="ISO-8859-1">
<title>Edit ${language.name}</title>
</head>
<body>
	<div style="width: 800px; margin: auto">
		<a href="/language/${language.id}/delete">Delete</a>
		<a href="/languages">Dashboard</a>
		<form:form action="/language/${language.id}/edit" class="form-control" method="post" modelAttribute="language">
			<input type="hidden" name="_method" value="put">
			<div class="row mb-3">
				<form:label path="name" class="col-sm-2 col-form-label">Name:</form:label>
				<form:errors path="name"/>
				<form:input path="name" class="col-sm-10"/>
			</div>
			<div class="row mb-3">
				<form:label path="creator" class="col-sm-2 col-form-label">Creator:</form:label>
				<form:errors path="creator"/>
				<form:input path="creator" class="col-sm-10"/>
			</div>
			<div class="row mb-3">
				<form:label path="version" class="col-sm-2 col-form-label">Version:</form:label>
				<form:errors path="version"/>
				<form:input path="version" class="col-sm-10"/>
			</div>
			<div class="row mb-3">
				<button type="submit" class="btn btn-primary">Submit</button>
			</div>
		</form:form>
	</div>
</body>
</html>