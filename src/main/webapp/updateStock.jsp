<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>

<%
    String url = "jdbc:mysql://localhost:3306/medicine?useSSL=false";
    String user = "root";
    String password = "Lonalove27kundu12";

    String medicineName = request.getParameter("prod-name");
    String qty = request.getParameter("qty");

    // Validate input
    if (medicineName == null || medicineName.trim().isEmpty() || qty == null || qty.trim().isEmpty()) {
        out.println("<h3>Error: Medicine name or quantity is missing.</h3>");
        return;
    }

    int quantityBought = Integer.parseInt(qty);

    Connection con = null;
    PreparedStatement selectStmt = null;
    PreparedStatement updateStmt = null;
    ResultSet rs = null;

    try {
        // Load MySQL Driver
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection(url, user, password);
        con.setAutoCommit(false);  // Start transaction

        // Check available stock
        String checkQuery = "SELECT stock FROM medicine_table WHERE medicineName = ?";
        selectStmt = con.prepareStatement(checkQuery);
        selectStmt.setString(1, medicineName);
        rs = selectStmt.executeQuery();

        if (rs.next()) {
            int currentStock = rs.getInt("stock");

           // out.println("Before Purchase, Stock: " + currentStock + "<br>");
            //out.println("Quantity Bought: " + quantityBought + "<br>");
			//out.println("<a href=\"index.jsp\">Home page</a>");
            if (currentStock >= quantityBought) {
                // Reduce stock
                String updateQuery = "UPDATE medicine_table SET stock = stock - ? WHERE medicineName = ?";
                updateStmt = con.prepareStatement(updateQuery);
                updateStmt.setInt(1, quantityBought);
                updateStmt.setString(2, medicineName);

                int rowsAffected = updateStmt.executeUpdate();

                if (rowsAffected > 0) {
                    con.commit(); // Commit transaction
                    request.setAttribute("status","success");
                } else {
                    con.rollback(); // Rollback if update fails
                    request.setAttribute("status","error");
                }
            } else {
                out.println("<h3>Not Enough Stock Available.</h3>");
            }
        } else {
            out.println("<h3>Product Not Found.</h3>");
        }

    } catch (Exception e) {
        out.println("<h3>Error: " + e.getMessage() + "</h3>");
    } finally {
        try {
            if (rs != null) rs.close();
            if (selectStmt != null) selectStmt.close();
            if (updateStmt != null) updateStmt.close();
            if (con != null) con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
<style>

/* General Page Styling */
body {
    font-family: 'Poppins', sans-serif;
    background: #f4f4f4;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    margin: 0;
    flex-direction: column;
    gap: 3rem;
}

/* Form Container */
.form-container {
    background: #ffffff;
    padding: 30px;
    width: 350px;
    text-align: center;
    box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
    border-radius: 10px;
}

/* Heading */
h2 {
    color: #333;
    margin-bottom: 20px;
}

/* Input Fields */
input {
    width: 100%;
    padding: 12px;
    margin: 10px 0;
    border: 1px solid #ddd;
    border-radius: 5px;
    font-size: 16px;
    transition: 0.3s ease-in-out;
}

/* Focus Effect */
input:focus {
    border-color: #3498db;
    outline: none;
    box-shadow: 0px 0px 8px rgba(52, 152, 219, 0.4);
}

/* Buttons */
.button-group {
    display: flex;
    justify-content: space-between;
    margin-top: 20px;
}

.btn {
    flex: 1;
    margin: 0 5px;
    padding: 12px;
    font-size: 16px;
    font-weight: bold;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: 0.3s;
}

/* Generate Bill Button */
.generate {
    background: #2ecc71;
    color: white;
}

.generate:hover {
    background: #27ae60;
}

/* Download Bill Button */
.download {
    background: #e74c3c;
    color: white;
}
.download:hover {
    background: #c0392b;
}
#h1-bill{
	display:none;
	color:red;
}

</style>
<input type="hidden" id="status" value=<%=request.getAttribute("status")%>>
<form action="pdf" method="post">
 <div class="form-container">
        <h2>USER INFORMATION</h2>
        <input type="text" id="fullname" placeholder="ENTER FULL NAME" name="fullname">
        <input type="text" id="add" placeholder="ENTER ADDRESS" name="add">
        <input type="text" id="contact" placeholder="ENTER CONTACT NO." name="contact">
        
        <div class="button-group">
            <button type="submit" class="btn generate" onclick="generatingBill()">GENERATE BILL</button>
        </div>
        <h1 id="h1-bill">Generating Bill...</h1>
    </div>
    </form>
    <a href="index.jsp"> Redirected to Home page</a>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">
		var status = document.getElementById("status").value;
		if(status == "success"){
			swal("Item purchased Successfully!","success");
		}else{
			swal("Failed to Purchase!","error");
		}
		var fullname = document.getElementById("ENTER YOUR FULL NAME:");
		var address = document.getElementById("ADDRESS:").value;
		var contact = document.getElementById("CONTACT INFORMATION:").value;
		function generatingBill(){
			
			
			var hOneTag = document.getElementById("h1-bill");
			if(hOneTag){
				hOneTag.style.display="block";
				setTimeout(function () {
		            hOneTag.style.display = "none";
		        }, 1000);
			}
		}
		
</script>
