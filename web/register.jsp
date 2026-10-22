<%-- 
    Document   : register
    Created on : 6 Aug, 2026, 11:20:35 AM
    Author     : S.Srija
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>register</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <div class="container mt-5">
            <h2 class="text-center">Register</h2>
            <form action="RegisterServlet" method="post" onsubmit="return registerUser()" style="max-width:400px; margin:auto;">
                <input type="text" id="name" name="name" placeholder="Enter name" class="form-control mb-3" required >
                <input type="email" id="email" name="email" placeholder="Enter email" class="form-control mb-3" required >
                <input type="tel" id="mobilenumber" name="mobilenumber" placeholder="mobile number" class="form-control mb-3" required pattern="[0-9]{10}" >
                <input type="password" id="password" name="password" placeholder="Password" class="form-control mb-3" required>
                <input type="password" id="confirm" name="confirm" placeholder="Confirm  password" class="form-control mb-3"  required>
                <button class="btn btn-primary btn-block">Register</button>

                <p class="text-center mt-3">already have an account?
                    <a href="login.jsp">login</a>
                </p> 
            </form>
        </div>

        <script>
            function registerUser() {
                
                var name = document.getElementById('name').value;
                var mail = document.getElementById("email").value;
                var mobile = document.getElementById("mobilenumber").value;
                var password = document.getElementById("password").value;
                var confirm = document.getElementById("confirm").value;


                var passwordPattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[A-Za-z\d]{6,}$/;
                
                if(name === ''){
                    alert("Enter your name");
                    return false;
                }
                if(mail === ''){
                    alert("Enter your email id");
                    return false;
                }
                if(mobile === ''){
                    alert("Enter your mobile number");
                    return false;
                }
                if(password === ''){
                    alert("enter your password")
                }
                if (!passwordPattern.test(password)) {
                    alert("password must contains uppercase, lowercase, numbers and be at least 6 characters");
                    return false;
                }
                if (password !== confirm) {
                    alert("Passwords do not match");
                    return false;
                }
                if (mobile.length !== 10) {
                    alert("enter valid 10 digit mobile number");
                    return false;
                }
                
                return true;
            }
        </script>
    </body>
</html>