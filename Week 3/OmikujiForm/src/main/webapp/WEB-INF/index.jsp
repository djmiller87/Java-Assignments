<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/css/style.css">
<meta charset="ISO-8859-1">
<title>Omikuji</title>
</head>
<body>
<h1>Send an Omikuji!!</h1>
<div id="form">
	<form action="/submit" method="post">
		<label>Pick any number from 5 to 25:</label>
		<input type="number" name="number">
		<label>Enter the name of any city:</label>
		<input type="text" name="city">
		<label>Enter the name of any real person:</label>
		<input type="text" name="person">
		<label>Enter professional endeavor or hobby:</label>
		<input type="text" name="hobby">
		<label>Enter any type of living thing:</label>
		<input type="text" name="thing">
		<label>Say something nice to someone:</label>
		<textarea rows="6" name="message"></textarea>
		<label>Send and show a friend.</label>
		<input type="submit" value="Send">
	</form>
</div>
</body>
</html>