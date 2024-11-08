<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.ServletException" %>
<%@ page import="jakarta.servlet.http.HttpServletRequest" %>
<%@ page import="jakarta.servlet.http.HttpServletResponse" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search Buses</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<%
        // Get the current session
        HttpSession s = request.getSession(false);
        
        // Retrieve the name and mobile number from the session
        String name = (String) s.getAttribute("name");
        String mobile = (String) s.getAttribute("mobile");
        

        // Display the name and mobile number
        if (name != null && mobile != null) {
            out.print("<h1>Welcome, " + name + "!</h1>");
           /*  out.print("<p>Your mobile number: " + mobile + "</p>"); */
        } else {
            out.print("<h1>Session expired or no data available.</h1>");
        }
    %>
 <div class="form-container">
        <div class="card">
            <h2>Search Buses</h2>  
<form action="BusList" method="post">
    <label for="start">Starting Place:</label>
    <select name="start" id="start">
        <option value="Bengaluru">Bengaluru</option>
        <option value="Karwar">Karwar</option>
        <option value="Hyderbad">Hyderbad</option>
    </select><br>
    
    <label for="destination">Destination:</label>
    <select name="destination" id="destination">
        <option value="Karwar">Karwar</option>
        <option value="Bengaluru">Bengaluru</option>
        <option value="Hyderbad">Hyderbad</option>
    </select><br>

    <label for="date">Travel Date:</label>
    <input type="date" name="date" required><br>

    <button type="submit">Check Availability</button>
</form>
  </div>
    </div>
 <c:if test="${not empty errorMessage}">
        <p style="color: red;"><strong>${errorMessage}</strong></p>
    </c:if>

</body>
</html>