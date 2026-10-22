<%-- 
    Document   : sample
    Created on : 3 Oct, 2026, 2:34:39 PM
    Author     : S.Srija
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Profile</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="style.css">
</head>

<body>
    <div class="container mt-5">
        <h2 class="text-center">My Profile</h2>

        <form style="max-width:400px; margin:auto;">

            <div class="form-group row">
                <label class="col-sm-3 col-form-label">Name</label>
                <div class="col-sm-8">
                    <input type="text" value="<%= name %>" class="form-control" readonly>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-3 col-form-label">Email</label>
                <div class="col-sm-8">
                    <input type="email" value="<%= userEmail %>" class="form-control" readonly>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-3 col-form-label">Mobile</label>
                <div class="col-sm-8">
                    <input type="text" value="<%= mobile %>" class="form-control" readonly>
                </div>
            </div>

            <button type="button" class="btn btn-primary btn-block mb-2"
                onclick="location.href='dashboard.jsp'">
                Back
            </button>

            <button type="button" class="btn btn-warning btn-block"
                onclick="location.href='editprofile.jsp'">
                Edit Profile
            </button>

        </form>
    </div>
</body>

</html>






editprofileservlet.java



import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/EditProfileServlet")
public class EditProfileServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");

        HttpSession session = request.getSession();
// email from session
        String email = (String) session.getAttribute("userEmail");
        
        if(email == null){
            response.sendRedirect("login.jsp");
            return;
        }

        // form data
        String name = request.getParameter("name");
        String mobile = request.getParameter("mobile");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/parking_system", "root", ""
            );

            String sql = "UPDATE users SET name=?, mobile=? WHERE email=?";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, name);
            ps.setString(2, mobile);
            ps.setString(3, email);

            int i = ps.executeUpdate();

            if (i > 0) {
                PrintWriter out = response.getWriter();

                out.println("<html>");
                out.println("<body>");
                out.println("<script>");
                out.println("alert('Profile Updated Successfully');");
                out.println("window.location='profile.jsp';");
                out.println("</script>");
                out.println("</body>");
                out.println("</html>");
            } else {
                PrintWriter out = response.getWriter();
                out.println("<html><body>");
                out.println("<script>");
                out.println("alert('Update Failed');");
                out.println("window.location='editprofile.jsp';");
                out.println("</script>");
                out.println("</body></html>");
            }

            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace(); 
            PrintWriter out = response.getWriter();
            out.println("<html><body>");
            out.println("<script>");
            out.println("alert('Error occurred: " + e.getMessage() + "');");
            out.println("window.location='editprofile.jsp';");
            out.println("</script>");
            out.println("</body></html>");
        }
        System.out.println("Servlet Called");
        System.out.println("Email = " + email);
        System.out.println("Name = " + name);
        System.out.println("Mobile = " + mobile);
        
    }
}