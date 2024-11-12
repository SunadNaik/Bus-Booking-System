

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

/**
 * Servlet implementation class UpdateSeat
 */
@WebServlet("/UpdateSeat")
public class UpdateSeat extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateSeat() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String selectedSeat = request.getParameter("seat");

        // Check if a seat was selected
        if (selectedSeat != null && !selectedSeat.isEmpty()) {
            try {
                // Establish database connection
            	Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bus_booking_system", "root", "SUNAD");

                // Update the booking table where id = 1 (modify this as needed for actual booking IDs)
                String query = "UPDATE booking SET seatNumber = ? WHERE id = 1";
                PreparedStatement ps = con.prepareStatement(query);
                ps.setString(1, selectedSeat);

                int rowsUpdated = ps.executeUpdate();

                if (rowsUpdated > 0) {
                    // Redirect to passenger details page after successful update
                    response.sendRedirect("passenger-details.jsp");
                } else {
                    // Handle error if no rows were updated
                    response.getWriter().write("Error updating seat information.");
                }

                con.close();
            } catch (Exception e) {
                e.printStackTrace();
                response.getWriter().write("Database connection error.");
            }
        } else {
            response.getWriter().write("Please select a valid seat.");
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
