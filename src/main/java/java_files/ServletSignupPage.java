package java_files;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/medicinesignup")
public class ServletSignupPage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public ServletSignupPage() {
        super();
        
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		String email = request.getParameter("email");
		
		String name = request.getParameter("name");
		String password = request.getParameter("pass");
		try {
			
			Connection con =  CreateConnection.myConnection();
			String query = "insert into userInfoTable values(?,?,?)";
			PreparedStatement ps = con.prepareStatement(query);
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			
				ps.setString(1, email);
				ps.setString(2, name);
				ps.setString(3, password);
			
				int var = ps.executeUpdate();
			
				if(var == 1) {
					response.sendRedirect("signupsuccess.jsp");
				}else {
					response.sendRedirect("signupfailed.jsp");
				}
			
		}catch(ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}
}
