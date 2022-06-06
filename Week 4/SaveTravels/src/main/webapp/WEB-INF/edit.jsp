<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@ page isErrorPage="true" %>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit My Expense</title>
</head>
<body>
<h2>Edit Expense</h2>
<a href="/expenses">Go back</a>
	<form:form action="/expense/${expense.id}" method="post" modelAttribute="expense">
		<input type="hidden" name="_method" value="put">
		<p>
			<form:label path="expenseName">Expense Name:</form:label>
			<form:errors path="expenseName"/>
			<form:input path="expenseName" value="${expense.expenseName}"/>
		</p>
		<p>
			<form:label path="vendor">Vendor:</form:label>
			<form:errors path="vendor"/>
			<form:input path="vendor" value="${expense.vendor}"/>
		</p>
		<p>
			<form:label path="amount">Amount:</form:label>
			<form:errors path="amount"/>
			<form:input type="number" step="any" path="amount" value="${expense.amount}"/>
		</p>
		<p>
			<form:label path="description">Description:</form:label>
			<form:errors path="description"/>
			<form:textarea rows="6" cols="60" path="description" value="${expense.description}"/>
		</p>
		<input type="submit" value="Submit">
		
	</form:form>

</body>
</html>