
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/adminlogin"})
public class teacherlogin extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            String uname = request.getParameter("username");
            String upass = request.getParameter("password");

            try {
                // Establish the database connection
                Class.forName("com.mysql.jdbc.Driver");
                try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost/collegemanagementsystem", "root", "")) {
                    // Prepare the SQL statement
                    String sql = "SELECT UserName, Password FROM admin_registrations";

                    try (PreparedStatement statement = con.prepareStatement(sql)) {

                        // Execute the query
                        try (ResultSet resultSet = statement.executeQuery()) {
                            while (resultSet.next()) {
                                // Retrieve data from the result set and store it in variables
                                String duname = resultSet.getString("UserName");
                                String dupass = resultSet.getString("Password");

                                boolean con1 = duname.equals(uname.trim());
                              boolean con2=  dupass.equals(upass);
                                // Do something with the data
                                if (con1) {

                                    if (con2) {
                                        response.sendRedirect("teacherDashBoard.jsp");
                                    } else {
                                        out.println("Check Your Password");

                                    }
                                } else {
                                    out.println("Check Your Username");
                                }
                            }
                        }

                    }
                }
            } catch (SQLException | ClassNotFoundException e) {
                out.println("Error: " + e.getMessage());
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Admin Login Servlet";
    }
}
