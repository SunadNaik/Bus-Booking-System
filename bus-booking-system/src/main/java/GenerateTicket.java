

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.*;

/**
 * Servlet implementation class GenerateTicket
 */
@WebServlet("/GenerateTicket")
public class GenerateTicket extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GenerateTicket() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// Get the passenger details from the form
        String passengerName = request.getParameter("name");
        String passengerGender = request.getParameter("gender");
        String passengerAge = request.getParameter("age");
//        int passengerAge = Integer.parseInt(passengerAgeStr);  // Convert age to integer

        // Database connection variables
        String url = "jdbc:mysql://localhost:3306/bus_booking_system";  // Adjust based on your setup
        String user = "root";
        String password = "SUNAD";  // Replace with your actual DB password

        Connection con = null;
        PreparedStatement ps = null;

        try {
            // Load the MySQL driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish connection to the database
            con = DriverManager.getConnection(url, user, password);

            // Update the booking table with passenger details where id = 1 (or use a dynamic ID)
            String query = "UPDATE booking SET passengerName = ?, gender = ?, passengerAge = ? WHERE id = 1";  // Adjust for dynamic booking IDs
            ps = con.prepareStatement(query);
            ps.setString(1, passengerName);
            ps.setString(2, passengerGender);
            ps.setString(3, passengerAge);

            // Execute update
            int rowsUpdated = ps.executeUpdate();

            // Check if update was successful
            if (rowsUpdated > 0) {
                // Redirect to a confirmation or ticket generation page
                response.sendRedirect("ticket.jsp");  // Redirect to ticket confirmation page
            } else {
                // Handle error
                response.getWriter().write("Error updating booking. Please try again.");
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            response.getWriter().write("Database connection error: " + e.getMessage());
        } finally {
            // Close resources
            try {
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
