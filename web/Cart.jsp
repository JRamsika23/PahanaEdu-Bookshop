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
            background-color: #f0f8ff; 
            color: #333; 
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
            background-color: #007bff; 
            color: white; 
        }
        tr:nth-child(even) {
            background-color: #f2f2f2; 
        }
        tr:hover {
            background-color: #ffcccc; 
        }
        h1 {
            text-align: center;
            color: #d9534f; 
        }
        .total {
            font-weight: bold;
            background-color: #007bff; 
            color: white; 
        }
        .empty-cart {
            text-align: center;
            font-size: 1.2em;
            color: #d9534f; 
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
            
            <!-- Payment button -->
<form action="Cart" method="get" style="text-align:center; margin-top:15px;">
    <input type="hidden" name="action" value="pay">
    <button type="submit"
            style="background-color:#d9534f; color:white; border:none;
                   padding:10px 20px; border-radius:5px; cursor:pointer;">
        Proceed to Payment
    </button>
</form>
    <% } %>
</body>
</html>