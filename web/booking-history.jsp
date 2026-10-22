<%-- 
    Document   : booking-history
    Created on : 12 Aug, 2026, 11:13:54 PM
    Author     : S.Srija
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>

    <head>
        <title>Booking History</title>

        <link rel="stylesheet"
              href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <div class="container mt-5">

            <h2 class="text-center mb-4">
                📋 My Bookings
            </h2>

            <%
                // Get logged-in user's email from session
                String email = (String) session.getAttribute("userEmail");
                if (email == null) {

                    response.sendRedirect("login.jsp");

                    return;
                }

                try {
                    // Load MySQL driver
                    Class.forName("com.mysql.cj.jdbc.Driver");
                   // Connect to database
                    Connection con = DriverManager.getConnection(
                        "jdbc:mysql://localhost:3306/parking_system",
                        "root",
                        ""
                    );
                    // Get only this user's bookings
                    PreparedStatement ps = con.prepareStatement(
                        "SELECT * FROM bookings WHERE email=? ORDER BY booking_date DESC, booking_time DESC"
                    );


                    ps.setString(1, email);


                    ResultSet rs = ps.executeQuery();
            %>
            <div class="table-responsive">
                <table class="table table-bordered table-hover text-center">
                    <thead class="thead-dark">
                        <tr>

                            <th>Booking ID</th>

                            <th>Slot</th>

                            <th>Date</th>

                            <th>Start Time</th>

                            <th>Duration</th>
                            
                            <th>Status</th>

                            <th>Action</th>

                        </tr>

                    </thead>


                    <tbody>
                    <%
                        boolean hasBookings = false;


                        while (rs.next()) {

                            hasBookings = true;

                    %>
                        <tr>

                            <td>
                                <%= rs.getInt("id") %>
                            </td>

                            <td>
                                <%= rs.getString("slot") %>
                            </td>

                            <td>
                                <%= rs.getDate("booking_date") %>
                            </td>

                            <td>
                                <%= rs.getTime("booking_time") %>
                            </td>

                            <td>
                                <%= rs.getString("hours") %> Hour(s)
                            </td>
                            
                            <td>
                                <%= rs.getString("status") %>
                            </td>

                            <td>

                                 <% if ("CONFIRMED".equalsIgnoreCase(rs.getString("status"))) { %>
                                   <button class="btn btn-danger btn-sm"
                                      onclick="cancelBooking(<%= rs.getInt("id") %>)">
                                      Cancel
                                   </button>
                                 <% } else { %>
                                   <span class="text-muted">Not available</span>
                                 <% } %>
                            </td>

                        </tr>
                    <%

                        }


                        if (!hasBookings) {

                    %>
                        <tr>

                            <td colspan="7" class="text-muted">

                                No bookings found.

                            </td>

                        </tr>
                    <%
                        }
                        rs.close();
                        ps.close();
                        con.close();
                    } catch (Exception e) {

                        out.println(
                            "<tr><td colspan='7'>Error: "
                            + e.getMessage()
                            + "</td></tr>"
                        );
                    }
                    %>
                    </tbody>
                </table>
            </div>
            <div class="text-center mt-4">
                <a href="dashboard.jsp"
               class="btn btn-secondary mr-2">

                🏠 Home

                </a>

                <a href="slots.jsp"
                   class="btn btn-primary">
                    ← Book Another Slot
                </a>
            </div>
    </div>
    <script>

    function cancelBooking(id) {

        let confirmCancel =
            confirm("Are you sure you want to cancel this booking?");

        if (confirmCancel) {

            window.location.href =
                "CancelBookingServlet?id=" + id;

        }

    }

    </script>


    </body>

</html>
