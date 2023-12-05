<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
  <title>Student Results</title>
  <link rel="stylesheet" type="text/css" href="styles.css">
</head>


<style>
    body {
  font-family: Arial, sans-serif;
  margin: 20px;
}

h1 {
  text-align: center;
}

table {
  width: 100%;
  border-collapse: collapse;
  margin-top: 20px;
}

th, td {
  border: 1px solid #ddd;
  padding: 8px;
  text-align: center;
}

th {
  background-color: #f2f2f2;
}

tr:nth-child(even) {
  background-color: #f2f2f2;
}

tr:hover {
  background-color: #ddd;
}

</style>
<body>
  <h1>Student Results</h1>
  <table>
    <tr>
        <!--<th>SN</th>-->
      <th>Student Name</th>
      <th>Subject 1</th>
      <th>Subject 2</th>
      <th>Subject 3</th>
      <th>Subject 4</th>
      <th>Subject 5</th>
    </tr>
    <%
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost/collegemanagementsystem", "root", "");
                
                // Create a statement for retrieving data from the database
                Statement statement = con.createStatement();
                String query = "SELECT  fullname FROM bim_students";
                ResultSet resultSet = statement.executeQuery(query);

                // Loop through the result set and display data in the table
                while (resultSet.next()) {
                   String name=resultSet.getString("fullname");
                   out.println(name);
                
//int recordId = resultSet.getInt("id"); // Get the ID from the result set
//PreparedStatement statement2=con.prepareStatement(query);
        %>
    
          <tr>
                        <td><%= resultSet.getString("fullname") %></td>
                        <td><input type="text" placeholder="enter marks for first sub"></td>
                        <td><input type="text" placeholder="enter marks for first sub"></td>
                        <td><input type="text" placeholder="enter marks for first sub"></td>
                        <td><input type="text" placeholder="enter marks for first sub"></td>
                        <td><input type="text" placeholder="enter marks for first sub"></td>
                       
                    </tr>
                      <%
                }
                
                // Close the resources
                resultSet.close();
                statement.close();
                con.close();
            } catch (SQLException | ClassNotFoundException e) {
                out.println("Error accessing the database: " + e.getMessage());
            }
        %>
    <!-- Add more rows for other students -->
  </table>
  <br>
  <form action="abc" method="POST">
      
      <h1>  <input type="button" value="POST"></h1>
      
  </form>
</body>
</html>
