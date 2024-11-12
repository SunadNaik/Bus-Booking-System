<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Choose Your Seat</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

 <div class="form-container">
    <div class="card">
        <h2>Select Seat</h2>
        <form action="UpdateSeat" method="post">  <!-- Sending to a Servlet -->
            <img src="unnamed.png" width="200" alt="Bus Seats Layout"><br><br>
            
            <label for="seat">Choose a Seat:</label>
            <select id="seat" name="seat">
                <option value="" disabled selected>Select Seat</option>  
                <option value="1">Seat 1</option>
                <option value="14">Seat 14</option>
                <option value="18">Seat 18</option>
                <!-- Add more seat options as necessary -->
            </select>

            <button type="submit">SUBMIT</button>
        </form>
    </div>
</div>

<!-- <form action="passenger-details.jsp" method="post">
    <label for="seat">Seat Number:</label>
    <input type="text" id="seat" name="seat" required><br>
    <input type="submit" value="Next">
</form> -->

</body>
</html>