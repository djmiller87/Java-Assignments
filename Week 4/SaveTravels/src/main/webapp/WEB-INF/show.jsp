<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<meta charset="ISO-8859-1">
<title>Show Expense</title>
</head>
<body style="width: 600px; margin: auto">
	<div class="d-flex flex-column bd-highlight">
		<h1 class="p-2 bd-highlight">Expense Details</h1>
		<a class="p-2 bd-highlight" href="/expenses">Go back</a>
		<h3 class="p-2 bd-highlight">Expense Name: ${expense.expenseName}</h3>
		<h5 class="p-2 bd-highlight">Expense Description: ${expense.description}</h5>
		<h5 class="p-2 bd-highlight">Vendor: ${expense.vendor}</h5>
		<h5 class="p-2 bd-highlight">Amount Spent: ${expense.amount} </h5>
	</div>	            
</body>
</html>