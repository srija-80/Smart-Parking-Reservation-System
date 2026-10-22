/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/CancelBookingServlet")
public class CancelBookingServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request,
                     HttpServletResponse response)
        throws ServletException, IOException {

    String id = request.getParameter("id");

    HttpSession session = request.getSession(false);
    String email = (session == null)
            ? null
            : (String) session.getAttribute("userEmail");

    if (id == null || id.trim().isEmpty()
            || email == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");

        try (Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/parking_system",
                "root",
                "")) {

            String sql = "UPDATE bookings "
                    + "SET status = 'CANCELLED' "
                    + "WHERE id = ? AND email = ? "
                    + "AND status = 'CONFIRMED'";

            try (PreparedStatement ps = con.prepareStatement(sql)) {
                ps.setInt(1, Integer.parseInt(id));
                ps.setString(2, email);

                ps.executeUpdate();
            }
        }

        response.sendRedirect("booking-history.jsp");

    } catch (NumberFormatException e) {
        response.sendRedirect("booking-history.jsp");

    } catch (Exception e) {
        e.printStackTrace();
        response.getWriter().println(
                "Error cancelling booking: " + e.getMessage());
    }
}
}