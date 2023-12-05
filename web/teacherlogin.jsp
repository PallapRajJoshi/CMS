<%-- 
    Document   : teacher
    Created on : Jul 12, 2023, 9:42:30 PM
    Author     : Dell
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="index.jsp"%>

<!DOCTYPE html>
<html>
<head>
    
    
<!--<script>
   window.onload = function() {
        var message = '<%= session.getAttribute("message") %>';
        if (message && message.length > 0 && message !== 'null') {
            alert(message);
            <% session.removeAttribute("message"); %>
        }
    };
</script>-->
    
    <title>Login Page</title>
    <style>
        .container {
    width: 300px;
    margin: 0 auto;
    padding: 20px;
    border: 1px solid #ccc;
    border-radius: 5px;
    background-color: #f7f7f7;
}

h1 {
    text-align: center;
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
    <h1>Teacher Login</h1>
    
    <div class="container">
       
        <form action="teacherlogin1" method="POST">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required>
            
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
            
            <input type="submit" value="Login">
        </form>
        <div class="options">
            <a href="teacherRegister.jsp">Register</a>
            <a href="teacherforget.jsp">Forgot Password?</a>
        </div>
    </div>
    
</body>
</html>


