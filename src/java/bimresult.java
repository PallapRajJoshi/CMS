import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/bimresult"})
public class bimresult extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            String selectedSubject = request.getParameter("sSubject");
            String progra = request.getParameter("program");
            int currentMarkIndex = 0;
            
            try {
                 Class.forName("com.mysql.jdbc.Driver");
                try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost/collegemanagementsystem", "root", "")) {
                    String query = "SELECT fullname FROM bim_students";
                    try (Statement statement = con.createStatement(); ResultSet resultSet = statement.executeQuery(query)) {
                        while (resultSet.next()) {
                            String studentName = resultSet.getString("fullname");
                            String[] marksValues = request.getParameterValues("marks");

                            if (marksValues != null && currentMarkIndex < marksValues.length) {
                                String sql = "INSERT INTO result_bim (name_of_student, marks, subject, program) VALUES (?, ?, ?, ?)";
                                try (PreparedStatement sql1 = con.prepareStatement(sql)) {
                                    sql1.setString(1, studentName);
                                    sql1.setString(2, marksValues[currentMarkIndex]);
                                    sql1.setString(3, selectedSubject);
                                    sql1.setString(4, progra);
                                    sql1.executeUpdate();
                                }
                                
                                currentMarkIndex++;
                            }
                        }
                    }
                    
                    response.sendRedirect("index.jsp");
                }
            } catch (SQLException | ClassNotFoundException e) {
                // Handle the exception
out.println("ERROR:"+e.getMessage());
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
        return "Short description";
    }
}
