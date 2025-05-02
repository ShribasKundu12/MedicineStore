<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>
</head>
<!-- CSS CODE -->
<style>
	#Main-container{
		border: 1px solid #577BC1;
		display:flex;
		justify-content:center;
		flex-direction:column;
		align-items:center;
		text-align:center;
		margin-top:100px;
		width:400px;
		height:400px;
	}
	body{
	display:flex;
	justify-content:center;
	}
	#login-text{
		text-align:center;
		margin-bottom:80px;
		font-family:Arial, Helvetica, sans-serif;
		color:#2E5077;
	}
	#i1{
		
    	padding: 10px;
    	margin: 2px 0;
    	border: none;
    	border-radius: 5px;
    	background-color: #f0f0f0;
    	font-size: 14px;
	}
	#i2{
		 width: 100%;
    	padding: 10px;
    	background-color: #8074ff;
    	border: none;
    	border-radius: 5px;
    	color: white;
    	font-size: 16px;
    	cursor: pointer;
    	margin-top: 10px;
	}
	#i2:hover{
		background-color: #655bc6;
	}
	form{
		display:flex;
		justify-content:center;
	}
	a {
    text-decoration: underline;
    color: #6c6b80;
    margin-left:5px;
	}

	a:hover {
    color:orange;
	}
	font{
		font-family:Arial, Helvetica, sans-serif;
		color:#2E5077;
		font-size:16px;
	}
	p{
		font-family:Arial, Helvetica, sans-serif;
		text-decoration: underline;
		color:#2E5077;
		cursor:pointer;
	}
	p:hover{
		color:orange;
	}

</style>
<body>
	<div id="Main-container">
	<h1 id="login-text">LOGIN</h1>
	<form action="medicinelogin" method="post">
	
	<table>
	<font size=5>
		<tr>
			<td><input id ="i1" placeholder="EMAIL" type="email" name="id" required="required"></td>
		</tr>
		<tr>
			<td><input id ="i1" placeholder="PASSWORD" type="password" name="pw" required="required"></td>
		</tr>
		<tr>
			<td colspan=2 align=center><input  id= "i2" type="submit" value="  LOGIN  "></td>
		</tr>
		</font>
	</table>
	</form>
	<p>Forgot password?</p>
	<br><br>
	<font size=4>New User? 
	<a href="signup.jsp">SignUp</a></font>
</div>
</body>
</body>
</html>