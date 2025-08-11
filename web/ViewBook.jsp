<%-- 
    Document   : ViewBook
    Created on : Aug 6, 2025, 5:48:41 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="project.Book" %>
<%@ page import="project.BookDAO" %>
<!DOCTYPE html>
<html>
<head>
    <title>View Books</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f4f8;
            padding: 40px;
        }
        .container {
            max-width: 800px;
            margin: auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 12px;
            box-shadow: 0 0 15px rgba(0,0,0,0.2);
        }
        h1 { color: #1d3557; }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #a8dadc;
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
        <h1>Book List</h1>
        <table>
            <tr>
                <th>Title</th>
                <th>Author</th>
                <th>Price</th>
                <th>Image</th>
                <th>Actions</th>
            </tr>
            <%
                // Fetch the list of books from the database
                BookDAO bookDAO = new BookDAO();
                List<Book> books = bookDAO.getAllBooks();
                for (Book book : books) {
            %>
            
            <tr>
                <td><%= book.getTitle() %></td>
                <td><%= book.getAuthor() %></td>
                <td>$<%= book.getPrice() %></td>
                <td><img src="<%= book.getImageUrl() %>" alt="<%= book.getTitle() %>" width="50"></td>
                <td>
                    <a href="EditBook.jsp?id=<%= book.getId() %>">Edit</a> | 
                    <a href="DeleteServlet?id=<%= book.getId() %>" onclick="return confirm('Are you sure you want to delete this book?');">Delete</a>
                </td>
            </tr>
            <%
                }
            %>
        </table>
        <p><a href="AddBook.jsp">Add New Book</a></p>
    </div>
</body>
</html>