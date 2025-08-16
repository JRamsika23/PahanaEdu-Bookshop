<%-- 
    Document   : Payment
    Created on : Aug 15, 2025, 10:09:42 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Payment</title>
    <style>
        body { 
            font-family: Arial, sans-serif; 
            background-color:#f0f8ff; 
            text-align:center; 
        }
        .container {
            margin: 50px auto;
            background: white;
            border-radius: 8px;
            padding: 30px;
            max-width: 400px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
        input[type="text"] {
            width:100%;
            padding:10px;
            margin-bottom:12px;
            border:1px solid #ccc;
            border-radius:5px;
        }
        .pay-btn {
            background:#007bff;
            color:white;
            border:none;
            padding:10px 18px;
            border-radius:5px;
            cursor:pointer;
        }
        .pay-btn:hover { background:#0056b3; }
    </style>
</head>
<body>
<div class="container">
    <h2>Payment Details</h2>
    <form action="ThankYou.jsp" method="post">
        <input type="text" name="cardNumber" placeholder="Card Number" required>
        <input type="text" name="cardName"   placeholder="Card Holder Name" required>
        <input type="text" name="expiry"     placeholder="MM/YY" required>
        <input type="text" name="cvv"        placeholder="CVV" required>
        <button type="submit" class="pay-btn">Pay Now</button>
    </form>
</div>
</body>
</html>