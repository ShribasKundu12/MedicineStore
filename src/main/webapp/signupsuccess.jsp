<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
/* Import Google Font */
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap');
body {
    font-family: 'Poppins', sans-serif;
    background-color: #f4f4f9;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    margin: 0;
}

.container {
    text-align: center;
}

.card {
    background: white;
    padding: 30px;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    max-width: 400px;
    margin: auto;
}

h2 {
    color: #333;
}

p {
    color: #666;
    font-size: 14px;
}

.btn {
    display: inline-block;
    text-decoration: none;
    background-color: #4CAF50;
    color: white;
    padding: 12px 20px;
    border-radius: 5px;
    margin-top: 15px;
    transition: background 0.3s ease-in-out;
}

.btn:hover {
    background-color: #45a049;
}
img{
	height:60px;
}
</style>
</head>
<body>
	 <div class="container">
        <div class="card">
        	<img alt="logo" src="image/success.png">
            <h2>You have successfully Signed up!</h2>
            <p>Welcome to our platform. Click below to log in and start exploring.</p>
            <a href="login.jsp" class="btn">Go to Login</a>
        </div>
    </div>
</body>
</html>