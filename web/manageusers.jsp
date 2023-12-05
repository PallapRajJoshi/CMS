<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Beautiful Design</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        header {
            background-color: #333;
            color: #fff;
            text-align: center;
            padding: 1rem 0;
        }

        nav {
            display: flex;
            justify-content: center;
            background-color: #007bff;
            padding: 1rem 0;
        }

        nav a {
            color: #fff;
            text-decoration: none;
            padding: 0.5rem 1rem;
            margin: 0 1rem;
            border-radius: 4px;
            transition: background-color 0.3s ease;
        }

        nav a:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<header>
    <h1>Manage Users</h1>
</header>

<nav>
    <a href="adminrequest.jsp">Admin Requests</a>
    <a href="teacherrequest.jsp">Teacher Request</a>
    <a href="admissionrequest.jsp">Admission Requests</a>
    <a href="adminrequest.jsp">Remove Access Of Students</a>
    <a href="adminrequest.jsp">Remove Access Of Teacher</a>
    <a href="adminrequest.jsp">Remove Access Of Admin</a>
</nav>

</body>
</html>
