<%-- 
    Document   : Home
    Created on : Aug 2, 2025, 9:31:18 PM
    Author     : user
--%>

<%@page import="java.util.List" %>
<%@page import="project.Book" %>
<%@page import="project.BookDAO" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>BookVerse - Home</title>
    <style>
        :root {
            --primary-red: #e63946;
            --primary-blue: #1d3557;
            --light-blue: #a8dadc;
            --cream-white: #f1faee;
        }
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        body {
            background-color: #f9f9f9;
            color: #333;
        }
        
        /* Header Styles */
        header {
            background-color: white;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            padding: 1rem 2rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        .logo {
            font-size: 1.8rem;
            font-weight: 700;
            color: var(--primary-blue);
        }
        
        .logo span {
            color: var(--primary-red);
        }
        
        .user-nav {
            display: flex;
            align-items: center;
            gap: 1.5rem;
        }
        
        .user-info {
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }
        
        .user-avatar {
            width: 36px;
            height: 36px;
            border-radius: 50%;
            background-color: var(--light-blue);
            display: flex;
            align-items: center;
            justify-content: center;
            color: var(--primary-blue);
            font-weight: bold;
        }
        
        /* Navigation */
        nav {
            background-color: var(--primary-blue);
            padding: 1rem 2rem;
        }
        
        .nav-links {
            display: flex;
            list-style: none;
            gap: 2rem;
        }
        
        .nav-links a {
            color: white;
            text-decoration: none;
            font-weight: 500;
            padding: 0.5rem 1rem;
            border-radius: 4px;
            transition: all 0.3s ease;
        }
        
        .nav-links a:hover {
            background-color: var(--primary-red);
        }
        
        /* Main Content */
        .dashboard {
            padding: 2rem;
        }
        
        .section-title {
            margin-bottom: 1.5rem;
            color: var(--primary-blue);
            font-size: 1.5rem;
            font-weight: 600;
        }
        
        .books-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(240px, 1fr));
            gap: 2rem;
        }
        
        .book-card {
            background-color: white;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            transition: transform 0.3s ease;
        }
        
        .book-card:hover {
            transform: translateY(-5px);
        }
        
        .book-image {
            height: 200px;
            background-color: #eee;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 1rem;
        }
        
        .book-image img {
            max-height: 100%;
            max-width: 100%;
            object-fit: contain;
        }
        
        .book-info {
            padding: 1rem;
        }
        
        .book-title {
            font-weight: 600;
            margin-bottom: 0.5rem;
            color: var(--primary-blue);
        }
        
        .book-author {
            color: #666;
            font-size: 0.9rem;
            margin-bottom: 0.5rem;
        }
        
        .book-price {
            color: var(--primary-red);
            font-weight: 700;
            font-size: 1.1rem;
        }
        
        .add-to-cart {
            background-color: var(--primary-blue);
            color: white;
            border: none;
            padding: 0.5rem 1rem;
            border-radius: 4px;
            margin-top: 0.8rem;
            cursor: pointer;
            width: 100%;
            transition: background-color 0.3s ease;
            font-size: 0.9rem;
        }
        
        .add-to-cart:hover {
            background-color: var(--primary-red);
        }
        
        /* Toast Message - CSS Only */
        .toast-container {
            position: fixed;
            bottom: 20px;
            right: 20px;
            z-index: 1000;
        }
        
        .toast {
            background-color: var(--primary-red);
            color: white;
            padding: 15px;
            border-radius: 5px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            margin-bottom: 10px;
            opacity: 0;
            animation: fadein 0.5s forwards, fadeout 0.5s 2.5s forwards;
        }
        
        @keyframes fadein {
            from {bottom: 0; opacity: 0;}
            to {bottom: 20px; opacity: 1;}
        }
        
        @keyframes fadeout {
            from {bottom: 20px; opacity: 1;}
            to {bottom: 0; opacity: 0;}
        }
    </style>
</head>
<body>
    <header>
        <div class="logo">Pahana <span>Edu</span></div>
        <div class="user-nav">
            <div class="user-info">
                <div class="user-avatar">
                    <% 
                        String username = (String) session.getAttribute("username");
                        if (username != null && !username.isEmpty()) {
                            out.print(username.charAt(0));
                        }
                    %>
                </div>
                <span><%= username != null ? username : "Guest" %></span>
            </div>
        </div>
    </header>
    
<nav>
    <ul class="nav-links">
        <li><a href="Home.jsp">Home</a></li>
        <li><a href="books.jsp">Books</a></li>
        <li><a href="Cart.jsp">Cart (0)</a></li>
        
        <% if (username != null) { %>
            <li><a href="Logout.jsp">Logout</a></li>
        <% } else { %>
             <li style="margin-left: auto;"><a href="index.jsp" class="login-btn">Login</a></li>
        <% } %>
        
         
    </ul>
</nav>
    
   <div class="dashboard">
    <h2 class="section-title">Featured Books</h2>
    <div class="books-grid">
            <%
                BookDAO bookDAO = new BookDAO();
                List<Book> books = bookDAO.getAllBooks();
                for (Book book : books) {
            %>
            <div class="book-card">
                <div class="book-image">
                    <img src="<%= book.getImageUrl() %>" alt="<%= book.getTitle() %> cover">
                </div>
                <div class="book-info">
                    <h3 class="book-title"><%= book.getTitle() %></h3>
                    <p class="book-author"><%= book.getAuthor() %></p>
                    <p class="book-price">$<%= book.getPrice() %></p>
                <form action="Cart" method="get">
                    <input type="hidden" name="action" value="add">
                    <input type="hidden" name="bookId" value="<%= book.getId() %>">
                    <button type="submit" class="add-to-cart">Add to Cart</button>
                </form>
                </div>
            </div>
        <% } %>
    </div>
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
            session.removeAttribute("loginSuccess");
            out.println("<meta http-equiv=\"refresh\" content=\"3;url=Home.jsp\">");
        %>
    <% } %>

    <% 
        String logoutSuccess = (String) session.getAttribute("logoutSuccess");
        if (logoutSuccess != null) {
    %>
        <div class="toast-container">
            <div class="toast" style="background-color: #4CAF50;"><%= logoutSuccess %></div>
        </div>
        <% 
            session.removeAttribute("logoutSuccess");
            out.println("<meta http-equiv=\"refresh\" content=\"3;url=Home.jsp\">");
        %>
    <% } %>
</body>
</html>
