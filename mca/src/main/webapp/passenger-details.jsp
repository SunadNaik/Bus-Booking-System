<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search Buses</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<div class="form-container">
    <div class="card">
        <h2>Provide Passenger Details</h2>
        <form action="GenerateTicket" method="post">
            <input type="text" id="name" name="name" placeholder="Enter Passenger name" required>

            <select id="gender" name="gender" required>
                <option value="" disabled selected>Select Gender</option>
                <option value="Male">Male</option>
                <option value="Female">Female</option>
            </select>

            <input type="number" id="age" name="age" placeholder="Enter Passenger age" required min="1">

            <button type="submit">Check Availability</button>
        </form>
    </div>
</div>




<%-- <h2>Passenger Details</h2>
<form action="GenerateTicket" method="post">
    <input type="hidden" name="busId" value="${busId}">
    <input type="hidden" name="price" value="${price}">
    <label for="name">Name:</label>
    <input type="text" id="name" name="name" required><br>
    <input type="submit" value="Generate Ticket">
</form>
 --%>
</body>
</html>