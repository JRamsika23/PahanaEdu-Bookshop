<%-- 
    Document   : ThankYou
    Created on : Aug 15, 2025, 10:11:56 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
<head>
    <title>Payment Successful</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f8ff;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .thank-you-container {
            background-color: white;
            border-radius: 8px;
            padding: 30px 50px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            text-align: center;
        }
        h1 {
            color: #28a745;
            margin-bottom: 15px;
        }
        p {
            color: #555;
            margin-bottom: 20px;
        }
        a {
            color: #fff;
            background-color: #007bff;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
        }
        a:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="thank-you-container">
        <h1>Thank You!</h1>
        <p>Your payment was successful.</p>
        <a href="Home.jsp">Back to Home</a>
    </div>
</body>
</html>
