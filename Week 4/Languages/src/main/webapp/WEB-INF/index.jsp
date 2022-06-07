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
<title>Insert title here</title>
</head>
<body>
	<div style="width: 800px; margin: auto">
		<table class="table table-bordered">
			<thead>
				<tr  class="table-primary">
					<th>Name</th>
					<th>Creator</th>
					<th>Version</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="oneLanguage" items="${languages}">
					<tr>
						<td><a href="/language/${oneLanguage.id}/show">${oneLanguage.name}</a></td>
						<td>${oneLanguage.creator}</td>
						<td>${oneLanguage.version}</td>
						<td>
							<a href="/language/${oneLanguage.id}/edit">Edit</a>
							<a href="/language/${oneLanguage.id}/delete">Delete</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>	
		</table>		
		<form:form action="/language/create" class="form-control" method="post" modelAttribute="language">
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