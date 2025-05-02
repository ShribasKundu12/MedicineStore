<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>SignUp page</title>
</head>
<style>

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: Arial, sans-serif;
}

body {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}

.container {
    background-color: white;
    padding: 30px;
    border-radius: 8px;
    border: 1px solid #8074ff;
    width: 400px;
    text-align: center;
}

h2 {
    margin-bottom: 10px;
    color:#8074ff;
}

p {
    font-size: 14px;
    color: #555;
    margin-bottom:40px;
}

.input-group {
    display: flex;
    gap: 10px;
}

input {
    width: 100%;
    padding: 10px;
    margin: 10px 0;
    border: 1px solid #ccc;
    border-radius: 5px;
    padding: 10px;
    border: none;
    border-radius: 5px;
    background-color: #f0f0f0;
    font-size: 14px;
}

.input-group input {
    width: 48%;
}

.terms {
    display: flex;
    align-items: center;
    font-size: 13px;
    margin: 10px 0;
}

.terms input {
    width: auto;
    margin-right: 5px;
}

.terms a {
    color: #8074ff;
    text-decoration: none;
}

button {
    width: 100%;
    padding: 10px;
    background-color: #8074ff;
    border: none;
    color: white;
    font-size: 16px;
    cursor: pointer;
    border-radius: 5px;
    margin-top: 10px;
}

button:hover {
    background-color: #8074ff;
}

.login-link {
    margin-top: 15px;
    font-size: 14px;
}

.login-link a {
    color: #8074ff;
    text-decoration: none;
}

</style>
<body>
	<div class="container">
        <div class="signup-box">
            <h2>SIGN UP</h2>
            <p>Please fill in this form to create an account!</p>
            <form action="medicinesignup" method="post">
                <input type="text" placeholder="FULL NAME" name ="name" required>
                <input type="email" placeholder="EMAIL" name="email" required>
                <input type="password" placeholder="PASSWORD" name="pass" required>

                <div class="terms">
                    <input type="checkbox" id="terms">
                    <label for="terms">I accept the <a href="#">Terms of Use</a> & <a href="#">Privacy Policy</a>.</label>
                </div>

                <button type="submit">SIGN UP</button>
            </form>
            <p class="login-link">Already have an account? <a href="login.jsp">Login here.</a></p>
        </div>
    </div>
</body>
</html>