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
<title>New Dojo</title>
</head>
<body>
	<div style="width: 800px; margin: auto">
		<h1>New Dojo</h1>
		<a href="/ninja/new" style="display: flex; justify-content: flex-end">New Ninja</a>
		<form:form action="/dojo/create" class="form-control" method="post" modelAttribute="dojo">
			<div class="row mb-3">
				<form:label path="name" class="col-sm-2 col-form-label">Name:</form:label>
				<form:errors path="name"/>
				<form:input path="name" class="col-sm-10"/>
			</div>
			<button type="submit" class="btn btn-primary">Submit</button>
		</form:form>
		<h2>All Dojos</h2>
		<table>
			<thead>
				<tr>
					<th>Name</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="oneDojo" items="${dojos}">
					<tr>
						<td><a href="/dojo/${oneDojo.id}/show">${oneDojo.name}</a></td>										
					</tr>
				</c:forEach>
			</tbody>			
		</table>
	</div>
</body>
</html>