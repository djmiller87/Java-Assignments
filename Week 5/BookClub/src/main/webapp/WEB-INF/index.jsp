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
<title>Login And Registration</title>
</head>
<body class="text-secondary bg-dark">
	<div class="container">
		<div class="m-3">
			<h1 class="d-flex justify-content-center text-primary">Book Club</h1>
			<h5 class="d-flex justify-content-center text-decoration-underline">A place for friends to share thoughts on books.</h5>
		</div>
		<div  class="d-flex justify-content-evenly bd-highlight m-4">
			<div>
				<h2>Register</h2>
				<form:form action="/register" method="POST" modelAttribute="newUser">
					<div class="row mb-3">
						<form:label path="name" class="form-label">Name:</form:label>
						<form:errors path="name" class="text-danger m-1"></form:errors>
						<div class="col-sm-10">
							<form:input path="name" class="form-control"/>
						</div>
					</div>					
					<div class="row mb-3">
						<form:label path="email"  class="form-label">Email:</form:label>
						<form:errors path="email" class="text-danger m-1"></form:errors>
						<div class="col-sm-10">
							<form:input path="email" class="form-control"/>
						</div>
					</div>
					<div class="row mb-3">
						<form:label path="password" class="form-label">Password:</form:label>
						<form:errors path="password" class="text-danger m-1"></form:errors>
						<div class="col-sm-10">
							<form:input path="password" type="password" class="form-control"/>
						</div>
					</div>
					<div class="row mb-3">
						<form:label path="confirmPassword" class="form-label">Confirm Password:</form:label>
						<form:errors path="confirmPassword" class="text-danger m-1"></form:errors>
						<div class="col-sm-10">
							<form:input path="confirmPassword" type="password" class="form-control"/>
						</div>
					</div>
					<button type="submit" class="btn btn-primary">Register</button>
				</form:form>
			</div>	
			<div>
				<h2>Login</h2>
				<form:form action="/login"  method="POST" modelAttribute="newLogin">
					<div class="row mb-3">
						<form:label path="email" class="form-label">Email:</form:label>
						<form:errors path="email" class="text-danger m-1"></form:errors>
						<div class="col-sm-10">
							<form:input path="email" class="form-control"/>
						</div>
					</div>
					<div class="row mb-4">
						<form:label path="password" class="form-label">Password:</form:label>
						<form:errors path="email" class="text-danger m-1"></form:errors>
						<div class="col-sm-10">
							<form:input type="password" path="password" class="form-control"/>
						</div>
					</div>
					<button type="submit" class="btn btn-primary">Login</button>
				</form:form>
			</div>
		</div>
	</div>

</body>
</html>