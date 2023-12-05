/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
import java.sql.*;
import com.mysql.jdbc.Connection;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Dell
 */
@WebServlet(urlPatterns = {"/StudentAdmissionadd"})
public class StudentAdmissionadd extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, ClassNotFoundException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("Request Added");
            String recordId = request.getParameter("id");

            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/collegemanagementsystem", "root", "");
                String sql = "SELECT program FROM admission_requests WHERE admission_request_id = ?";
                PreparedStatement statement = con.prepareStatement(sql);
                statement.setInt(1, Integer.parseInt(recordId));
                ResultSet resultSet = statement.executeQuery();

                while (resultSet.next()) {
                    String program = resultSet.getString("program");
//                    out.println("Program is:" + program);

                    if (program.trim().equalsIgnoreCase("bim")) {
                        out.println("COde for bim");

                        String sql1 = "SELECT  fullname, gender, address, phone,nationality,date_of_birth, email,program FROM admission_requests  WHERE admission_request_id=?";
                        PreparedStatement statement1 = con.prepareStatement(sql1);
                        statement1.setInt(1, Integer.parseInt(recordId));

                        ResultSet resultSet1 = statement1.executeQuery();
                        while (resultSet1.next()) {

                            String name = resultSet1.getString("fullname");
                            String gender = resultSet1.getString("gender");
                            String address = resultSet1.getString("address");
                            String phone = resultSet1.getString("phone");
                            String nationality = resultSet1.getString("nationality");
                            String dob = resultSet1.getString("date_of_birth");
                            String email = resultSet1.getString("email");
                            String prog = resultSet1.getString("program");
                            if (prog.trim().equalsIgnoreCase("bim")) {

                                String sql2 = "INSERT INTO bim_students (fullname, address, phone, email, date_of_birth, nationality, gender) VALUES (?, ?, ?, ?, ?, ?, ?)";

                                PreparedStatement statement2 = con.prepareStatement(sql2);
                                statement2.setString(1, name);
                                statement2.setString(2, address);
                                statement2.setString(3, phone);
                                statement2.setString(4, email);
                                statement2.setString(5, dob);
                                statement2.setString(6, nationality);
                                statement2.setString(7, gender);

                                int res = statement2.executeUpdate();

                                if (res == 1) {
                                    String query = "DELETE FROM admission_requests WHERE admission_request_id = ?";
                                    try (PreparedStatement sdelet = con.prepareStatement(query)) {
                                     sdelet.setInt(1, Integer.parseInt(recordId));

                                        // Execute the DELETE query
                                        int rowsDeleted = sdelet.executeUpdate();
                                        if (rowsDeleted >= 1) {
                                            response.sendRedirect("admissionrequest.jsp");
                                        }
                                    }
                                }

                            }

                        }

                    }
                    //bba
                    
                    else if(program.trim().equalsIgnoreCase("bba")){
out.println("Code forr bba ");

String sql3 = "SELECT fullname, gender, address, phone, nationality, date_of_birth, email, program FROM admission_requests WHERE admission_request_id=?";
        PreparedStatement statement3 = con.prepareStatement(sql3);
        statement3.setInt(1, Integer.parseInt(recordId));
        ResultSet resultSet3 = statement3.executeQuery();

        while (resultSet3.next()) {
            String name = resultSet3.getString("fullname");
            String gender = resultSet3.getString("gender");
            String address = resultSet3.getString("address");
            String phone = resultSet3.getString("phone");
            String nationality = resultSet3.getString("nationality");
            String dob = resultSet3.getString("date_of_birth");
            String email = resultSet3.getString("email");
            String prog1=resultSet3.getString("program");
            
  if (prog1.trim().equalsIgnoreCase("bba")){
            // Insert data into bba_students table
            String sql4 = "INSERT INTO bba_students (fullname, address, phone, email, date_of_birth, nationality, gender) VALUES (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement statement4 = con.prepareStatement(sql4);
            statement4.setString(1, name);
            statement4.setString(2, address);
            statement4.setString(3, phone);
            statement4.setString(4, email);
            statement4.setString(5, dob);
            statement4.setString(6, nationality);
            statement4.setString(7, gender);

            int resBBA = statement4.executeUpdate();

            if (resBBA == 1) {
                // Data inserted successfully, now delete from admission_requests table
                String query = "DELETE FROM admission_requests WHERE admission_request_id= ?";
                try (PreparedStatement sdelet1 = con.prepareStatement(query)) {
                    sdelet1.setInt(1, Integer.parseInt(recordId));

                    // Execute the DELETE query
                    int rowsDeleted = sdelet1.executeUpdate();
                    if (rowsDeleted >= 1) {
                        response.sendRedirect("admissionrequest.jsp");



                    } }}}}

                    }
                }
            } catch (SQLException | ClassNotFoundException e) {
                out.println("Error accessing the database: " + e.getMessage());
            }

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(StudentAdmissionadd.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(StudentAdmissionadd.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(StudentAdmissionadd.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(StudentAdmissionadd.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
