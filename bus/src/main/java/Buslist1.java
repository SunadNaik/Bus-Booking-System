

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

/**
 * Servlet implementation class Buslist1
 */
@WebServlet("/Buslist1")
public class Buslist1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Buslist1() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 try {
				response.setContentType("text/html");
				String startCity = request.getParameter("start");
		        String destinationCity = request.getParameter("destination");
		        String booking_date = request.getParameter("date");
		      
		        
		        Class.forName("com.mysql.jdbc.Driver");
		    	Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/bus_booking_system","root","SUNAD");
		        
		        
		        PreparedStatement p=con.prepareStatement("INSERT INTO `booking` (`startCity`, `destinationCity`, `booking_date`) VALUES (?,?,?)");
		       
		        p.setString(1, startCity);
		        p.setString(2, destinationCity);
		        p.setString(3, booking_date);
		        p.execute();
		       
			  


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
