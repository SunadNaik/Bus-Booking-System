<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.ResultSetMetaData" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>Bus Details</title>
</head>
<body>
    <h1>Bus Details</h1>
    <table border="1">
        <tr>
            <th>Bus ID</th>
            <th>Bus Name</th>
            <th>Bus Type</th>
            <!-- Add other columns as needed -->
        </tr>
        <%
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bus_booking_system", "root", "SUNAD");
                Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM buses");
                while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getString("id") %></td>
            <td><%= rs.getString("bus_name") %></td>
            <td><%= rs.getString("price") %></td>
            <!-- Add other columns as needed -->
        </tr>
        <%
                }
                rs.close();
                stmt.close();
                con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </table>
</body>
</html>

