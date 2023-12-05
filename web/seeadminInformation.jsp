<%@page import="java.util.Base64"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@include file="index.jsp"%>
<html>
<head>
    <title>Admin Information</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }

        h2 {
            text-align: center;
        }

        p {
            font-size: 16px;
            margin-bottom: 8px;
        }

        img {
            max-width: 200px;
            max-height: 200px;
            display: block;
            margin: 20px auto;
        }
    </style>
</head>
<body>
    <h2>Admin Information:</h2>
    <%
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/collegemanagementsystem", "root", "");

            String sql = "SELECT FullName, UserName, email, phone, photo FROM admin_registrations";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                String fullName = resultSet.getString("FullName");
                String userName = resultSet.getString("UserName");
                String email = resultSet.getString("email");
                String phone = resultSet.getString("phone");

                // Display the admin information
    %>
                <p><strong>Full Name:</strong> <%= fullName %></p>
                <p><strong>Username:</strong> <%= userName %></p>
                <p><strong>Email:</strong> <%= email %></p>
                <p><strong>Phone:</strong> <%= phone %></p>
    <%
                // Display the photo
                byte[] photoData = resultSet.getBytes("photo");
                if (photoData != null && photoData.length > 0) {
                    String photoBase64 = Base64.getEncoder().encodeToString(photoData);
    %>
                    <img src="data:image/jpeg;base64, <%= photoBase64 %>" alt="Admin Photo" /><br/><br/>
    <%
                }
            }

            resultSet.close();
            statement.close();
            connection.close();

        } catch (SQLException | ClassNotFoundException e) {
            out.println("Error retrieving admin information: " + e.getMessage());
        }
    %>
</body>
</html>
