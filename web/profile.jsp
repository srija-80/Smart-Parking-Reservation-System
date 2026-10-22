<%-- 
    Document   : profile
    Created on : 10 Aug, 2026, 3:12:24 PM
    Author     : S.Srija
--%>

<%@ page import="java.sql.*" %>


<%
    String userEmail = (String) session.getAttribute("userEmail");

    
    if (userEmail == null) {
    response.sendRedirect("login.jsp");
    return;
    }

    String name = "";
    String mobile = "";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/parking_system", "root", "");

        PreparedStatement ps = con.prepareStatement(
            "SELECT * FROM users WHERE email=?");

        ps.setString(1, userEmail);

        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            name = rs.getString("name");
            mobile = rs.getString("mobile");
        }

    } catch (Exception e) {
        out.println(e);
    }
%>
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