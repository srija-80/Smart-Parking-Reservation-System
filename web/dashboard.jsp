<%-- 
    Document   : dashboard
    Created on : 6 Aug, 2026, 11:32:53 AM
    Author     : S.Srija
--%>
<%
    String user = (String) session.getAttribute("userEmail");

    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <title>User Dashboard</title>

        <link rel="stylesheet"
              href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="style.css">

    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top">
            <a class="navbar-brand" href="#">🚗 Smart Parking</a>
            <button class="navbar-toggler" data-toggle="collapse" data-target="#navMenu">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navMenu">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item"><a class="nav-link" href="#home">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="#actions">Actions</a></li>
                    <li class="nav-item"><a class="nav-link" href="#about">About</a></li>
                    <li class="nav-item"><a class="nav-link" href="#features">Features</a></li>
                    <li class="nav-item"><a class="nav-link" href="#contact">Contact</a></li>
                </ul>
            </div>
        </nav>
        <div class="hero" id="home">
          <h1>🚗 Smart Parking System</h1>
          <p>Welcome, <%= user %></p>
        </div>
        <div class="container" id="actions">
          <h3 class="section-title">Quick Actions</h3>
          <div class="row text-center">
            <div class="col-md-3">
              <div class="card card-box big-card p-4">
                <h4>🚗 Book Slot</h4>
                <a href="slots.jsp" class="btn btn-success mt-3">Go</a>
              </div>
            </div>
            <div class="col-md-3">
              <div class="card card-box big-card p-4">
                <h4>📋 View Bookings</h4>
                <a href="booking-history.jsp" class="btn btn-info mt-3">Go</a>
              </div>
            </div>

            <div class="col-md-3">
              <div class="card card-box big-card p-4">
                <h4>👤 Profile</h4>
                <a href="profile.jsp" class="btn btn-warning mt-3">Go</a>
              </div>
            </div>

            <div class="col-md-3">
              <div class="card card-box big-card p-4">
              <h4>🚪 Logout</h4>
              <a href="login.jsp" class="btn btn-danger mt-3">Go</a>
            </div>
            </div>
          </div>
        </div>
        <div class="container about-section" id="about">
          <h3 class="section-title">About Us</h3>
          <p class="about-text">
            The Smart Parking System is designed to simplify parking management and improve user experience.
            It allows users to check real-time slot availability, reserve parking spaces instantly,
            and manage bookings efficiently.
          </p>
          <p class="about-text">
            By reducing unnecessary searching time, the system helps minimize traffic congestion
            and promotes smarter urban mobility.
          </p>
        </div>
        <div class="container" id="features">
          <h3 class="section-title">Features</h3>
          <div class="row">
            <div class="col-md-4">
              <div class="feature-box">
                <h5>🔍 Search Slots</h5>
                <p>Quickly find available parking spaces.</p>
              </div>
            </div>
            <div class="col-md-4">
              <div class="feature-box">
                <h5>⚡ Instant Booking</h5>
                <p>Reserve your slot instantly.</p>
              </div>
            </div>
            <div class="col-md-4">
              <div class="feature-box">
                <h5>📊 Track Bookings</h5>
                <p>Manage all your reservations easily.</p>
              </div>
            </div>
          </div>
        </div>
        
        
        
        <div class="container mt-5 mb-5">

    <h3 class="section-title">Why Smart Parking?</h3>

    <div class="row text-center">

        <div class="col-md-3 mb-3">
            <div class="feature-box p-3">
                <h4>⏱️</h4>
                <h5>Save Time</h5>
                <p>Find and reserve parking without unnecessary waiting.</p>
            </div>
        </div>

        <div class="col-md-3 mb-3">
            <div class="feature-box p-3">
                <h4>🚗</h4>
                <h5>Easy Parking</h5>
                <p>Choose your preferred parking slot easily.</p>
            </div>
        </div>

        <div class="col-md-3 mb-3">
            <div class="feature-box p-3">
                <h4>📅</h4>
                <h5>Plan Ahead</h5>
                <p>Reserve your parking space before reaching the location.</p>
            </div>
        </div>

        <div class="col-md-3 mb-3">
            <div class="feature-box p-3">
                <h4>🔒</h4>
                <h5>Easy Management</h5>
                <p>View and manage all your reservations in one place.</p>
            </div>
        </div>

    </div>

</div>
        
        
        
        <div class="container" id="contact">
          <h3 class="section-title">Contact Us</h3>
          <p class="text-center">
            📧 ParkingSupport@gmail.com <br>
            📞 +91 9876543210 <br>
            📍 coimbatore
          </p>
        </div>
        <div class="footer">
          <p>© <span id="year"></span> Smart Parking System</p>
        </div>
        <script>
          document.getElementById("year").innerText = new Date().getFullYear();
        </script>
        
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>

      </body>
</html>

