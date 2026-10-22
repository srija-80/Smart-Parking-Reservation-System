/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/BookingServlet")
public class BookingServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");

        HttpSession session = request.getSession();

        String email = (String) session.getAttribute("userEmail");


        // CHECK LOGIN

        if (email == null) {

            response.sendRedirect("login.jsp");

            return;
        }


        // GET FORM DATA

        String slot = request.getParameter("slot");

        String date = request.getParameter("date");

        String time = request.getParameter("time");

        String hours = request.getParameter("hours");


        try {

            Class.forName("com.mysql.cj.jdbc.Driver");


            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/parking_system",
                    "root",
                    ""
            );


            /*
 * CHECK WHETHER THE SLOT HAS AN
 * OVERLAPPING ACTIVE BOOKING
 */

        PreparedStatement check = con.prepareStatement(
           "SELECT booking_time, hours FROM bookings " +
           "WHERE slot = ? " +
           "AND booking_date = ? " +
           "AND status = 'CONFIRMED'"
        );

        check.setString(1, slot);
        check.setString(2, date);

        ResultSet rs = check.executeQuery();

        java.time.LocalTime newStart =
        java.time.LocalTime.parse(time);

        int newHours = Integer.parseInt(hours);

        java.time.LocalTime newEnd = newStart.plusHours(newHours);

        boolean overlap = false;

        while (rs.next()) {

          java.time.LocalTime existingStart =
          rs.getTime("booking_time").toLocalTime();

          int existingHours = rs.getInt("hours");

          java.time.LocalTime existingEnd =
          existingStart.plusHours(existingHours);

           if (newStart.isBefore(existingEnd)
              && newEnd.isAfter(existingStart)) {

            overlap = true;
            break;
           }
        }

           PrintWriter out = response.getWriter();
            


            if (overlap)  {

                // SLOT ALREADY BOOKED

                out.println("<script>");

                out.println(
                    "alert('❌ This slot is already booked for the selected time.');"
                );

                out.println(
                    "window.location='slots.jsp';"
                );

                out.println("</script>");

            }


            else {

                // INSERT BOOKING

                PreparedStatement ps = con.prepareStatement(

                    "INSERT INTO bookings " +
                    "(email, slot, booking_date, booking_time, hours) " +
                    "VALUES (?, ?, ?, ?, ?)"

                );


                ps.setString(1, email);

                ps.setString(2, slot);

                ps.setString(3, date);

                ps.setString(4, time);

                ps.setString(5, hours);


                ps.executeUpdate();


                out.println("<script>");

                out.println(
                    "alert('✅ Booking successful!');"
                );

                out.println(
                    "window.location='booking-history.jsp';"
                );

                out.println("</script>");


                ps.close();

            }


            rs.close();

            check.close();

            con.close();


        }

        catch (Exception e) {

            e.printStackTrace();

            response.getWriter().println(
                "Error: " + e.getMessage()
            );

        }

    }

}