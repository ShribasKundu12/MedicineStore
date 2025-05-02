package java_files;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class CreateConnection {
	
// Connection with database...
 public static Connection myConnection() throws SQLException, ClassNotFoundException{
	 final String url = "jdbc:mysql://localhost:3306/login";
	 final String user = "root";
	 final String password = "Lonalove27kundu12";
	 Class.forName("com.mysql.cj.jdbc.Driver");
	 Connection con  = DriverManager.getConnection(url,user,password); 
	 return con; 
 }
}
