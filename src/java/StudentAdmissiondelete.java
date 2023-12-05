/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import com.mysql.jdbc.Connection;
import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Dell
 */
@WebServlet(urlPatterns = {"/StudentAdmissiondelete"})
public class StudentAdmissiondelete extends HttpServlet {

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
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            
            
             String recordId = request.getParameter("id");
            try {
                Class.forName("com.mysql.jdbc.Driver");
                // Create a statement for retrieving data from the database
                try (Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/collegemanagementsystem", "root", "")) {
                    // Create a statement for retrieving data from the database

                    String query = "DELETE FROM admission_requests WHERE admission_request_id = ?";

                    try (PreparedStatement statement = con.prepareStatement(query)) {
                        statement.setInt(1, Integer.parseInt(recordId)); // Set the record ID as parameter
                        
                        // Execute the DELETE query
                        int rowsDeleted = statement.executeUpdate();
                        if(rowsDeleted==1){
                            response.sendRedirect("admissionrequest.jsp");
                        }
                        // Close the resources
                        con.close();
                    } // Set the record ID as parameter
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
        processRequest(request, response);
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
        processRequest(request, response);
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
