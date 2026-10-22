<%-- 
    Document   : bookslot
    Created on : 10 Aug, 2026, 6:28:09 PM
    Author     : S.Srija
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>

    <title>Book Parking Slot</title>

    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <link rel="stylesheet" href="style.css">

    <style>

        body {
            background-color: #f5f7fa;
        }

        .booking-container {
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .booking-card {
            width: 430px;
            background: white;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.15);
        }

        .slot-display {
            background-color: #e8f5e9;
            padding: 15px;
            border-radius: 10px;
            text-align: center;
            margin-bottom: 20px;
        }

        .slot-display h4 {
            margin: 0;
            color: #198754;
        }

        .booking-title {
            text-align: center;
            margin-bottom: 25px;
        }

    </style>

</head>


<body>

<div class="booking-container">

    <div class="booking-card">

        <h2 class="booking-title">
            🚗 Book Parking Slot
        </h2>


        <!-- SELECTED SLOT -->

        <div class="slot-display">

            <small>Selected Parking Slot</small>

            <h4>
                <%= request.getParameter("slot") %>
            </h4>

        </div>
        <form action="BookingServlet" method="post">
            <!-- SLOT -->
            <div class="form-group">

                <label>Parking Slot</label>

                <input type="text"
                       name="slot"
                       value="<%= request.getParameter("slot") %>"
                       class="form-control"
                       readonly>

            </div>
            <!-- DATE -->

            <div class="form-group">

                <label>Booking Date</label>

                <input type="date"
                       name="date"
                       class="form-control"
                       required>

            </div>
            <!-- TIME -->

            <div class="form-group">

                <label>Start Time</label>

                <input type="time"
                       name="time"
                       class="form-control"
                       required>

            </div>
            <!-- HOURS -->

            <div class="form-group">

                <label>Parking Duration</label>

                <select name="hours"
                        class="form-control"
                        required>

                    <option value="">Select Duration</option>

                    <option value="1">
                        1 Hour
                    </option>

                    <option value="2">
                        2 Hours
                    </option>

                    <option value="3">
                        3 Hours
                    </option>

                    <option value="4">
                        4 Hours
                    </option>

                    <option value="5">
                        5 Hours
                    </option>

                </select>

            </div>
            <!-- BUTTONS -->

            <button type="submit"
                    class="btn btn-success btn-block">

                Confirm Booking

            </button>
            <a href="slots.jsp"
               class="btn btn-secondary btn-block">

                Back to Slots

            </a>
        </form>

    </div>

</div>

</body>

</html>