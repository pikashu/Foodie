<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Beer World</title>
</head>
<body>
Hello World1 <!-- the usual HTML way -->
<% out.println("Hello World2"); %> <!-- output the same thing, but using 
                                      jsp programming -->

									  
<br>
 <!-- Show html form to i) display something, ii) choose an action via a 
  | radio button -->
<form method="get" action="show.jsp" enctype=text/plain>http://marketplace.eclipse.org/marketplace-client-intro?mpc_install=1403812
    <!-- note the show.jsp will be invoked when the choice is made -->
	<!-- The next lines give HTML for radio buttons being displayed -->
  <input type="radio" name="command" value="beers"/>Let's have a beer!
  <br>
  <input type="radio" name="command" value="bars"/>Let's go to a bar!
    <!-- when the radio for bars is chosen, then 'command' will have value 
     | 'bars', in the show.jsp file, when you access request.parameters -->
  <br>
  <input type="submit" value="submit" />
  
  <input type="radio" name="command" value="Food, Restaurant, SUM(Rating)"/> Absolute Best Dish at a Restaurant
  <br>
  <input type="text" name="restaurant" placeholder="Restaurant Name"/> 
  <br>
  <input type="text" name="age" placeholder="Age Group"/>
  <br>
  The best dish under $<input type="text" name="price" placeholder="Price"/>
  
</form>
<br>

Alternatively, lets type in a bar and a beer and  a price limit.
<br>
	<form method="post" action="newBeer.jsp">
	<table>
	<tr>    
	<td>Bar</td><td><input type="text" name="bar"></td>
	</tr>
	<tr>
	<td>Beer</td><td><input type="text" name="beer"></td>
	</tr>
	<tr>
	<td>Price</td><td><input type="text" name="price"></td>
	</tr>
	</table>
	<br>
	<input type="submit" value="submit">
	</form>
</body>
</html>