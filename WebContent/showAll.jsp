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
		   // Connection con = DriverManager.getConnection(url, "csuser", "your_pwd");
		    Connection con = DriverManager.getConnection(url, "masteruser", "masteruser");
	    	//Create a SQL statement
		    Statement stmt = con.createStatement();
	    	//Get the selected radio button from the HelloWorld.jsp
		    String entity = request.getParameter("command");
	    	//Make a SELECT query from the table specified by the 'command' parameter at the HelloWorld.jsp
			String str = "SELECT * FROM " + entity;
	    	//Run the query against the database.
		    ResultSet result = stmt.executeQuery(str);
		   
		    //Make an HTML table to show the results in:
		    out.print("<table>");
	    	if (entity.equals("users")){
	    		
	    		out.print("<tr>");
	    		out.print("<td>");
	    		out.print("Name");
	    		out.print("</td>");
	    		out.print("<td>");
	    		out.print("City");
	    		out.print("</td>");
	    		out.print("<td>");
	    		out.print("State");
	    		out.print("</td>");
	    		out.print("<td>");
	    		out.print("Birthday");
	    		out.print("</td>");
	    		out.print("</tr>");
	    		
	    		while(result.next()) {
	    			out.print("<tr>");
	    			out.print("<td>");
	    			out.print(result.getString("Name"));
	    			out.print("</td>");
	    			out.print("<td>");
	    			out.print(result.getString("City"));
	    			out.print("</td>");
	    			out.print("<td>");
	    			out.print(result.getString("State"));
	    			out.print("</td>");
	    			out.print("<td>");
	    			out.print(result.getString("Birthday"));
	    			out.print("</td>");
	    			out.print("</tr>");
	    		}
	    	} else if (entity.equals("restaurants")){
	    		out.print("<tr>");
	    		out.print("<td>");
	    		out.print("Name");
	    		out.print("</td>");
	    		out.print("<td>");
	    		out.print("City");
	    		out.print("</td>");
	    		out.print("<td>");
	    		out.print("State");
	    		out.print("</td>");
	    		out.print("<td>");
	    		out.print("Cuisine");
	    		out.print("</td>");
	    		out.print("</tr>");
	    		
	    		while(result.next()) {
	    			out.print("<tr>");
	    			out.print("<td>");
	    			out.print(result.getString("Name"));
	    			out.print("</td>");
	    			out.print("<td>");
	    			out.print(result.getString("City"));
	    			out.print("</td>");
	    			out.print("<td>");
	    			out.print(result.getString("State"));
	    			out.print("</td>");
	    			out.print("<td>");
	    			out.print(result.getString("Cuisine"));
	    			out.print("</td>");
	    			out.print("</tr>");
	    		}
	    	} else if (entity.equals("ratings")){
	    		out.print("<tr>");
	    		out.print("<td>");
	    		out.print("Name");
	    		out.print("</td>");
	    		out.print("<td>");
	    		out.print("Food");
	    		out.print("</td>");
	    		out.print("<td>");
	    		out.print("Restaurant");
	    		out.print("</td>");
	    		out.print("<td>");
	    		out.print("Rating");
	    		out.print("</td>");
	    		out.print("</tr>");
	    		
	    		while(result.next()) {
	    			out.print("<tr>");
	    			out.print("<td>");
	    			out.print(result.getString("Name"));
	    			out.print("</td>");
	    			out.print("<td>");
	    			out.print(result.getString("Food"));
	    			out.print("</td>");
	    			out.print("<td>");
	    			out.print(result.getString("Restaurant"));
	    			out.print("</td>");
	    			out.print("<td>");
	    			out.print(result.getString("Rating"));
	    			out.print("</td>");
	    			out.print("</tr>");
	    		}
	    	} else if (entity.equals("menuitems")){
	    		out.print("<tr>");
	    		out.print("<td>");
	    		out.print("Restaurant");
	    		out.print("</td>");
	    		out.print("<td>");
	    		out.print("Food");
	    		out.print("</td>");
	    		out.print("<td>");
	    		out.print("Price");
	    		out.print("</td>");
	    		out.print("</tr>");
	    		
	    		while(result.next()) {
	    			out.print("<tr>");
	    			out.print("<td>");
	    			out.print(result.getString("Restaurant"));
	    			out.print("</td>");
	    			out.print("<td>");
	    			out.print(result.getString("Food"));
	    			out.print("</td>");
	    			out.print("<td>");
	    			out.print(result.getString("Price"));
	    			out.print("</td>");
	    			out.print("</tr>");
	    		}
	    	}
	    	
	    	con.close();
	    	
	    	
	} catch (Exception e){
		e.printStackTrace();
	}
	
	
%>

</body>
</html>