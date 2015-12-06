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
	    	String food = request.getParameter("food");
	    	String state = request.getParameter("state");
	    	
	    	System.out.println(state);
	    	
	    	String str = "SELECT RA.Restaurant, RA.Food, AVG(RA.Rating) as avg_rating "
	    		+ "FROM ratings RA "
				+ "INNER JOIN restaurants RE "
				+ "ON RA.Restaurant = RE.Name "
				+ "WHERE RE.State = '"
				+ state
				+ "' AND RA.Food LIKE CONCAT('%', '"
				+ food
				+ "', '%') "
				+ "GROUP BY RA.Restaurant, RA.Food "
				+ "ORDER BY avg_rating DESC";
	    	
	    	if (state.equals("")){
	    		str = "SELECT RA.Restaurant, RA.Food, AVG(RA.Rating) as avg_rating "
	    	    		+ "FROM ratings RA "
	    				+ "INNER JOIN restaurants RE "
	    				+ "WHERE RA.Food LIKE CONCAT('%', '"
	    				+ food
	    				+ "', '%') "
	    				+ "GROUP BY RA.Restaurant, RA.Food "
	    				+ "ORDER BY avg_rating DESC";
	    	}
	    	
	    	System.out.println(str);
				
	    	//Run the query against the database.
		    ResultSet result = stmt.executeQuery(str);
		   
		    //Make an HTML table to show the results in:
		    out.print("<table>");
	    	out.print("<tr>");
	    	out.print("<td>");
	    	out.print("Restaurant");
	    	out.print("</td>");
	    	out.print("<td>");
	    	out.print("Food");
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
	    		out.print(result.getString("Food"));
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