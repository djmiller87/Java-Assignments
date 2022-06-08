<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<meta charset="ISO-8859-1">
<title>New Ninja</title>
</head>
<body>
	<div style="width: 800px; margin: auto">
		<h1>New Ninja</h1>
		<a href="/" style="display: flex; justify-content: flex-end">Dashboard</a>
		<form:form action="/ninja/create" class="form-control" method="post" modelAttribute="ninja">
			<div class="row mb-3">
				<form:label path="dojo" class="col-sm-2 col-form-label">Dojo:</form:label>
				<form:errors path="dojo"/>
				<form:select path="dojo" class="col-sm-10">
					<c:forEach var="oneDojo" items="${dojos}">
						<option value="${oneDojo.id}">${oneDojo.name}</option>
					</c:forEach>
				</form:select>
			</div>
			<div class="row mb-3">
				<form:label path="firstName" class="col-sm-2 col-form-label">First Name:</form:label>
				<form:errors path="firstName"/>
				<form:input path="firstName" class="col-sm-10"/>
			</div>
			<div class="row mb-3">
				<form:label path="lastName" class="col-sm-2 col-form-label">Lase Name:</form:label>
				<form:errors path="lastName"/>
				<form:input path="lastName" class="col-sm-10"/>
			</div>
			<div class="row mb-3">
				<form:label path="age" class="col-sm-2 col-form-label">Age:</form:label>
				<form:errors path="age"/>
				<form:input path="age" class="col-sm-10"/>
			</div>
			<button type="submit" class="btn btn-primary">Submit</button>
		</form:form>
	</div>
</body>
</html>