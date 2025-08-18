<%-- 
    Document   : AddBook
    Created on : Aug 6, 2025, 8:40:53 AM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>Add Book</title>
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
        
        a1,a {
    color: darkblue;          
    text-decoration: none; 
    font-weight: bold;
}

a1:hover {
    color: darkred;      
    text-decoration: underline;
    cursor: pointer;
   
}

a:hover {
    color: darkred;      
    text-decoration: underline;
}



    </style>
</head>
<body>
    <div class="container">
        <h1>Add Book</h1>
        <form action="AddBook" method="post">
            <label for="title">Book Title:</label>
            <input type="text" id="title" name="title" required>

            <label for="author">Author:</label>
            <input type="text" id="author" name="author" required>

            <label for="price">Price ($):</label>
            <input type="number" id="price" name="price" step="0.01" required>

            <label for="imageUrl">Image URL:</label>
            <input type="text" id="imageUrl" name="imageUrl" required>

            <input type="submit" value="Add Book">
            
            <p><a href="ViewBook.jsp">Book List</a></p>
            <p><a1 href="AdminHome.jsp">Home page</a1></p>
        </form>
    </div>
</body>
</html>