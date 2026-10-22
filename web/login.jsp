<%-- 
    Document   : login
    Created on : 6 Aug, 2026, 11:29:49 AM
    Author     : S.Srija
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>login</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <div class="container mt-5">
            <h2 class="text-center">Login</h2>
            <form action="LoginServlet" method="post" onsubmit="return loginUser()" style="max-width:400px; margin:auto;">
                <input type="email" name="email" id="loginEmail" placeholder="Enter email" class="form-control mb-3" required>
                <input type="password" name="password" id="loginPassword" placeholder="Enter password" class="form-control mb-3" required>
                <button class="btn btn-success btn-block">Login</button>

                <p class="text-center mt-3">Don't have an account?
                    <a href="register.jsp">Register</a>
                </p>       
            </form>
        </div>
        <script src="script.js"></script>
    </body>
</html>