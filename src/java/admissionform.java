/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Driver;
import com.mysql.jdbc.PreparedStatement;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.DriverManager;
import java.sql.SQLException;
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
@WebServlet(urlPatterns = {"/admissionform"})
public class admissionform extends HttpServlet {

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
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String fullName = request.getParameter("name");
            String dateOfBirth = request.getParameter("dob");
            String gender = request.getParameter("gender");
            String nationality = request.getParameter("nationality");
            String contactNumber = request.getParameter("contact");
            String emailAddress = request.getParameter("email");
            String permanentAddress = request.getParameter("address");
            String desiredProgram = request.getParameter("program");

            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/collegemanagementsystem", "root", "");

                String sql = "INSERT INTO admission_requests(fullname,address,phone,email,date_of_birth,nationality,program ,gender) VALUES(?,?,?,?,?,?,?,?)";
                PreparedStatement statement = (PreparedStatement) con.prepareStatement(sql);

                statement.setString(1, fullName);
                statement.setString(2, permanentAddress);
                statement.setString(3, contactNumber);
                statement.setString(4, emailAddress);
                statement.setString(5, dateOfBirth);
                statement.setString(6, nationality);
                statement.setString(7, desiredProgram);
                statement.setString(8, gender);
                 

                int i = statement.executeUpdate();

                if (i == 1) {
                    String message = "Admission Successfully!! ";
                    request.getSession().setAttribute("message", message);
                    response.sendRedirect("index.html?message=true");
                } else {
                    String message = "Admission failure!";
                    request.getSession().setAttribute("message", message);
                    response.sendRedirect("studentregister.jsp");
                }

                response.getWriter().println("Data inserted successfully");

            } catch (SQLException | ClassNotFoundException e) {
                out.println("Error: " + e.getMessage());
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
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(admissionform.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(admissionform.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(admissionform.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(admissionform.class.getName()).log(Level.SEVERE, null, ex);
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
