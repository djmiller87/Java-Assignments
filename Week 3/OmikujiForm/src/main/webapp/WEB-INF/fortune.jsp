<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/css/fortunestyle.css">
<meta charset="ISO-8859-1">
<title>Omikuji</title>
</head>
<body>
<div id="omikuji">
	<div id="fortune">
		<h1>Here's Your Omikuji!</h1>
		<p>In ${theNumber} years, you will live in ${theCity} with ${thePerson} as your roommate,  		${theHobby} for a living. The next time you see a ${theThing}, you will have good luck. Also, 		${theMessage}.</p>
	</div>
	<a href="/omikuji"> Go Back</a>
</div>
</body>
</html>