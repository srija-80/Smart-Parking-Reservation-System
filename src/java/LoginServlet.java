/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

/**
 *
 * @author S.Srija
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    
    private static final String URL = "jdbc:mysql://localhost:3306/parking_system";
    private static final String USER = "root";
    private static final String PASSWORD = "";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            // DB connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                URL,USER,PASSWORD);

            // Check user
            PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM users WHERE email=? AND BINARY password=?");

            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                HttpSession session = request.getSession();
                session.setAttribute("userEmail", email);
                // Login success
                response.setContentType("text/html");
                PrintWriter out = response.getWriter();

                out.println("<script>");
                out.println("alert('Login Successful');");
                out.println("location='dashboard.jsp';");
                out.println("</script>");
            } else {
                response.setContentType("text/html");
                PrintWriter out = response.getWriter();

                out.println("<script>");
                out.println("alert('Invalid Email or Password');");
                out.println("location='login.jsp';");
                out.println("</script>");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
