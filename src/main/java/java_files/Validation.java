package java_files;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Validation {
	public static int checkUser(String id, String pass){
		int status = 0;
		try {
			Connection con =  CreateConnection.myConnection();
			String query = "select password from userInfoTable where email=?";
			PreparedStatement stmt = con.prepareStatement(query);
            stmt.setString(1, id);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) { // If user exists
                String dbPass = rs.getString("password");
                
                if (dbPass.equals(pass)) { 
                    return 2; //Correct password
                } else { 
                    return 1; //Incorrect password
                }
            }
        } catch (ClassNotFoundException | SQLException ex) {
            ex.printStackTrace();
        }
        return status; //User not found
	}
}
