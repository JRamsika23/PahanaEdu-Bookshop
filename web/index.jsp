<%-- 
    Document   : index
    Created on : Aug 1, 2025, 10:03:41 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 40px;
        }

        .form-box {
            max-width: 400px;
            margin: auto;
            padding: 40px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0,0,0,0.2);
            border-radius: 10px;
        }

        h2 {
            text-align: center;
        }

        form {
            display: flex;
            flex-direction: column;
            gap: 10px;
        }

        input[type="text"],
        input[type="password"] {
            padding: 10px;
            font-size: 14px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        button {
            background-color: #e63946;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 25px;
            font-size: 16px;
            cursor: pointer;
        }

        button:hover {
            background-color: #d62828;
        }

        .link {
            font-size: 13px;
            text-align: center;
        }

        .link a {
            color: #1d3557;
            text-decoration: none;
        }

        .link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="form-box">
        <h2>Login</h2>
        <form method="post" action="LoginServlet">
            <input type="text" name="username" placeholder="Enter your username" required>
            <input type="password" name="password" placeholder="Enter your password" required>
            <button type="submit">Log In</button>
            <div class="link">
                
                <a href="register.jsp">Don't have an account? Register</a>
            </div>
        </form>
    </div>
</body>
</html>