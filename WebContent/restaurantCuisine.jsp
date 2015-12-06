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
	    	String cuisine = request.getParameter("cuisine");
	    	String state = request.getParameter("state");
	    	
	    	String str = "SELECT RA.Restaurant, RE.State, avg(RA.Rating) as avg_rating "
	    			+ "FROM ratings RA "
	    			+ "INNER JOIN restaurants RE "
	    			+ "ON RA.Restaurant = RE.Name "
	    			+ "WHERE RE.Cuisine = '"
	    			+ cuisine
	    			+ "' AND RE.State = '"
	    			+ state
	    			+ "' "
	    			+ "GROUP BY RA.Restaurant "
	    			+ "ORDER BY avg_rating DESC";
	    	
	    	if (state.equals("")){
	    		str = "SELECT RA.Restaurant, RE.State, avg(RA.Rating) as avg_rating "
		    			+ "FROM ratings RA "
		    			+ "INNER JOIN restaurants RE "
		    			+ "ON RA.Restaurant = RE.Name "
		    			+ "WHERE RE.Cuisine = '"
		    			+ cuisine
		    			+ "' "
		    			+ "GROUP BY RA.Restaurant "
		    			+ "ORDER BY avg_rating DESC";
	    	}
	    	
	    	//Run the query against the database.
		    ResultSet result = stmt.executeQuery(str);
		   
		    //Make an HTML table to show the results in:
		    out.print("<table>");
	    	out.print("<tr>");
	    	out.print("<td>");
	    	out.print("Restaurant");
	    	out.print("</td>");
	    	out.print("<td>");
	    	out.print("State");
	    	out.print("</td>");
	    	out.print("<td>");
	    	out.print("Average Rating");
	    	out.print("</td>");
	    	out.print("</tr>");
	    	
	    	while(result.next()){
	    		out.print("<tr>");
	    		out.print("<td>");
	    		out.print(result.getString("Restaurant"));
	    		out.print("</td>");
	    		out.print("<td>");
	    		out.print(result.getString("State"));
	    		out.print("</td>");
	    		out.print("<td>");
	    		out.print(result.getString("avg_rating"));
	    		out.print("</td>");
	    		out.print("</tr>");
	    	}
	    	
	    	con.close();
	    	
	} catch (Exception e){
		e.printStackTrace();
	}
	
	
%>

</body>
</html>