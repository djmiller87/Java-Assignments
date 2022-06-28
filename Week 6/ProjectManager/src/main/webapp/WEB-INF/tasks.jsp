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
<title>Project Tasks</title>
</head>
<body class="text-secondary bg-dark">
	<div class="container bd-highlight">
		<h1 class="text-info">Project: ${project.title}</h1>
		<div class="d-flex">
			<h3>Project Lead: ${project.lead.firstName} ${project.lead.lastName}</h3>
			<a href="/dashboard" class="d-flex justify-content-end btn btn-secondary">Back to Dashboard</a>
		</div>
		<h3>Description: ${project.description}</h3>
		<div class="row mb-3">
			<form:form action="/task/${project.id}/new" method="post" modelAttribute="projectTask">
				<form:label path="task" class="form-label"> Add a task ticket for this team:</form:label>
				<form:errors path="task" class="text-danger m-1"></form:errors>
				<form:textarea path="task" class="form-control"/>
				<button type="submit" class="btn btn-primary">Submit</button>
			</form:form>
		</div>
		<c:forEach var="task" items="${tasks}">
			<div>
				<h3>Added by ${task.user.firstName} at <fmt:formatDate value="${task.createdAt}" pattern="h:mm a MMMM dd"/>:</h3>
				<p>${task.task}</p>
			</div>
		</c:forEach>	
	</div>
</body>
</html>