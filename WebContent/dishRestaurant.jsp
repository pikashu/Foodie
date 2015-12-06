<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%      
	List<String> list = new ArrayList<String>();

	try {



	    	//Create a connection string
			//String url = "jdbc:mysql://your_VM:3306/your_db";
	    	String url = "jdbc:mysql://cs336-project.cfggfuy1dj7z.us-east-1.rds.amazonaws.com:3306/foodie_project";
	    	//Load JDBC driver - the interface standardizing the connection procedure. Look at WEB-INF\lib for a mysql connector jar file, otherwise it fails.
		    Class.forName("com.mysql.jdbc.Driver");
	    
	    	//Create a connection to your DB
		    Connection con = DriverManager.getConnection(url, "masteruser", "masteruser");
	    	//Create a SQL statement
		    Statement stmt = con.createStatement();
	    	//Get the selected radio button from the HelloWorld.jsp
	    	String restaurant = request.getParameter("restaurant");
	    	//Make a SELECT query from the table specified by the 'command' parameter at the HelloWorld.jsp
	    	String str = "select r.Food, avg(r.Rating) as avg_rating "
						+ "FROM ratings r "
						+ "WHERE r.Restaurant = '" + restaurant
						+ "' GROUP BY r.Food "
						+ "ORDER BY avg_rating desc";
	    	//Run the query against the database.
		    ResultSet result = stmt.executeQuery(str);
		   
		    //Make an HTML table to show the results in:
		    out.print("<table>");
	    	out.print("<tr>");
	    	out.print("<td>");
	    	out.print("Name of Dish");
	    	out.print("</td>");
	    	out.print("<td>");
	    	out.print("Average Rating");
	    	out.print("</td>");
	    	out.print("</tr>");
	    	
	    	while(result.next()){
	    		out.print("<tr>");
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