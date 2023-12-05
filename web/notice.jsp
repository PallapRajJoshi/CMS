<%-- 
    Document   : notice
    Created on : Jul 15, 2023, 8:49:18 AM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f0f0f0;
        }

        h1 {
            margin-bottom: 20px;
            color: #333;
        }

        form {
            max-width: 500px;
            margin: 0 auto;
            background-color: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        label {
            display: block;
            margin-bottom: 10px;
            font-weight: bold;
            color: #444;
        }

        input[type="text"],
        textarea {
            width: 100%;
            padding: 10px;
            border-radius: 4px;
            border: 1px solid #ccc;
            background-color: #f9f9f9;
            color: #333;
        }

        textarea {
            resize: vertical;
        }

        button {
            padding: 10px 20px;
            background-color: #4CAF50;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        button:hover {
            background-color: #45a049;
        }

        .back-btn {
            display: inline-block;
            margin-top: 20px;
            color: #666;
            text-decoration: none;
        }

        .back-btn i {
            margin-right: 5px;
        }
    </style>
</head>
<body>
   <h1> Post Notice</h1>
    <form action="post_notice" method="POST">
        <label for="content">Notice:</label>
        <textarea id="content" name="notice_content" rows="5" required></textarea>
        <button type="submit">Post Notice</button>
        <button type="button"> <a href="adminprofile.jsp">Back TO Dash Board</a></button>
    </form>
</body>
</html>

