<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ page import="java.sql.*" %>
    <%@ page import="java.util.*" %>

<%
    // Database connection variables
    String url = "jdbc:mysql://localhost:3306/bus_booking_system";  // Adjust based on your setup
    String user = "root";
    String password = "SUNAD";  // Replace with your actual DB password
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    // Initialize a variable to store bus details
    List<Map<String, String>> busList = new ArrayList<>();

    try {
        // Load the MySQL driver
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Establish connection to the database
        con = DriverManager.getConnection(url, user, password);

        // Query to retrieve bus details
        String query = "SELECT bus_name, Timing, price FROM buses";
        ps = con.prepareStatement(query);

        // Execute the query
        rs = ps.executeQuery();

        // Loop through the result set to retrieve bus details
        while (rs.next()) {
            Map<String, String> bus = new HashMap<>();
            bus.put("busName", rs.getString("bus_name"));
            bus.put("busTiming", rs.getString("Timing"));
            bus.put("price", rs.getString("price"));
            busList.add(bus);
        }

    } catch (SQLException | ClassNotFoundException e) {
        e.printStackTrace();
        out.println("<p>Error retrieving bus data: " + e.getMessage() + "</p>");
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
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Buses Found</title>
    <!-- <link rel="stylesheet" href="style.css"> -->
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

.bus-container {
    margin: 20px;
}

.card {
    background-color: #e74c3c; /* Red background */
    border-radius: 15px;
    padding: 20px;
    width: 500px;
    text-align: center;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
}

h2 {
    color: yellow;
    margin-bottom: 20px;
}

.bus-list {
    display: flex;
    flex-direction: column;
    gap: 20px;
}

.bus-item {
    background-color: #ecf0f1; /* Light grey background */
    border-radius: 8px;
    padding: 10px;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

button {
    background-color: #2ecc71; /* Green button */
    color: white;
    border: none;
    border-radius: 5px;
    padding: 5px 10px;
    font-weight: bold;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

button:hover {
    background-color: #27ae60; /* Darker green on hover */
}

span {
    font-size: 14px;
    color: black;
}

    </style>
</head>
<body>
<form action="UpdateBooking" method="post">
    <div class="bus-container">
        <div class="card">
            <h2><%= busList.size() %> Buses found</h2>
            
            <div class="bus-list">
                <% for (Map<String, String> bus : busList) { %>
                    <div class="bus-item">
                        <span><%= bus.get("busName") %> (<%= bus.get("busTiming") %>)</span>
                        <input type="hidden" name="busName" value="<%= bus.get("busName") %>">
                        <input type="hidden" name="price" value="<%= bus.get("price") %>">
                        <button type="submit">Price: <%= bus.get("price") %></button>
                    </div>
                <% } %>
            </div>
        </div>
    </div>
</form>


<%-- <form action="choose-seats.jsp" method="post">
 <h1>Bus Details</h1>
    <table border="1">
        <tr>
            <th>Bus ID</th>
            <th>Bus Name</th>
            <th>Bus Timing</th>
            <th>Bus Price</th>
            <!-- Add other columns as needed -->
        </tr>
        <%
            ResultSet rs = (ResultSet) request.getAttribute("busDetails");
            while(rs.next()) {
        %>
        <tr>
            <td><%= rs.getString("id") %></td>
            <td><%= rs.getString("bus_name") %></td>
             <td><%= rs.getString("Timing") %></td>
            <td><input type="submit" value="<%= rs.getString("price") %>"></td>
            <!-- Add other columns as needed -->
        </tr>
        <%
            }
        %>
    </table>
    <c:forEach var="bus" items="${busList}">
        <input type="radio" name="busId" value="${bus.id}">
        ${bus.bus_name} - Available Seats: ${bus.available_seats} - Price: ${bus.price}<br>
    </c:forEach>
    <input type="submit" value="Select Bus">
</form> --%>

</body>
</html>