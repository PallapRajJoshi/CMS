<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="index.jsp"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
    
    
    
     <meta http-equiv="Cache-Control" content="no-store, no-cache, must-revalidate, post-check=0, pre-check=0">
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Expires" content="0">
<!--    <script>
        window.onload = function () {
            var message = '<%= session.getAttribute("message") %>';
            if (message && message.length > 0 && message !== 'null') {
                alert(message);
                <% session.removeAttribute("message"); %>
            }
        };
    </script>-->

    <title>Login Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f7f7f7;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 300px;
            margin: 20px auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #f7f7f7;
            box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            margin-top: 20px;
        }

        label {
            display: block;
            margin-bottom: 10px;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            border-radius: 3px;
            border: 1px solid #ccc;
        }

        input[type="submit"] {
            width: 100%;
            padding: 8px;
            border-radius: 3px;
            border: none;
            background-color: #4CAF50;
            color: white;
            cursor: pointer;
        }

        .options {
            margin-top: 10px;
            text-align: center;
        }

        .options a {
            margin-right: 10px;
            color: #333;
            text-decoration: none;
        }

        .options a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    
    
    
    
    
<div class="container">
    <h1>Admin Login</h1>
    
    <% 
    HttpSession sessions = request.getSession(false);
    String error=(String)session.getAttribute("daccess");
    String errorMessage = (String) sessions.getAttribute("errormessage");
    if (errorMessage != null ) { %>
        <script>
                      

            alert("<%= errorMessage %>");
        </script>
        
        
        <%
            // Clear the error message from the session
//             session.removeAttribute("daccess");
            session.removeAttribute("errormessage");
        %>
    <% } %>
    <%
      if (error!= null ) { %>
        <script>
                       alert("<%= error %>");

            
        </script>
        
        
        <%
            // Clear the error message from the session
//             session.removeAttribute("daccess");
            session.removeAttribute("daccess");
        %>
    <% } %>
    
    
    
    
    

    <form action="adminprofile" method="POST">
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required>

        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required>

        <input type="submit" value="Login">
    </form>
    <div class="options">
        <a href="AdminRegister.jsp">Register</a>
        <a href="adminForgot.html">Forgot Password?</a>
    </div>
</div>

</body>
</html>
