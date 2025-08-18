<%-- 
    Document   : register
    Created on : Aug 4, 2025, 8:16:52 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Register</title>
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
            margin-bottom: 20px;
        }

        form {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        input[type="text"],
        input[type="email"],
        input[type="password"],
        select {
            padding: 10px;
            font-size: 14px;
            border-radius: 5px;
            border: 1px solid #ccc;
            background-color: #fff;
        }

        select {
            appearance: none;
            background-image: url("data:image/svg+xml;charset=US-ASCII,%3Csvg%20width%3D%2210%22%20height%3D%227%22%20viewBox%3D%220%200%2010%207%22%20xmlns%3D%22http%3A//www.w3.org/2000/svg%22%3E%3Cpath%20d%3D%22M0%200l5%207%205-7z%22%20fill%3D%22%23333%22/%3E%3C/svg%3E");
            background-repeat: no-repeat;
            background-position: right 10px center;
            background-size: 10px 7px;
            cursor: pointer;
        }

        select:focus {
            outline: none;
            border-color: #457b9d;
        }

        button {
            background-color: #457b9d;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 25px;
            font-size: 16px;
            cursor: pointer;
        }

        button:hover {
            background-color: #1d3557;
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
        <h2>Register</h2>
        <form method="post" action="SignupServlet">
            <input type="text" name="username" placeholder="Enter your username" required>
            <input type="email" name="email" placeholder="Enter your email" required>
            <input type="password" name="password" placeholder="Enter your password" required>

          
            <select name="role" required>
                <option value="" disabled selected>Select your role</option>
                <option value="User">User</option>
                <option value="Admin">Admin</option>
            </select>

            <button type="submit">Register</button>
            <div class="link">
                <a href="index.jsp">Already have an account? Login</a>
            </div>
        </form>
    </div>
</body>
</html>