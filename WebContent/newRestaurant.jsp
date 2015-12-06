<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%> 
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add a new restaurant</title>
</head>
<body>

<form method="post" action="newRestaurantResult.jsp">
	<table>
	<tr>    
	<td>Name: </td><td><input type="text" name="name" required/></td>
	</tr>
	<tr>
	<td>City: </td><td><input type="text" name="city" required/></td>
	</tr>
	<tr>
	<td>State: </td><td><input type="text" name="state" required/></td>
	</tr>
	<tr>    
	<td>Type of Cuisine: </td><td><input type="text" name="cuisine" required/></td>
	</tr>
	</table>
	<br>
	<input type="submit" value="submit">
</form>
</body>
</html>