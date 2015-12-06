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
	    	String url = "jdbc:mysql://cs336-project.cfggfuy1dj7z.us-east-1.rds.amazonaws.com:3306/foodie_project";
		    Class.forName("com.mysql.jdbc.Driver");
	    
		    Connection con = DriverManager.getConnection(url, "masteruser", "masteruser");
		    Statement stmt = con.createStatement();
	    	String age = request.getParameter("age");

	    	String str = "SELECT R.Food, AVG(R.Rating) as avg_rating "
	    		+ "FROM ratings R "
				+ "INNER JOIN users U "
				+ "ON R.Name = U.Name "
				+ "WHERE (ABS(DATEDIFF(U.Birthday, DATE_ADD(CURDATE(), INTERVAL -"
				+ age
				+ " YEAR)))/365 <= 2) "
				+ "GROUP BY(R.Food) "
				+ "ORDER BY avg_rating DESC";
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