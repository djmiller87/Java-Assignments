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
<title>Dashboard</title>
</head>
<body class="text-secondary bg-dark">
	<div class="container bd-highlight">
		<div class="d-flex justify-content-between bd-highlight mb-2 m-5">
			<div class="m-5">
				<h3>Hello, ${loggedInUser.name}. Welcome to...</h3>
				<h1>The Book Broker!</h1>								
			</div>
			<div>
				<a href="/logout" class="d-flex">Logout</a>
				<a href="/book/new" class="d-block">+ Add a book to my shelf!</a>
			</div>
		</div>
		<div class="m-5">
			<h3>Available books to borrow:</h3>
			<table class="table text-secondary">
				<thead  class="table text-secondary">
					<tr>
						<th>ID</th>
						<th>Title</th>
						<th>Author Name</th>
						<th>Posted By</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="book" items="${books}">
						<c:if test="${book.borrower != null && book.user.id == loggedInUser.id}">
							<tr>
								<td>${book.id}</td>
								<td><a href="/book/${book.id}/show">${book.title}</a></td>
								<td>${book.author}</td>
								<td>${book.user.name}</td>
								<td>
									<c:choose>
										<c:when test="${loggedInUser.id == book.user.id}">
											<a href="/book/${book.id}/edit">edit |</a>										
											<a href="/book/${book.id}/delete"> | delete</a>
										</c:when>
										<c:otherwise>
											<a href="/book/${book.id}/borrow">borrow</a>
										</c:otherwise>									
									</c:choose>
								</td>
							</tr>
						</c:if>
					</c:forEach>
					<c:forEach var="book" items="${books}">
						<c:if test="${book.borrower == null && book.borrower.id != loggedInUser.id}">
							<tr>
								<td>${book.id}</td>
								<td><a href="/book/${book.id}/show">${book.title}</a></td>
								<td>${book.author}</td>
								<td>${book.user.name}</td>
								<td>
									<c:choose>
										<c:when test="${loggedInUser.id == book.user.id}">
											<a href="/book/${book.id}/edit">edit |</a>										
											<a href="/book/${book.id}/delete"> | delete</a>
										</c:when>
										<c:otherwise>
											<a href="/book/${book.id}/borrow">borrow</a>
										</c:otherwise>									
									</c:choose>
								</td>
							</tr>
						</c:if>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="m-5">
			<h3>Books I'm borrowing:</h3>
			<table class="table text-secondary">
				<thead  class="table text-secondary">
					<tr>
						<th>ID</th>
						<th>Title</th>
						<th>Author Name</th>
						<th>Posted By</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="book" items="${books}">
						<c:if test="${book.borrower.id == loggedInUser.id}">
							<tr>
								<td>${book.id}</td>
								<td><a href="/book/${book.id}/show">${book.title}</a></td>
								<td>${book.author}</td>
								<td>${book.user.name}</td>
								<td><a href="/book/${book.id}/return">return</a></td>
							</tr>
						</c:if>
					</c:forEach>				
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>