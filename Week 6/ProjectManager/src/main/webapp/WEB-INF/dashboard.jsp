<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<meta charset="ISO-8859-1">
<title>Project Manager Dashboard</title>
</head>
<body class="text-secondary bg-dark">
	<div class="container bd-highlight">
		<div>
			<h1>Welcome ${loggedInUser.firstName}</h1>
		</div>
		<div>
			<h4>All Projects:</h4>
			<table class="table text-secondary">
				<thead>
					<tr>
						<th>Project</th>
						<th>Team Lead</th>
						<th>Due Date</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="project" items="${unassignedProjects}">
						<c:if test="${project.lead.id != user.id }">
							<tr>
								<td><a href="/project/${project.id}/show">${project.title}</a></td>
								<td>${project.lead.firstName}</td>
								<td><fmt:formatDate type="date" value="${project.date}" /></td>
								<td>
									<a href="/join/${project.id}/team"><button class="btn btn-primary">Join Team</button></a>
								</td>
							</tr>
						</c:if>																										
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div>
			<h4>Your Projects;</h4>
			<a href="/projects/new"><button class="btn btn-secondary mt-3">+
					new project</button></a>
			<table class="table text-secondary">
				<thead>
					<tr>
						<th>Project</th>
						<th>Team Lead</th>
						<th>Due Date</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="project" items="${assignedProjects}">
						<tr>
							<td><a href="/project/${project.id}/show">${project.title}</a></td>
							<td>${project.lead.firstName}</td>
							<td><fmt:formatDate type="date" value="${project.date}" />
							</td>
							<c:if test="${project.lead.id == user.id}">
								<td>
									<a href="/project/${project.id}/edit"><button	class="btn btn-secondary">Edit</button></a>
								</td>
							</c:if>
							<c:if test="${project.lead.id != user.id}">
								<td>
									<a href="/leave/${project.id}/team"><button class="btn btn-danger">Leave Team</button></a>
								</td>
							</c:if>
						</tr>
					</c:forEach>					
				</tbody>
			</table>
			<a href="/logout">Logout</a>
		</div>
	</div>
</body>
</html>