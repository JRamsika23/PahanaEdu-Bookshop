<%-- 
    Document   : Cart
    Created on : Aug 11, 2025, 6:49:21 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="project.Book"%>




<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>


<!DOCTYPE html>
<html>
<head>
    <title>Cart</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f8ff; 
            color: #333; 
            margin: 0;
            padding: 20px;
        }
        h1 {
            text-align: center;
            color: #d9534f; 
            margin-bottom: 20px;
        }
        .container {
            max-width: 800px;
            margin: auto;
            background: white;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
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
        .total {
            font-weight: bold;
            background-color: #007bff; 
            color: white; 
        }
        .empty-cart {
            text-align: center;
            font-size: 1.2em;
            color: #d9534f; 
            margin-top: 20px;
        }
        .remove-btn {
            background-color: #d9534f; 
            color: white; 
            border: none; 
            padding: 5px 10px; 
            border-radius: 5px; 
            cursor: pointer; 
            transition: background-color 0.3s;
        }
        .remove-btn:hover {
            background-color: #c82333;
        }
        .proceed-btn {
            background-color: #007bff; 
            color: white; 
            border: none; 
            padding: 10px 20px; 
            border-radius: 5px; 
            cursor: pointer; 
            display: block; 
            margin: 20px auto; 
            text-align: center;
            transition: background-color 0.3s;
        }
        .proceed-btn:hover {
            background-color: #0056b3;
        }
        .home-btn {
            background-color: #6c757d; 
            color: white; 
            border: none; 
            padding: 10px 20px; 
            border-radius: 5px; 
            cursor: pointer; 
            display: block; 
            margin: 20px auto; 
            text-align: center;
            transition: background-color 0.3s;
        }
        .home-btn:hover {
            background-color: #5a6268;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Your Shopping Cart</h1>
        <%
            List<Book> cart = (List<Book>) session.getAttribute("cart");
            if (cart == null || cart.isEmpty()) {
        %>
            <p class="empty-cart">Your cart is empty.</p>
        <%
            } else {
                double total = 0;
                NumberFormat currencyFormat = NumberFormat.getCurrencyInstance(Locale.US);
        %>
            <table>
                <tr>
                    <th>Title</th>
                    <th>Author</th>
                    <th>Price</th>
                    <th>Action</th>
                </tr>
                <%
                    for (Book book : cart) {
                        total += book.getPrice();
                %>
                    <tr>
                        <td><%= book.getTitle() %></td>
                        <td><%= book.getAuthor() %></td>
                        <td><%= currencyFormat.format(book.getPrice()) %></td>
                        <td>
                            <form action="Cart" method="get" style="display:inline;">
                                <input type="hidden" name="action" value="remove">
                                <input type="hidden" name="bookId" value="<%= book.getId() %>">
                                <button type="submit" class="remove-btn">Remove</button>
                            </form>
                        </td>
                    </tr>
                <% } %>
                <tr>
                    <td colspan="2" class="total">Total</td>
                    <td class="total"><%= currencyFormat.format(total) %></td>
                    <td></td>
                </tr>
            </table>
            
            <!-- Payment button -->
            <form action="Cart" method="get" style="text-align:center;">
                <input type="hidden" name="action" value="pay">
                <button type="submit" class="proceed-btn">Proceed to Payment</button>
            </form>
        <% } %>
        
        <!-- Home button -->
        <form action="Home.jsp" method="get" style="text-align:center;">
            <button type="submit" class="home-btn">Go to Home</button>
        </form>
    </div>
</body>
</html>