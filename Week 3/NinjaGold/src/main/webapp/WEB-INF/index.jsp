<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/css/style.css">
<meta charset="ISO-8859-1">
<title>Ninja Gold Game</title>
</head>
<body>
<div class="container">
	<div class="mygold">
		<h1>Your Gold: ${gold}</h1>
	</div>
	<div class="tasks">		
		<form class="getgold" action="/calculate/gold" method="post">
			<h3>Farm</h3>
			<label>(earns 10-20 gold)</label>
			<p><button class="b" type="submit" name="farm" value="${farm}">Find Gold!</button></p>
		</form>
		<form class="getgold" action="/calculate/gold" method="post">
			<h3>Cave</h3>
			<label>(earns 5-10 gold)</label>
			<p><button type="submit" name="cave" value="${cave}">Find Gold!</button></p>
		</form>
		<form class="getgold" action="/calculate/gold" method="post">
			<h3>House</h3>
			<label>(earns 2-5 gold)</label>
			<p><button type="submit" name="house" value="${house}">Find Gold!</button></p>
		</form>
		<form class="getgold" action="/calculate/gold" method="post">
			<h3>Quest</h3>
			<p>(earns/takes 0-50 gold)</p>
			<p><button type="submit" name="quest" value="${quest}">Find Gold!</button></p>
		</form>	
		<form class="getgold" action="/calculate/gold" method="post">
			<h3>Spa</h3>
			<p>(takes 5-20 gold)</p>
			<p><button type="submit" name="spa" value="${spa}">Spend Gold!</button></p>
		</form>		
	</div>
	<div class="activities">
		<h4>Activities</h4>		
		<textarea rows="10" cols="100">
			<c:forEach var="action" items="${actions}">
        		<c:out value="${action}"></c:out>
    		</c:forEach>
   		</textarea>			
	</div>
</div>

</body>
</html>