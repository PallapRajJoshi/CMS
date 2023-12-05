<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Student Results</title>
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

            .container {
                max-width: 800px;
                margin: auto;
                padding: 20px;
                background-color: #fff;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            }

            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            th, td {
                border: 1px solid #ddd;
                padding: 12px;
                text-align: center;
            }

            th {
                background-color: #f2f2f2;
                font-weight: bold;
            }

            tr:nth-child(even) {
                background-color: #f2f2f2;
            }

            tr:hover {
                background-color: #f5f5f5;
            }

            input[type="text"] {
                padding: 8px;
                border: 1px solid #ccc;
                border-radius: 4px;
                width: 100%;
                box-sizing: border-box;
            }

            input[type="button"] {
                background-color: #007bff;
                color: #fff;
                padding: 10px 20px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                font-weight: bold;
            }

            input[type="button"]:hover {
                background-color: #0056b3;
            }
        </style>
    </head>
    <body>
        <header>
            <h1>Enter the marks obtained by student </h1>
        </header>
  <form action="resultbim,bba" method="POST">
        <div class="container">
            <table>
                <tr>
                    <th>Student Name</th>
                                      <th class="subject" >Subject 2</th>

                </tr>
                <%

                    
                    
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost/collegemanagementsystem", "root", "");

                        Statement statement = con.createStatement();
                        String query = "SELECT fullname FROM bim_students";
                        ResultSet resultSet = statement.executeQuery(query);

                        while (resultSet.next()) {
                            String studentName = resultSet.getString("fullname");
                %>
                <tr>
                    <td> 
                        <input type="text" name="nameofstudent_<%= studentName%>" value="<%= studentName%>" readonly  /> 
                    </td>
                    <td>
                        <input type="text" name="marks" class="marks"/>
                        <input type="hidden" name="sSubject" id="selectedSubject" value="Subject 4">
                        <input type="hidden" name="program" value="bim">
                    </td>
                </tr>
                <%
                        }

                        resultSet.close();
                        statement.close();
                        con.close();
                    } catch (SQLException | ClassNotFoundException e) {
                        out.println("Error accessing the database: " + e.getMessage());
                    }
                %>
            </table>

          
                <div style="text-align: center;">
                    <input type="submit" value="Submit">
                </div>
            </form>
        </div>
    </body>
</html>
