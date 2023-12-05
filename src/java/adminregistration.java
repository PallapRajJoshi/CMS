import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet(urlPatterns = {"/adminregistration"})
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024,  // Set the threshold size for storing data in memory
    maxFileSize = 1024 * 1024 * 5,    // Set the maximum file size allowed (5MB)
    maxRequestSize = 1024 * 1024 * 10  // Set the maximum request size allowed (10MB)
)
public class adminregistration extends HttpServlet {

    private static final String USERNAME_PATTERN = "^[a-zA-Z0-9_-]{3,20}$";
    private static final String PASSWORD_PATTERN = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=]).{8,}$";
    private static final String PHONE_PATTERN = "^[0-9]{10}$";
    private static final String EMAIL_PATTERN = "^[a-zA-Z0-9_+&*-]+(?:\\.[a-zA-Z0-9_+&*-]+)*@(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,7}$";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

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
        String fname = request.getParameter("fullname");
        String uname = request.getParameter("username");
        String password = request.getParameter("password");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String cpass = request.getParameter("cpass");

        boolean isUsernameValid = validateField(uname, USERNAME_PATTERN);
        boolean isPasswordValid = validateField(password, PASSWORD_PATTERN);
        boolean isPhoneValid = validateField(phone, PHONE_PATTERN);
        boolean isEmailValid = validateField(email, EMAIL_PATTERN);
        boolean passwordsMatch = password.equals(cpass);

        Part photo1 = request.getPart("photo");
        InputStream photoInputStream = photo1.getInputStream();

        // Compress the photo before storing it
        BufferedImage originalImage = ImageIO.read(photoInputStream);
        ByteArrayOutputStream compressedImageOutputStream = new ByteArrayOutputStream();
        ImageIO.write(originalImage, "jpg", compressedImageOutputStream);

        byte[] compressedImageData = compressedImageOutputStream.toByteArray();

        if (isUsernameValid && isPasswordValid && passwordsMatch && isPhoneValid && isEmailValid) {
            try {
                Class.forName("com.mysql.jdbc.Driver");
                java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost/collegemanagementsystem", "root", "");
                String sql = "INSERT INTO admin_registrations (FullName, UserName, Password, email, phone, photo) VALUES (?, ?, ?, ?, ?, ?)";
                java.sql.PreparedStatement statement = con.prepareStatement(sql);
                statement.setString(1, fname);
                statement.setString(2, uname);
                statement.setString(3, password);
                statement.setString(4, email);
                statement.setString(5, phone);
                statement.setBytes(6, compressedImageData);
                int i = statement.executeUpdate();
                if (i == 1) {
                    String message = "Admin registration successful! You now have administrative privileges.";
                    request.getSession().setAttribute("message", message);
                    response.sendRedirect("admin.jsp?message=true");
                } else {
                    String message = "Admin registration failure!";
                    request.getSession().setAttribute("message", message);
                    response.sendRedirect("adminRegister.html");
                }
                
                response.getWriter().println("Data inserted successfully");
            } catch (SQLException | ClassNotFoundException e) {
                response.getWriter().println("Error inserting data into the database: " + e.getMessage());
                
            } finally {
                if (photoInputStream != null) {
                    try{
                        photoInputStream.close();
                        
                    }catch(IOException f){
                     f.printStackTrace();
                    }
                }}}}

    private boolean validateField(String fieldValue, String pattern) {
        Pattern regex = Pattern.compile(pattern);
        Matcher matcher = regex.matcher(fieldValue);
        return matcher.matches();
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
