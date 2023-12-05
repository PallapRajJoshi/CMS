

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Dell
 */
@WebServlet(urlPatterns = {"/addteacher"})
public class addteacher extends HttpServlet {

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

            String selectedOption = request.getParameter("options");
            if (selectedOption != null) {
                switch (selectedOption) {
                    case "addteacher" -> {

                        HttpSession session = request.getSession(false);
                        String fname = (String) session.getAttribute("fname");
                        String uname = (String) session.getAttribute("uname");
                        String password = (String) session.getAttribute("password");
                        String phone = (String) session.getAttribute("phone");
                        String email = (String) session.getAttribute("email");
                        String cpass = (String) session.getAttribute("cpass");
                      
                        

                            if (session.getAttribute("fname") == null && session.getAttribute("uname") == null
                                    && session.getAttribute("password") == null && session.getAttribute("phone")
                                    == null && session.getAttribute("email") == null)

                          {

                                  // Get the message to be displayed in the popup
  
                              
                              
                              
                                response.sendRedirect("adminprofile.jsp");

//            PrintWriter out = response.getWriter();
                            
                            } else {
//                out.println("Full Name: " + fname);
                                out.println("<br>");
                                out.println("Username: " + uname);
                                out.println("<br>");
                                out.println("Password: " + password);
                                out.println("<br>");
                                out.println("Phone: " + phone);
                                out.println("<br>");
                                out.println("Email: " + email);
                                out.println("<br>");
                                out.println("Confirm Password: " + cpass);
                            }

                        }
                    

//                        out.println("Option 1 selected. Performing action for Option 1.");
                    case "removeteacher" ->
                        out.println("Option 2 selected. Performing action for Option 2.");
                    case "addstudent" ->
                        out.println("Option 3 selected. Performing action for Option 3.");
                    case "removestudent" ->
                        out.println("Student removed");
                    default ->
                        out.println("No option selected.");
                }
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
