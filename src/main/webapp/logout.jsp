<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
    session.invalidate(); // Destroys session data
    response.sendRedirect("index.jsp"); // Redirect back to index.jsp
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Logoutpage</title>
</head>
<body>

</body>
</html>