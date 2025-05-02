package java_files;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
//import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/medicinelogin")
public class ServletLoginPage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public ServletLoginPage() {
        super();
       
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		PrintWriter p= response.getWriter();
		String uid  = request.getParameter("id");
		String pass  = request.getParameter("pw");
		int isValid = Validation.checkUser(uid,pass);//2
		RequestDispatcher rd=null;
		try {
			String name="";
		if (isValid == 2) {
			name = fetchName(uid);

		    if (name == null || name.isEmpty()) {
		        name = "Guest"; 
		    }
			//HttpSession interface
			HttpSession session = request.getSession();//create a session
			session.setAttribute("name", name);
			rd=request.getRequestDispatcher("index.jsp");
			//response.sendRedirect("index.jsp");
		} else if (isValid == 1) {
		    rd = request.getRequestDispatcher("login.jsp");
		} else {
			
        	rd = request.getRequestDispatcher("signup.jsp");
		}
		rd.forward(request, response);
		p.close();
	}catch (ClassNotFoundException | SQLException e) {
		e.printStackTrace();
	}
	}
	public String fetchName(String uid) throws SQLException,ClassNotFoundException {
		String name ="";
		Connection con = CreateConnection.myConnection();
		String query = "select fullName from userInfoTable where email=?";
		PreparedStatement ps = con.prepareStatement(query); 
		ps.setString(1, uid);
		ResultSet rs = ps.executeQuery();
		if(rs.next()) {
			name = rs.getString("fullname");
		}
		return name;
	}
}
