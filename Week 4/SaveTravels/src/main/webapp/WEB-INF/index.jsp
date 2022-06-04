<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Expenses</title>
</head>
<body>
	<h1>Save Travels</h1>	
	<table>
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
		    		<td>${oneExpense.expenseName}</td>
				    <td>${oneExpense.vendor}</td>
					<td>${oneExpense.amount}</td>
					<td><a href="/expense/${oneExpense.id}/edit">Edit</a></td>					
				</tr>
	    	</c:forEach>
	    </tbody>
	</table>
	<h2>Add an Expense</h2>
	<form:form action="/expense/new" method="post" modelAttribute="expense">
		<p>
			<form:label path="expenseName">Expense Name:</form:label>
			<form:errors path="expenseName"/>
			<form:input path="expenseName"/>
		</p>
		<p>
			<form:label path="vendor">Vendor:</form:label>
			<form:errors path="vendor"/>
			<form:input path="vendor"/>
		</p>
		<p>
			<form:label path="amount">Amount:</form:label>
			<form:errors path="amount"/>
			<form:input type="number" step="any" path="amount"/>
		</p>
		<p>
			<form:label path="description">Description:</form:label>
			<form:errors path="description"/>
			<form:textarea rows="6" cols="60" path="description"/>
		</p>
		<input type="submit" value="Submit">
		
	</form:form>
</body>
</html>