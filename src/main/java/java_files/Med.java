package java_files;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@WebServlet("/Med")
public class Med extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public Med() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String medicineName = request.getParameter("medicineName");
		response.setContentType("application/json");
		
		PrintWriter p = response.getWriter();
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/medicine","root","Lonalove27kundu12");
			String sql = "SELECT price, stock, exp_date FROM medicine_table WHERE medicineName = ?";
			stmt = con.prepareStatement(sql);
			stmt.setString(1, medicineName);
			rs = stmt.executeQuery();
			
			if(rs.next()) {
				int price = rs.getInt("price");
				int stock = rs.getInt("stock");
				Date expDate = rs.getDate("exp_date");
				String jsonResponse = String.format("{\"price\": %d, \"stock\":%d, \"exp_date\": \"%s\"}",price,stock,expDate);
				p.print(jsonResponse);
			}else {
				String jsonResponse ="{\"price\": 0, \"stock\":0, \"exp_date\": \"\"}";
				p.print(jsonResponse);
			}
		}catch(SQLException | ClassNotFoundException e) {
			e.printStackTrace();
			p.print("{\"error\": \"An error occured while fetching medicine details.\"}");
		}
		finally {
			try
			{
				if(rs != null) rs.close();
			}catch(SQLException e) {}
			try
			{
				if(stmt != null) stmt.close();
			}catch(SQLException e) {}
			try
			{
				if(con != null) con.close();
			}catch(SQLException e) {}
		}
		p.flush();	
	}
}
