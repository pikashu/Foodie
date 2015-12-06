<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Foodie</title>
</head>
<body>
<h1 align="center"><b><u>Welcome to Foodie!</u></b></h1>
<hr>

<!-- QUERIES -->
<h4 align="left"><b> Custom Queries </b></h4>
<form method="get" action="dishState.jsp" enctype=text/plain>
	Find the most popular dishes in <input type="text" name="state" placeholder="Enter Full State Name" required/>
	<input type="submit" value="submit" />
</form>

<br>

<form method="get" action="dishRestaurant.jsp" enctype=text/plain>
	Find the most popular dishes at <input type="text" name="restaurant" placeholder="Enter Restaurant Name" required/>
	<input type="submit" value="submit"/>
</form>

<br>

<form method="get" action="dishAge.jsp" enctype=text/plain>
	Find the most popular dishes for users around the age of <input type="number" name="age" min="1" required/>
	<input type="submit" value="submit"/>
</form>

<br>

<form method="get" action="restaurantDish.jsp" enctype=text/plain>
	Find which restaurant serves the best <input type="text" name="food" placeholder="Enter a dish" required/> in <input type="text" name="state" placeholder="Enter a State or nothing"/>
	<input type="submit" value="submit"/>
</form>

<br>

<form method="get" action="dishCuisine.jsp" enctype=text/plain>
	Find the best dish among <input type="text" name="cuisine" placeholder="ie. American, Mexican, etc." required/> cuisine.
	<input type="submit" value="submit"/>
</form>

<br>

<form method="get" action="restaurantCuisine.jsp" enctype=text/plain>
	Find the best restaurant that serves <input type="text" name="cuisine" placeholder="ie. Japanese, Chinese, etc." required/> in <input type="text" name="state" placeholder="Enter a State or nothing"/>
	<input type="submit" value="submit"/>
</form>

<br>

<form method="get" action="bestDish.jsp" enctype=text/plain>
	Find the best <input type="text" name="cuisine" placeholder="ie. American, Chinese, etc."> dish in <input type="text" name="state" placeholder="ie. Texas, New York, etc."/> under $<input type="number" name="price" min="0"/>
	<input type="submit" value="submit"/>
</form>

<br>

<form method="get" action="contain.jsp" enctype=text/plain>
	Check to see if <input type="text" name="restaurant" placeholder="Restaurant Name" required/> has <input type="text" name="food" placeholder="Menu Item" required />
	<input type="submit" value="submit"/>
</form>

<br>

<hr>
<!-- INSERTS -->
<h4 align="left"><b> Adding to the Database </b></h4>
<form align="left" action="newUser.jsp">
    <input type="submit" value="Add New User">
</form>

<br>

<form align="left" action="newRestaurant.jsp">
    <input type="submit" value="Add New Restaurant">
</form>

<br>

<form align="left" action="newMenuItem.jsp">
    <input type="submit" value="Add New Menu Item">
</form>

<br>

<form align="left" action="newRating.jsp">
    <input type="submit" value="Add New Rating">
</form>

<br>

<hr>

<h3><b> View All </b></h3>
<form method="get" action="showAll.jsp" enctype=text/plain>
	<select name="command">
    	<option value="users">Users</option>
    	<option value="restaurants">Restaurants</option>
    	<option value="ratings">Ratings</option>
    	<option value="menuitems">Menu Items</option>
    </select>
    <input type="submit" value="View All" />
</form>