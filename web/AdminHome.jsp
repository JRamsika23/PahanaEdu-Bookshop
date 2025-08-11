<%-- 
    Document   : AdminHome
    Created on : Aug 6, 2025, 6:28:02 AM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #eef2f3;
            padding: 40px;
        }
        .container {
            max-width: 700px;
            margin: auto;
            padding: 40px;
            background-color: #fff;
            border-radius: 12px;
            box-shadow: 0 0 15px rgba(0,0,0,0.2);
        }
        h1 { color: #1d3557; }
        ul { list-style: none; padding: 0; }
        li {
            padding: 10px;
            margin-bottom: 8px;
            background-color: #a8dadc;
            border-radius: 8px;
        }
        a {
            text-decoration: none;
            color: #1d3557;
            font-weight: bold;
        }
        a:hover {
            color: #e63946;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Welcome, Admin: <%= session.getAttribute("username") %></h1>
        <h2>Admin Functions</h2>
        <ul>
            <li><a href="AddBook.jsp">Add Books</a></li>           
            <li><a href="ViewBook.jsp">View All Books</a></li>
            <li><a href="AddUser.jsp">Add Customers</a></li>
            <li><a href="ViewUser.jsp">View Customers</a></li>
            <li><a href="PrintBill.jsp">Print Bill</a></li>
            <li><a href="#">Generate Reports</a></li>
            <li><a href="Logout.jsp">Logout</a></li>
        </ul>
    </div>
        
          <!-- Login Success Toast - CSS Only Version -->
    <% 
        String loginSuccess = (String) session.getAttribute("loginSuccess");
        if (loginSuccess != null) {
    %>
    <div class="toast-container">
        <div class="toast"><%= loginSuccess %></div>
    </div>
    <%
        // Clear the message immediately so it doesn't show on refresh
        session.removeAttribute("loginSuccess");
        // Meta refresh to remove toast after animation completes
        out.println("<meta http-equiv=\"refresh\" content=\"3;url=AdminHome.jsp\">");
    }
    %>
    
    <% 
    // Check for logout success message
    String logoutSuccess = (String) session.getAttribute("logoutSuccess");
    if (logoutSuccess != null) {
%>
    <div class="toast-container">
        <div class="toast" style="background-color: #4CAF50;">
            <%= logoutSuccess %>
        </div>
    </div>
    <% 
        // Clear the message immediately so it doesn't show again
        session.removeAttribute("logoutSuccess");
        out.println("<meta http-equiv=\"refresh\" content=\"3;url=AdminHome.jsp\">");

    }
%>
</body>
</html>

