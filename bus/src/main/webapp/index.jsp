<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bus Booking App</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<div class="form-container">
        <div class="card">
            <h2>Bus Booking App</h2>
<form action="SelectBus" method="post">
    <label for="mobile">Mobile Number:</label>
    <input type="text" id="mobile" name="mobile" required><br>
    
    <label for="name">Name:</label>
    <input type="text" id="name" name="name" required><br>
    
    <button type="submit">Submit</button>
</form>
 </div>
    </div>

</body>
</html>