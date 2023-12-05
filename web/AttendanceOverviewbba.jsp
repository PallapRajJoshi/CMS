<%-- 
    Document   : AttendanceOverview
    Created on : Jul 28, 2023, 10:57:03 PM
    Author     : Dell
--%>
<%@ page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Attendance Overview </title>
          <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f7f7f7;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            background-color: white;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
        }
        h1 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }
        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #f2f2f2;
            color: #333;
        }
        tr:nth-child(even) {
            background-color: #f7f7f7;
        }
    </style>
    </head>
    <body>


            <div class="container">
        <h1>Student Attendance Overview</h1>
        <table>
            <tr>
                <th>Name of Students</th>
                <th>Present </th>
                <th>Absent </th>
            </tr>
            <%
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/collegemanagementsystem", "root", "");


                    // Create a statement for retrieving data from the database
                    Statement statement = con.createStatement();
                   String query = "SELECT name_of_student, " +
                       "SUM(CASE WHEN status = 'present' THEN 1 ELSE 0 END) AS present_count, " +
                       "SUM(CASE WHEN status = 'absent' THEN 1 ELSE 0 END) AS absent_count " +
                       "FROM bba_students_attendance " +
                       "GROUP BY name_of_student";
        ResultSet resultSet = statement.executeQuery(query);

        // Loop through the result set and display data in the table
        while (resultSet.next()) {
            String studentName = resultSet.getString("name_of_student");
            int presentCount = resultSet.getInt("present_count");
            int absentCount = resultSet.getInt("absent_count");
%>
        <tr>
            <td><%= studentName %></td>
            <td><%=presentCount %></td>
            <td><%=absentCount %></td>
        </tr>
            <%
                
        
                    
}
       
        resultSet.close();
        statement.close();
        con.close();
    } catch (SQLException | ClassNotFoundException e) {
        out.println("Error accessing the database: " + e.getMessage());
    }
    %>
        </table>
            </div>
        


    </body>
</html>
