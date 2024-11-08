import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.*;

@WebServlet("/SelectBus")
public class SelectBus extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public SelectBus() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        Connection con = null;
        PreparedStatement p = null;

        try {
            String m = request.getParameter("mobile");
            String n = request.getParameter("name");

            // Simple validation (you can add more complex validation as needed)
            if (m == null || n == null || m.isEmpty() || n.isEmpty()) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Mobile number and Name are required");
                return;
            }

            // Store user info in session
            HttpSession session = request.getSession(); 
            session.setAttribute("name", n);
            session.setAttribute("mobile", m);

            // Connect to the database
            Class.forName("com.mysql.cj.jdbc.Driver"); // Updated to the new driver
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bus_booking_system", "root", "SUNAD");

            // Insert user details into the database
            String sql = "INSERT INTO users (mobile_number, name) VALUES (?, ?)";
            p = con.prepareStatement(sql);
            p.setString(1, m);
            p.setString(2, n);

            int rowsAffected = p.executeUpdate();
            if (rowsAffected > 0) {
                // Redirect to bus selection page if data is inserted
                response.sendRedirect("bus-selection.jsp");
            } else {
                // Handle failure to insert user data
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to save user data");
            }
        } catch (ClassNotFoundException | SQLException e) {
            // Log the exception and handle it appropriately
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error occurred");
        } finally {
            // Close resources to avoid leaks
            try {
                if (p != null) p.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
