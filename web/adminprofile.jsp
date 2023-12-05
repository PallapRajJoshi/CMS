<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="index.jsp"%>

<!DOCTYPE html>
<html>
<head>
    <title>Admin Information</title>
    <style>
        .link {
            text-decoration: none;
            color: black;
            background-color: white;
            padding: 10px 20px;
            border-radius: 4px;
            margin-right: 10px;
        }

        .admission {
            height: 20px;
            width: 100px;
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: gray;
        }

        li {
            list-style: none;
        }

        body {
            margin: 0;
            padding: 0;
            height: 100vh;
            width: 100vw;
            background-image: url(background.jpg);
            background-size: cover;
            background-position: center;
        }

        .circle {
            width: 200px;
            height: 200px;
            border-radius: 50%;
            background-image: url(profile.jpg);
            background-size: cover;
            background-position: center;
        }

        .header {
            display: flex;
            justify-content: center;
            align-items: center;
        }
        
        select {
            padding: 10px;
            border-radius: 4px;
            margin-right: 10px;
        }
        
         .logout-button {
            display: inline-block;
            padding: 10px 20px;
            background-color: #FF5733; /* Change the background color to your preference */
            color: white;
            text-decoration: none;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        /* Hover effect for the button */
        .logout-button:hover {
            background-color: #D9534F; /* Change the hover color to your preference */
        }
    </style>
</head>
<body>
    
    <% 
    HttpSession userSession = request.getSession(false);
       String username = (String) session.getAttribute("username");
       if (username != null) {
    
    
    %>
    
    
<main>
    <div class="background">
        <div class="circle"></div>
        <br><br><br>
        <nav>
            <ul>
                <li><a href="seeadminInformation.jsp" class="link" name="ainfo">See Admin Information</a></li>
                <li><a href="notice.jsp" class="link">Post Notice</a></li>
                <li><a href="resultpost.jsp" class="link">Post Result</a></li>
                <li><a href="manageusers.jsp" class="link">Manage Users</a></li>
                <li>    <a href="LogoutServlet" class="logout-button">Logout</a></li>
            </ul>
            <select id="courseSelect">
                <option disabled selected>Attendance Overview</option>
                <option value="AttendanceOverviewbim.jsp">BIM</option>
                <option value="AttendanceOverviewbba.jsp">BBA</option>
            </select>
            
        </nav>
    </div>
</main>

    
    
    
    
<script>
    var selectElement = document.getElementById('courseSelect');
    selectElement.addEventListener('change', function () {
        var selectedOption = selectElement.value;
        if (selectedOption !== "") {
            window.location.href = selectedOption;
        }
    });
    
</script>


<% } else {
String directaccess="Please Login First";
 HttpSession sessions = request.getSession();
                                        sessions.setAttribute("daccess", directaccess);
                                    response.sendRedirect("admin.jsp");

%>


<% }%>



</body>
</html>
