<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Attendance Form</title>
    <style>
      
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        table {
            border-collapse: collapse;
            width: 100%;
            margin-bottom: 20px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        input[type="date"] {
            width: 150px;
        }
        select {
            width: 120px;
        }
        button {
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }
        .input-container {
            display: flex;
            align-items: center;
        }
        .input-container select {
            margin-left: 10px;
        }
        .submit-container {
            text-align: center;
            margin-top: 20px;
        }
    </style>
</head>
<body>
<form action="submitattandance" method="post">
<table>
    <thead>
    <tr>
        <th>Date</th>
        <th>Full Name</th>
        <th>Take Attendance</th>
    </tr>
    </thead>
    <tbody>
    <%
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost/collegemanagementsystem", "root", "");

        // Create a statement for retrieving data from the database
        Statement statement = con.createStatement();
        String query = "SELECT b_student_id, fullname FROM bim_students";
        ResultSet resultSet = statement.executeQuery(query);

        // Loop through the result set and display data in the table
        while (resultSet.next()) {
            int studentId = resultSet.getInt("b_student_id");
            String fullName = resultSet.getString("fullname");
    %>
    <tr>
        <td><input type="date" class="inputDate" name="inputDate_<%= studentId %>" /></td>
     <td><%= fullName %></td>

        <td>
                    <input type="hidden" value="<%= fullName %>" name="sname_<%= studentId %>"/>

              <input type="hidden" name="studentId" value="<%= studentId %>" />
            <select name="attendance_<%= studentId %>" class="attendance">
                <option value="" disabled selected>Select</option>
                <option value="present">Present</option>
                <option value="absent">Absent</option>
            </select>
        </td>
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
    </tbody>
</table>

<button type="submit" id="submitAttendanceBtn">Submit Attendance</button>
</form>

<script>
    // Get the input elements and set the current date as the default value
    const inputDateElements = document.querySelectorAll('.inputDate');
    const currentDate = new Date().toISOString().split('T')[0];
    inputDateElements.forEach((inputDateElement) => {
        inputDateElement.value = currentDate;
    });
</script>

</body>
</html>
