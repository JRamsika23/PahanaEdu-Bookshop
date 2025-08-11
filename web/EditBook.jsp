<%-- 
    Document   : EditBook
    Created on : Aug 6, 2025, 7:53:11 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="project.BookDAO" %>
<%@ page import="project.Book" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Book</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f4f8;
            padding: 40px;
        }
        .container {
            max-width: 500px;
            margin: auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 12px;
            box-shadow: 0 0 15px rgba(0,0,0,0.2);
        }
        h1 { color: #1d3557; }
        label { display: block; margin: 10px 0 5px; }
        input[type="text"], input[type="number"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        input[type="submit"] {
            background-color: #1d3557;
            color: white;
            border: none;
            padding: 10px;
            border-radius: 5px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #457b9d;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Edit Book</h1>
        <%
            int id = Integer.parseInt(request.getParameter("id"));
            BookDAO bookDAO = new BookDAO();
            Book book = bookDAO.getBookById(id);
        %>
        <form action="EditBook" method="post">
            <input type="hidden" name="id" value="<%= book.getId() %>">
            <label for="title">Book Title:</label>
            <input type="text" id="title" name="title" value="<%= book.getTitle() %>" required>

            <label for="author">Author:</label>
            <input type="text" id="author" name="author" value="<%= book.getAuthor() %>" required>

            <label for="price">Price ($):</label>
            <input type="number" id="price" name="price" value="<%= book.getPrice() %>" step="0.01" required>

            <label for="imageUrl">Image URL:</label>
            <input type="text" id="imageUrl" name="imageUrl" value="<%= book.getImageUrl() %>" required>

            <input type="submit" value="Update Book">
        </form>
    </div>
</body>
</html>
