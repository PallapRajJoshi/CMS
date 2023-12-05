/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
import java.sql.*;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(urlPatterns = {"/Attendancesubmit"})
public class Attendancesubmit extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()){
         try {
            String[] studentIds = request.getParameterValues("studentId");
            String[] attendanceDates = new String[studentIds.length];
            String[] attendanceStatuses = new String[studentIds.length];
            String[] student_name= new String[studentIds.length];

            // Extract the date and attendance status for each student
            for (int i = 0; i < studentIds.length; i++) {
                attendanceDates[i] = request.getParameter("inputDate_" + studentIds[i]);
                attendanceStatuses[i] = request.getParameter("attendance_" + studentIds[i]);
                 student_name[i] = request.getParameter("sname_" + studentIds[i]);
                 
//                 out.println(attendanceDates[i]);
//                 out.println(attendanceStatuses[i]);
//                 out.println(student_name[i]);
                 
            }

         
           
                      Class.forName("com.mysql.jdbc.Driver");
                    Connection conn;
             conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/collegemanagementsystem", "root", "");
{
                 
                 String insertQuery = "INSERT INTO bim_students_attendance (a_student_id, attendance_date, status,name_of_student) VALUES (?, ?, ?,?)";
                // Process each student's attendance data and insert into the database
                  try (PreparedStatement preparedStatement = (PreparedStatement) conn.prepareStatement(insertQuery)) {
                    // Process each student's attendance data and insert into the database
                    for (int i = 0; i < studentIds.length; i++) {
                        preparedStatement.setString(1, studentIds[i]);
                        preparedStatement.setString(2, attendanceDates[i]);
                        preparedStatement.setString(3, attendanceStatuses[i]);
                        preparedStatement.setString(4, student_name[i]);
                 int rowsInserted = preparedStatement.executeUpdate();

                   if (rowsInserted > 0) {
                        // Data inserted successfully for the current student
                        // You can add the status message to a list or any other processing
                        System.out.println("Data inserted successfully for student ID: " + studentIds[i]);
                    } else {
                        // No data inserted for the current student
                        // You can add the status message to a list or any other processing
                        System.out.println("Failed to insert data for student ID: " + studentIds[i]);
                    }
                }
            }
        }

             

       
    } catch (SQLException | ClassNotFoundException e) {
// Handle database-related errors
                     e.getMessage();
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
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(Attendancesubmit.class.getName()).log(Level.SEVERE, null, ex);
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
            try {
                processRequest(request, response);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(Attendancesubmit.class.getName()).log(Level.SEVERE, null, ex);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Attendancesubmit.class.getName()).log(Level.SEVERE, null, ex);
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
