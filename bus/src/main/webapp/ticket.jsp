<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bus Ticket</title>
    <style>
        * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
background-image: url('bg.jpg');
    background-size: cover;
    background-repeat: no-repeat;
    background-position: center;
    font-family: Arial, sans-serif;
    background-color: white;
    height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
}

.ticket-container {
    margin: 20px;
}

.ticket-card {
    background-color: #e74c3c; /* Red background */
    border-radius: 15px;
    padding: 20px;
    width: 350px;
    text-align: center;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
}

h2 {
    color: yellow;
    margin-bottom: 20px;
}

.ticket-details {
    text-align: left;
    font-size: 16px;
}

.ticket-details p {
    margin: 10px 0;
    color: white;
}

strong {
    color: #ecf0f1; /* Light grey color for labels */
}

    </style>
</head>
<body>
<%
    // Database connection variables
    String url = "jdbc:mysql://localhost:3306/bus_booking_system";  // Adjust to your database
    String user = "root";
    String password = "SUNAD";  // Replace with your actual DB password
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    // Booking details variables
    String passenger_Name = "";
    String age = "";
    String busName = "";
    String seatNumber = "";
    String travelDate = "";
    String startingPoint = "";
    String destination = "";

    try {
        // Load the MySQL driver
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Establish connection to the database
        con = DriverManager.getConnection(url, user, password);

        // Query to retrieve booking details where id = 1 (or use a dynamic ID)
        String query = "SELECT passengerName, passengerAge, busName, seatNumber, booking_date, startCity, destinationCity FROM booking WHERE id = 1";  // Adjust for dynamic IDs
        ps = con.prepareStatement(query);

        // Execute query
        rs = ps.executeQuery();

        // Retrieve data from the ResultSet
        if (rs.next()) {
            passenger_Name = rs.getString("passengerName");
            age = rs.getString("passengerAge");
            busName = rs.getString("busName");
            seatNumber = rs.getString("seatNumber");
            travelDate = rs.getString("booking_date");
            startingPoint = rs.getString("startCity");
            destination = rs.getString("destinationCity");
        }
    } catch (SQLException | ClassNotFoundException e) {
        e.printStackTrace();
        out.println("<p>Error retrieving booking data: " + e.getMessage() + "</p>");
    } finally {
        // Close resources
        try {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
            if (con != null) con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>

<div class="ticket-container">
    <div class="ticket-card">
        <h2>Booking Confirmed</h2>
        <div class="ticket-details">
            <p><strong>Passenger Name:</strong> <%= passenger_Name %></p>
            <p><strong>Age:</strong> <%= age %></p>
            <p><strong>Bus Name:</strong> <%= busName %></p>
            <p><strong>Seat Number:</strong> <%= seatNumber %></p>
            <p><strong>Travel Date:</strong> <%= travelDate %></p>
            <p><strong>Starting Point:</strong> <%= startingPoint %></p>
            <p><strong>Destination:</strong> <%= destination %></p>
            <p>Your ticket has been successfully generated!</p>
            <p>Thank you for booking with us.</p>
            <button onclick="redirectToJSP()">Home</button>

<script>
function redirectToJSP() {
    window.location.href = 'bus-selection.jsp';
}
</script>
            
        </div>
    </div>
</div>
   

<%-- <h2>Your Ticket</h2>
<p>Thank you for booking. Your ticket details are below:</p>
<p>Bus: ${busName}</p>
<p>Seat: ${seatNumber}</p>
<p>Price: ${price}</p>
<p>Name: ${name}</p> --%>

</body>
</html>