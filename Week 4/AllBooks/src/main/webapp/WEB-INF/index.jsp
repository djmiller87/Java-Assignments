<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Reading Books</title>
</head>
<body>
<h1>All Books</h1>
<table>
    <thead>
        <tr>
            <th>ID</th>
            <th>Title</th>
            <th>Language</th>
            <th>Number of Pages</th>
        </tr>
    </thead>
    <tbody>         
    	<c:forEach var="oneBook" items="${books}">	        		
	    	<tr>
	    		<td>${oneBook.id}</td>
			    <td><a href="/book/${oneBook.id}/show" >${oneBook.title}</a></td>
				<td>${oneBook.language}</td>
				<td>${oneBook.numberOfPages}</td>
			</tr>
    	</c:forEach>
    </tbody>
</table>


</body>
</html>