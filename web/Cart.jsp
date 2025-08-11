<%-- 
    Document   : Cart
    Created on : Aug 11, 2025, 6:49:21 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="project.Book"%>

<!DOCTYPE html>
<html>
<head>
    <title>Cart</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f8ff; /* Light blue background */
            color: #333; /* Dark text color */
        }
        table {
            width: 80%;
            margin: auto;
            border-collapse: collapse;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        th, td {
            padding: 10px;
            border: 1px solid #ccc;
            text-align: center;
        }
        th {
            background-color: #007bff; /* Blue header */
            color: white; /* White text for header */
        }
        tr:nth-child(even) {
            background-color: #f2f2f2; /* Light gray for even rows */
        }
        tr:hover {
            background-color: #ffcccc; /* Light red on hover */
        }
        h1 {
            text-align: center;
            color: #d9534f; /* Red title */
        }
        .total {
            font-weight: bold;
            background-color: #007bff; /* Blue total row */
            color: white; /* White text for total */
        }
        .empty-cart {
            text-align: center;
            font-size: 1.2em;
            color: #d9534f; /* Red text for empty cart message */
        }
    </style>
</head>
<body>
    <h1>Cart</h1>
    <%
        List<Book> cart = (List<Book>) session.getAttribute("cart");
        if (cart == null || cart.isEmpty()) {
    %>
        <p class="empty-cart">cart is empty.</p>
    <%
        } else {
            double total = 0;
    %>
        <table>
            <tr>
                <th>Title</th>
                <th>Author</th>
                <th>Price</th>
            </tr>
            <%
                for (Book book : cart) {
                    total += book.getPrice();
            %>
                <tr>
                    <td><%= book.getTitle() %></td>
                    <td><%= book.getAuthor() %></td>
                    <td>$<%= book.getPrice() %></td>
                </tr>
            <% } %>
            <tr>
                <td colspan="2" class="total">Total</td>
                <td class="total">$<%= total %></td>
            </tr>
        </table>
    <% } %>
</body>
</html>