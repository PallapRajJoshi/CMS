<%-- 
    Document   : studentregister
    Created on : Jul 15, 2023, 8:01:30 AM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="index.jsp"%>

<!DOCTYPE html>
<html>
<head>
  <title>Admin Login</title>
  
  
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f2f2f2;
      margin: 0;
      padding: 0;
    }
    .container {
      width: 400px;
      margin: 100px auto;
      background-color: #ffffff;
      padding: 30px;
      border-radius: 5px;
      box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    }
    h2 {
      text-align: center;
      color: #333333;
    }
    label {
      display: block;
      margin-bottom: 10px;
      color: #555555;
    }
    input[type="text"],
    input[type="password"],
    input[type="tel"],
    input[type="email"] {
      width: 100%;
      padding: 10px;
      border: 1px solid #cccccc;
      border-radius: 3px;
      margin-bottom: 20px;
      box-sizing: border-box;
      font-size: 14px;
    }
    input[type="submit"] {
      background-color: #4CAF50;
      color: white;
      border: none;
      padding: 15px;
      font-size: 16px;
      width: 100%;
      cursor: pointer;
    }
  </style>
</head>
<body>
  <div class="container">
    <h2>Admin Login</h2>
        <form action="studentregistersucc" method="POST" enctype="multipart/form-data">
        
        <label for="fullname">Full Name</label>
      <input type="text" id="fullname" name="fullname" required>
      <label for="username">Username</label>
      <input type="text" id="username" name="username" required>
      
      <label for="password">Password</label>
      <input type="password" id="password" name="password" required>
       <label for="password">Confirm Password</label>
      <input type="password" id="cpassword" name="cpass" required>
      <label for="phone">Phone</label>
      <input type="tel" id="phone" name="phone" required>
      
      <label for="email">Email</label>
      <input type="email" id="email" name="email" required>
      <br>
      <label> Upload Your Picture Here </label>
      <input type="file" name="photo" accept="image/jpeg, image/png" >
      
      <br><br>
      <input type="submit" value="Register">
    </form>
  </div>
</body>
</html>

