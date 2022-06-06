<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Show Expense</title>
</head>
<body>
<h1>Expense Details</h1>
<a href="/expenses">Go back</a>
<p>Expense Name: ${expense.expenseName}</p>
<p>Expense Description: ${expense.description}</p>
<p>Vendor: ${expense.vendor}</p>
<p>Amount Spent: ${expense.amount} </p>	            
</body>
</html>