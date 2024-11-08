import java.io.Serializable;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class Bus implements Serializable {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String id;
    private String busName;
    private String availableSeats;
    private String price;
    
    // Constructor
    public Bus(String id, String busName, String availableSeats, String price) {
        this.id = id;
        this.busName = busName;
        this.availableSeats = availableSeats;
        this.price = price;
    }

   

	// Getters and Setters
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getBusName() {
        return busName;
    }

    public void setBusName(String busName) {
        this.busName = busName;
    }

    public String getAvailableSeats() {
        return availableSeats;
    }

    public void setAvailableSeats(String availableSeats) {
        this.availableSeats = availableSeats;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }
    public List<Bus> getBuses(){
    	ArrayList<Bus> Buses=new ArrayList<>();
    	try {
    			Class.forName("com.mysql.jdbc.Driver");
    			Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/bus_booking_system","root","SUNAD");
    			java.sql.Statement stmt= con.createStatement();
    			ResultSet rs=stmt.executeQuery("select * from buses");
    			while(rs.next()) {
    				Bus b=new Bus(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4));
    				Buses.add(b);
    			}
    			
    	}catch(Exception e) {
    		e.printStackTrace();
    	}
    	return Buses;
    }
}
