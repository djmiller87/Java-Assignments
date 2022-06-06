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
<title>Expenses</title>
</head>
<body style="width: 800px; margin: auto;">
	<h1>Save Travels</h1>	
	<table class="table">
	    <thead>
	        <tr>
	            <th>Expense</th>
	            <th>Vendor</th>
	            <th>Amount</th>
	            <th>Actions</th>	            
	        </tr>
	    </thead>
	    <tbody>         
	    	<c:forEach var="oneExpense" items="${expenses}">	        		
		    	<tr>
		    		<td><a href="/expense/${oneExpense.id}/show">${oneExpense.expenseName}</a></td>
				    <td>${oneExpense.vendor}</td>
					<td>${oneExpense.amount}</td>
					<td style="display:flex; align-items: center;">
					<a href="/expense/${oneExpense.id}/edit">Edit</a>
					<form action="/expense/${oneExpense.id}" method="post">
					    <input type="hidden" name="_method" value="delete">
					    <input type="submit" value="Delete">
					</form>
					</td>					
				</tr>
	    	</c:forEach>
	    </tbody>
	</table>
	<h2>Add an Expense</h2>
	<form:form action="/expense/new" method="post" modelAttribute="expense">
		<p  class="row mb-3">
			<form:label path="expenseName" class="col-sm-2 col-form-label">Expense Name:</form:label>
			<form:errors path="expenseName"/>
			<form:input path="expenseName" class="form-control"/>
		</p>
		<p  class="row mb-3">
			<form:label path="vendor" class="col-sm-2 col-form-label">Vendor:</form:label>
			<form:errors path="vendor"/>
			<form:input path="vendor" class="form-control"/>
		</p>
		<p  class="row mb-3">
			<form:label path="amount" class="col-sm-2 col-form-label">Amount:</form:label>
			<form:errors path="amount"/>
			<form:input type="number" step="any" path="amount" class="form-control"/>
		</p>
		<p  class="row mb-3">
			<form:label path="description" class="col-sm-2 col-form-label">Description:</form:label>
			<form:errors path="description"/>
			<form:textarea rows="6" cols="60" path="description" class="form-control"/>
		</p>
		<button type="submit" class="btn btn-primary">Submit"</button>
		
	</form:form>
</body>
</html>