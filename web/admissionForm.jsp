<%-- 
    Document   : adnissionForm
    Created on : Jul 16, 2023, 10:05:29 AM
    Author     : Dell
--%>
<%@include file="index.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
  <title>Admission Form</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f2f2f2;
      padding: 20px;
    }

    .form-container {
      background-color: #fff;
      max-width: 500px;
      margin: 0 auto;
      padding: 20px;
      border-radius: 5px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    h2 {
      text-align: center;
    }

    label {
      display: block;
      margin-bottom: 10px;
    }

    input[type="text"],
    input[type="email"],
    select {
      width: 100%;
      padding: 10px;
      border-radius: 3px;
      border: 1px solid #ccc;
      box-sizing: border-box;
    }

    input[type="submit"] {
      background-color: #4caf50;
      color: #fff;
      border: none;
      padding: 10px 20px;
      margin-top: 20px;
      cursor: pointer;
    }

    input[type="submit"]:hover {
      background-color: #45a049;
    }
  </style>
</head>
<body>
    <h2>Admission Form</h2>
  <div class="form-container">
    
    <form method="post" action="admission">
      <label for="name">Full Name:</label>
      <input type="text" id="name" name="name" required>

      <label for="dob">Date of Birth:</label>
      <input type="text" id="dob" name="dob" required placeholder="YYYY-MM-DD">

      <label for="gender">Gender:</label>
      <select id="gender" name="gender" required>
        <option value="">Select</option>
        <option value="male">Male</option>
        <option value="female">Female</option>
        <option value="other">Other</option>
      </select>

      <label for="nationality">Nationality:</label>
      <input type="text" id="nationality" name="nationality" required>

      <label for="contact">Contact Number:</label>
      <input type="text" id="contact" name="contact" required>

      <label for="email">Email Address:</label>
      <input type="email" id="email" name="email" required>

      <label for="address">Permanent Address:</label>
      <input type="text" id="address" name="address" required>

      <label for="program"> Choose Program:</label>
      <select id="program" name="program" required>
        <option value="">Select</option>
        <option value="bba">BBA</option>
        <option value="bim">BIM</option>
       
      </select>

      <!-- Include additional fields for educational background, preferred intake, and additional information as necessary -->

      <input type="submit" value="Submit">
    </form>
  </div>
</body>
</html>
