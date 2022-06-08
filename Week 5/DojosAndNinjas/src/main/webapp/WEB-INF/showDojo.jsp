<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<meta charset="ISO-8859-1">
<title>${dojo.name}</title>
</head>
<body>
<div style="width: 800px; margin: auto">
	<h1>${dojo.name} Ninja's</h1>
	<a href="/ninja/new" style="display: flex; justify-content: flex-end">New Ninja</a>
	<a href="/" style="display: flex; justify-content: flex-end">Dashboard</a>
	<table class="table">
			<thead>
				<tr>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Age</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="ninja" items="${dojo.ninjas}">
					<tr>
						<td>${ninja.firstName}</td>
						<td>${ninja.lastName}</td>
						<td>${ninja.age}</td>									
					</tr>
				</c:forEach>
			</tbody>			
		</table>
</div>
</body>
</html>