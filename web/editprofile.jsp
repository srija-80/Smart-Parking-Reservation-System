<%-- 
    Document   : editprofile
    Created on : 10 Aug, 2026, 4:09:44 PM
    Author     : S.Srija
--%>
<%@ page import="java.sql.*" %>

<%
String userEmail = (String) session.getAttribute("userEmail");

String name = "";
String mobile = "";

try {
    Class.forName("com.mysql.cj.jdbc.Driver");

    Connection con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/parking_system", "root", ""
    );

    PreparedStatement ps = con.prepareStatement(
        "SELECT * FROM users WHERE email=?"
    );

    ps.setString(1, userEmail);

    ResultSet rs = ps.executeQuery();

    if (rs.next()) {
        name = rs.getString("name");
        mobile = rs.getString("mobile");
    }

    con.close();

} catch (Exception e) {
    e.printStackTrace();
}
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <title>Edit Profile</title>

    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    </head>

    <body>

        <div class="container mt-5">

            <h2 class="text-center mb-4">Edit Profile</h2>

            <form action="EditProfileServlet" method="post" style="max-width:400px; margin:auto;">

                <div class="form-group row">
                    <label class="col-sm-3 col-form-label">Name</label>
                    <div class="col-sm-9">
                        <input type="text" name="name" value="<%=name%>" class="form-control" required>
                    </div>
                </div>

                <div class="form-group row">
                    <label class="col-sm-3 col-form-label">Email</label>
                    <div class="col-sm-9">
                        <input type="text" name="email" value="<%=userEmail%>" class="form-control" readonly>
                    </div>
                </div>

                <div class="form-group row">
                    <label class="col-sm-3 col-form-label">Mobile</label>
                    <div class="col-sm-9">
                        <input type="text" name="mobile" value="<%=mobile%>" class="form-control" required>
                    </div>
                </div>

                <button class="btn btn-success btn-block mt-3">Update Profile</button>

            </form>

        </div>

    </body>

</html>