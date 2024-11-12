

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

/**
 * Servlet implementation class UpdateBooking
 */
@WebServlet("/UpdateBooking")
public class UpdateBooking extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateBooking() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		  String busName = request.getParameter("busName");
	        String price = request.getParameter("price");

	        // Assume booking ID = 1 for now
	        int bookingId = 1;  // You can get this dynamically from session or another source

	        try {
	            // Establish database connection
	        	Class.forName("com.mysql.jdbc.Driver");
	            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bus_booking_system", "root", "SUNAD");

	            // Update the booking table with bus name and price
	            String query = "UPDATE booking SET busName = ?, price = ? WHERE id = ?";
	            PreparedStatement ps = con.prepareStatement(query);
	            ps.setString(1, busName);
	            ps.setString(2, price);  // Convert price to BigDecimal
	            ps.setInt(3, bookingId);

	            int rowsUpdated = ps.executeUpdate();

	            if (rowsUpdated > 0) {
	                // Redirect to a success page or confirmation page
	                response.sendRedirect("choose-seats.jsp");
	            } else {
	                // Handle error case if no rows were updated
	                response.getWriter().write("Error updating booking");
	            }

	            con.close();
	        } catch (Exception e) {
	            e.printStackTrace();
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
