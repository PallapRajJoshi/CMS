<%-- 
    Document   : teacherDashBoard
    Created on : Jul 12, 2023, 9:59:45 PM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="index.jsp"%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Teacher Dashboard</title>
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
            color: #333;
        }
        .cta-button {
            display: block;
            width: 150px;
            margin: 20px auto;
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            text-align: center;
            text-decoration: none;
            border-radius: 5px;
        }
        .cta-button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Welcome to Teacher Dashboard</h1>
        <a class="cta-button" href="TakeAttendancebim.jsp">Take Attendance of BIM</a>
                <a class="cta-button" href="TakeAttendancebba.jsp">Take Attendance of BBA</a>
  <a class="cta-button" href="Tpostresultbim.jsp">Post Result of BIM</a>
                <a class="cta-button" href="Tpostresultbba.jsp">Post Result of BBA</a>
    </div>
</body>
</html>
