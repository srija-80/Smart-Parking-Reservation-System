<%-- 
    Document   : slots
    Created on : 6 Aug, 2026, 12:22:53 PM
    Author     : S.Srija
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Parking Slots</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <div class="container-fluid mt-4">
            <h2 class="text-center mb-4">🚗 Parking Slots</h2>
            <input type="text" id="searchBox" class="form-control mb-4" placeholder="Search Slot..." onkeyup="searchSlot()">
            <div class="row text-center" id="slotContainer">
            </div>
        </div>
        <script src="slots.js"></script>
    </body>
</html>