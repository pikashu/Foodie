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
	    
	    String newRestaurant = request.getParameter("restaurant");
	    String newFood = request.getParameter("food");
	    Float newPrice = Float.valueOf(request.getParameter("price"));
	    
	    String str = "SELECT * FROM restaurants WHERE restaurants.Name = '"
	    		+ newRestaurant
	    		+ "'";
	    
	    ResultSet result = stmt.executeQuery(str);
	    
	    if(result.next() == false){
	    	out.print("Restaurant not found!");
	    	out.print("<br>");
	    	out.print("This menu item was not added");
	    	return;
	    }
	    
	    System.out.println("Restaurant found!");
	    
	    String insert = "INSERT INTO menuitems(Restaurant, Food, Price)" +
                "VALUES (?, ?, ?)";
	    //Create a Prepared SQL statement allowing you to introduce the parameters of the query
		PreparedStatement ps = con.prepareStatement(insert);
		
	    //Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
		ps.setString(1, newRestaurant);
		ps.setString(2, newFood);
		ps.setFloat(3, newPrice);
		//Run the query against the DB
		ps.executeUpdate();
		
		out.print("Menu item: " + newFood + " added successfully!");
	} catch (Exception ex) {
		ex.printStackTrace();
		out.print("insert failed");
	}
	
	
%>
</body>
</html>