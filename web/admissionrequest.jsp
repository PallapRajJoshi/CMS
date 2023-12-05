<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    
    
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        
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
    
header {
    background-color: #333;
    color: #fff;
    text-align: center;
    padding: 2rem 0;
}
.main-heading {
    font-size: 2.5rem;
    margin-bottom: 0.5rem;
}

.sub-heading {
    font-size: 1.2rem;
    font-style: italic;
}
</style>
</head>
<body>
    
    <header>
        <h1 class="main-heading">Admission Request Approval</h1>
        <p class="sub-heading">Review and approve admission requests</p>
    </header>
    <table>
        <tr>
            <th>Full Name</th>
            <th>Gender</th>
            <th>Address</th> 
            <th>Phone</th>
            <th>Email</th>
            <th>Program</th> 
            <th colspan="2">Actions</th>
        </tr>

        <%
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost/collegemanagementsystem", "root", "");
                
                // Create a statement for retrieving data from the database
                Statement statement = con.createStatement();
                String query = "SELECT admission_request_id, fullname, gender, address, phone, email, program FROM admission_requests";
                ResultSet resultSet = statement.executeQuery(query);

                // Loop through the result set and display data in the table
                while (resultSet.next()) {
                    int recordId = resultSet.getInt("admission_request_id"); // Get the ID from the result set

        %>
                    <tr>
                        <td><%= resultSet.getString("fullname") %></td>
                        <td><%= resultSet.getString("gender") %></td>
                        <td><%= resultSet.getString("address") %></td>
                        <td><%= resultSet.getString("phone") %></td>
                        <td><%= resultSet.getString("email") %></td>
                        <td><%= resultSet.getString("program") %></td>
                        <td><a href="admissinrequestdelete?id=<%= recordId %>">Delete Request</a></td>
                        <td><a href="admissionrequestadd?id=<%= recordId %>">Add Request</a></td>
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
    </table>
</body>
</html>
