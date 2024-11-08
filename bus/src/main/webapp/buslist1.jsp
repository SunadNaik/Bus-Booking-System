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
<title>Insert title here</title>
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

</body>
</html>

<!-- Display bus list -->

