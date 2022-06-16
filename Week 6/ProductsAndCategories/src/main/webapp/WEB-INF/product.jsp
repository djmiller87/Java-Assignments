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
<title>Category Page</title>
</head>
<body class="text-secondary bg-dark">
	<div class="container bd-highlight">
		<div>
			<h1>${product.name}</h1>
		</div>
		<div>
			<a href="/">Home</a>
		</div>
		<div>
			<h3>Categories:</h3>
			<c:forEach var="category" items="${product.categories}">
				<p>${category.name}</p>		
			</c:forEach>
		</div>
		<div>				
			<form action="/product/${product.id}" method="POST">
				<div class="row mb-3">
					<label class="form-label">Add Category to Product:</label>
					<div class="col-sm-10">
						<select name="categoryId" id="categoryId" class="input" class="form-control">
							<c:forEach var="category" items="${unassignedCategories}">
								<option value="${category.id}">${category.name}</option>
							</c:forEach>
						</select>							
					</div>
				</div>
				<button type="submit" class="btn btn-primary">Submit</button>
			</form>
		</div>
	</div>
</body>
</html>