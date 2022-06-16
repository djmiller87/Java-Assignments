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
<title>Home</title>
</head>
<body class="text-secondary bg-dark">
	<div class="container bd-highlight">
		<div>
			<h1>Home Page</h1>
		</div>
		<div>
			<a href="/product/new">New Product</a>
			<a href="/category/new">New Category</a>
		</div>
		<div>
			<div>
				<table>
					<thead>
						<tr>
							<th>Products</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="product" items="${products}">
							<tr>
								<td><a href="/product/${product.id}">${product.name}</a></td>
							</tr>							
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div>
				<table>
					<thead>
						<tr>
							<th>Categories</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="category" items="${categories}">
							<tr>
								<td><a href="/category/${category.id}">${category.name}</a></td>
							</tr>							
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>