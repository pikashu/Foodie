<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%> 
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!-- <title>Insert title here</title> -->
</head>
<body>

<%      

	try {
		String url = "jdbc:mysql://cs336-project.cfggfuy1dj7z.us-east-1.rds.amazonaws.com:3306/foodie_project";
	    Class.forName("com.mysql.jdbc.Driver");
    
	    Connection con = DriverManager.getConnection(url, "masteruser", "masteruser");
	    Statement stmt = con.createStatement();
	    
	    String newName = request.getParameter("name");
	    String newCity = request.getParameter("city");
	    String newState = request.getParameter("state");
	    String newBirthday = request.getParameter("birthday");
	    
	    String str = "SELECT * FROM users WHERE users.Name = '"
	    		+ newName
	    		+ "'";
	    
	    ResultSet result = stmt.executeQuery(str);
	    
	    while(result.next()){
	    	if(newCity.equals(result.getString("City")) && newState.equals(result.getString("State")) && newBirthday.equals(result.getString("Birthday"))){
	    		out.print("Duplicate detected! User not added.");
	    		return;
	    	}
	    }
	    out.print("No duplicate detected. Adding new user...");
	    
	    
	    String insert = "INSERT INTO users(Name, City, State, Birthday)" +
                "VALUES (?, ?, ?, ?)";
	    //Create a Prepared SQL statement allowing you to introduce the parameters of the query
		PreparedStatement ps = con.prepareStatement(insert);
		
	    //Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
		ps.setString(1, newName);
		ps.setString(2, newCity);
		ps.setString(3, newState);
		ps.setString(4, newBirthday);
		//Run the query against the DB
		ps.executeUpdate();
		
		out.print("<br>");
		out.print("User: " + newName + " added successfully!");
	} catch (Exception ex) {
		out.print("insert failed");
	}
	
	
%>
</body>
</html>