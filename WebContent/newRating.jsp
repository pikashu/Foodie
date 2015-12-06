<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%> 
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add a new rating</title>
</head>
<body>

<form method="post" action="newRatingResult.jsp">
	<table>
	<tr>    
	<td>User's Name: </td><td><input type="text" name="name" required/></td>
	</tr>
	<tr>
	<td>Menu Item: </td><td><input type="text" name="food" required/></td>
	</tr>
	<tr>
	<td>Restaurant: </td><td><input type="text" name="restaurant" required/></td>
	</tr>
	<tr>
	<td>Rating: </td><td><input type="text" name="rating" required/></td>
	</tr>
	</table>
	<br>
	<input type="submit" value="submit">
</form>
</body>
</html>