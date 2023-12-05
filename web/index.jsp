<%-- 
    Document   : index
    Created on : Jul 16, 2023, 9:41:28 AM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>
    
    
    
    <style>
      
        
        /* Reset some default styles */
body, h1, h2, h3, p, ul, li {
    margin: 0;
    padding: 0;
}

body {
    font-family: Arial, sans-serif;
    line-height: 1.6;
    background-color: #f4f4f4;
    color: #333;
}

header {
    background-color: #333;
    color: #fff;
    text-align: center;
    padding: 20px 0;
}

header h1 {
    margin: 0;
    font-size: 32px;
}

nav ul {
    list-style: none;
    margin: 0;
    padding: 0;
}

nav ul li {
    display: inline-block;
}

nav ul li a {
    color: #fff;
    text-decoration: none;
    padding: 10px 20px;
    display: block;
}

nav ul li a:hover {
    background-color: #555;
}

/* Style links as buttons */
.same {
    display: inline-block;
    background-color: #333;
    color: #fff;
    text-decoration: none;
    padding: 10px 20px;
    margin: 10px;
    border-radius: 5px;
}

a:hover {
    background-color: #555;
}


    </style>
</head>
<body>
    <header>
        <h1>College Management System</h1>
        <nav>
            <ul>
                <li><a href="home.jsp">Home</a></li>
                <li><a href="admin.jsp" class="same">Admin</a></li>
                <li><a href="teacherlogin.jsp" class="same">Teacher</a></li>
                <li><a href="studentlogin.jsp">Student</a></li>
                <li><a href="admissionForm.jsp"class="same">Admission Here</a></li>
            </ul>
        </nav>
    </header>

    <!-- Your page content goes here -->

</body>
</html>
