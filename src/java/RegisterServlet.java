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
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    
    private static final String URL = "jdbc:mysql://localhost:3306/parking_system";
    private static final String USER = "root";
    private static final String PASSWORD = "";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String mobile = request.getParameter("mobilenumber");
        String password = request.getParameter("password");

        try {
            // DB Connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                URL,USER,PASSWORD);

            // Insert query
            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO users(name, email, mobile, password) VALUES (?, ?, ?, ?)");
           
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, mobile);
            ps.setString(4, password);

            int i = ps.executeUpdate();

            if (i > 0) {
                
                response.setContentType("text/html");
                PrintWriter out = response.getWriter();

                out.println("<script>");
                out.println("alert('Registration Successful');");
                out.println("location='login.jsp';");
                out.println("</script>");
            } else {
                response.getWriter().println("Registration Failed");
            }

        } catch (Exception e) {
                    e.printStackTrace();
                    response.setContentType("text/html");
                    response.getWriter().println("<h3>Error: " + e.getMessage() + "</h3>");
        }
    }
}