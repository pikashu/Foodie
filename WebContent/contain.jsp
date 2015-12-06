<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
</head>
<body>
<%

	try {

	    	//Create a connection string
	    	String url = "jdbc:mysql://cs336-project.cfggfuy1dj7z.us-east-1.rds.amazonaws.com:3306/foodie_project";
		    Class.forName("com.mysql.jdbc.Driver");
	    
	    	//Create a connection to your DB
		    Connection con = DriverManager.getConnection(url, "masteruser", "masteruser");
		    Statement stmt = con.createStatement();
		    
	    	String restaurant = request.getParameter("restaurant");
	    	String food = request.getParameter("food");
	    	
	    	String str = "SELECT EXISTS( "
	    			+ "SELECT * FROM menuitems "
	    		    + "WHERE Restaurant = '"
	    		    + restaurant
	    		    + "' "
	    		    + "AND Food = '"
	    		    + food
	    		    + "') AS food_exists";
	    	
	    	//Run the query against the database.
		    ResultSet result = stmt.executeQuery(str);
	    	
	    	result.next();
	    	
	    	if (result.getString("food_exists").equals("1")){
	    		out.print("Yes! " + restaurant + " has " + food + " on it's menu!");
	    	} else
	    		out.print("Sorry! " + restaurant + " does not have " + food);
	    	
	    	con.close();
	    	
	} catch (Exception e){
		e.printStackTrace();
	}
	
	
%>

</body>
</html>