<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<style>
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
      line-height: 1.6;
      background-color: #f4f4f4;
    }
    header {
      background-color: #0074D9;
      color: white;
      padding: 20px;
      text-align: center;
    }
    main {
      padding: 20px;
      background-color: white;
      max-width: 900px;
      margin: 20px auto;
      border-radius: 8px;
      box-shadow: 0 2px 5px rgba(0,0,0,0.1);
    }
    h1, h2 {
      color: #333;
    }
    ul {
      padding-left: 20px;
    }
    form input, form textarea {
      width: 100%;
      padding: 10px;
      margin-bottom: 10px;
      border: 1px solid #ccc;
      border-radius: 5px;
    }
    form button {
      padding: 10px 20px;
      background-color: #0074D9;
      color: white;
      border: none;
      border-radius: 5px;
      cursor: pointer;
    }
    form button:hover {
      background-color: #005fa3;
    }
  </style>
<body>
	<header>
    <h1>Contact Med+</h1>
  </header>
  <main>
    <section>
      <h2>Reach Us</h2>
      <p><strong>Address:</strong> 081 Subhaspally Asansol</p>
      <p><strong>Email:</strong> contact@medplus.com</p>
      <p><strong>Phone:</strong> +91 -1234567890</p>
    </section>
    <section>
      <h2>Send a Message</h2>
      <form action="#" method="post">
        <input type="text" placeholder="Your Name" required><br>
        <input type="email" placeholder="Your Email" required><br>
        <textarea placeholder="Your Message" rows="5" required></textarea><br>
        <button type="submit">Send</button>
      </form>
    </section>
  </main>
</body>
</html>