<%-- 
    Document   : Payment
    Created on : Aug 15, 2025, 10:09:42 PM
    Author     : user
--%>

<%@page import="project.Book"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title> Payment</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    colors: {
                        primary: '#3b82f6',
                        secondary: '#6366f1',
                        dark: '#1e293b',
                        light: '#f8fafc',
                    }
                }
            }
        }
    </script>
    <style>
        body {
            background-color: #f1f5f9;
        }
        .payment-card {
            transition: all 0.3s ease;
            transform-style: preserve-3d;
        }
        .payment-card:hover {
            transform: translateY(-5px);
        }
        .card-input {
            transition: all 0.3s ease;
        }
        .card-input:focus {
            box-shadow: 0 0 0 2px rgba(59, 130, 246, 0.5);
        }
        .flip-card {
            perspective: 1000px;
        }
        .flip-card-inner {
            transition: transform 0.6s;
            transform-style: preserve-3d;
        }
        .flip-card:hover .flip-card-inner {
            transform: rotateY(20deg);
        }
    </style>
</head>
<body class="min-h-screen flex items-center justify-center p-4">
    <div class="max-w-4xl w-full grid grid-cols-1 md:grid-cols-2 gap-8">
        <!-- Payment Form Section -->
        <div class="bg-white rounded-xl shadow-lg p-6 md:p-8 payment-card">
            <div class="flex items-center justify-between mb-6">
                <h2 class="text-2xl font-bold text-dark">Payment Details</h2>
                <div class="flex space-x-2">
                    <div class="w-8 h-5 bg-gray-200 rounded-sm"></div>
                    <div class="w-8 h-5 bg-gray-200 rounded-sm"></div>
                    <div class="w-8 h-5 bg-gray-200 rounded-sm"></div>
                </div>
            </div>

            <form action="PaymentServlet" method="post" class="space-y-6">
                <div>
                    <label for="cardNumber" class="block text-sm font-medium text-gray-700 mb-1">Card Number</label>
                    <input type="text" id="cardNumber" name="cardNumber" 
                        placeholder="4242 4242 4242 4242"
                        class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-primary card-input"
                        required>
                    <div class="flex justify-between mt-1">
                        <span class="text-xs text-gray-500">VISA</span>
                        <span class="text-xs text-gray-500">MasterCard</span>
                        <span class="text-xs text-gray-500">AMEX</span>
                    </div>
                </div>

                <div>
                    <label for="cardName" class="block text-sm font-medium text-gray-700 mb-1">Cardholder Name</label>
                    <input type="text" id="cardName" name="cardName" 
                        placeholder="John Doe"
                        class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-primary card-input"
                        required>
                </div>

                <div class="grid grid-cols-2 gap-4">
                    <div>
                        <label for="expiry" class="block text-sm font-medium text-gray-700 mb-1">Expiry Date</label>
                        <input type="text" id="expiry" name="expiry" 
                            placeholder="MM/YY"
                            class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-primary card-input"
                            required>
                    </div>
                    <div>
                        <label for="cvv" class="block text-sm font-medium text-gray-700 mb-1">CVV</label>
                        <input type="text" id="cvv" name="cvv" 
                            placeholder="123"
                            class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-primary card-input"
                            required>
                    </div>
                </div>

                <div class="pt-4">
                    <button type="submit"
                        class="w-full bg-primary hover:bg-primary-dark text-white font-medium py-3 px-6 rounded-lg transition duration-200">
                        Pay Now
                    </button>
                </div>
            </form>
        </div>

        <!-- Order Summary Section -->
        <div class="bg-white rounded-xl shadow-lg p-6 md:p-8">
            <h2 class="text-2xl font-bold text-dark mb-6">Order Summary</h2>
            
            <div class="space-y-4">
                <%
                    List<Book> cart = (List<Book>) session.getAttribute("cart");
                    double subtotal = 0;
                    if (cart != null && !cart.isEmpty()) {
                        for (Book book : cart) {
                            subtotal += book.getPrice();
                %>
                <div class="flex justify-between py-2 border-b border-gray-100">
                    <div class="flex items-center space-x-3">
                        <img src="<%= book.getImageUrl() != null ? book.getImageUrl() : "https://placehold.co/100x150?text=Book" %>" 
                            alt="<%= book.getTitle() %>"
                            class="w-10 h-14 object-cover rounded">
                        <span><%= book.getTitle() %></span>
                    </div>
                    <span class="font-medium">$<%= String.format("%.2f", book.getPrice()) %></span>
                </div>
                <%
                        }
                    }
                %>
            </div>

            <div class="mt-6 space-y-3">
                <div class="flex justify-between">
                    <span>Subtotal</span>
                    <span>$<%= String.format("%.2f", subtotal) %></span>
                </div>
                <div class="flex justify-between">
                    <span>Shipping</span>
                    <span>Free</span>
                </div>
                <div class="flex justify-between pt-3 border-t border-gray-200">
                    <span class="font-bold">Total</span>
                    <span class="font-bold text-primary text-lg">$<%= String.format("%.2f", subtotal) %></span>
                </div>
            </div>

            <div class="mt-8">
                <a href="Cart.jsp"
                    class="inline-flex items-center justify-center w-full px-4 py-2 text-sm font-medium text-primary border border-primary rounded-lg hover:bg-primary-light transition duration-200">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mr-2" viewBox="0 0 20 20" fill="currentColor">
                        <path fill-rule="evenodd" d="M9.707 14.707a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414l4-4a1 1 0 011.414 1.414L7.414 9H15a1 1 0 110 2H7.414l2.293 2.293a1 1 0 010 1.414z" clip-rule="evenodd" />
                    </svg>
                    Back to Cart
                </a>
            </div>
        </div>
    </div>

    <script>
        document.getElementById('cardNumber').addEventListener('input', function(e) {
            this.value = this.value.replace(/\D/g, '')
                                   .replace(/(\d{4})(?=\d)/g, '$1 ');
            if (this.value.length > 19) {
                this.value = this.value.substr(0, 19);
            }
        });

        document.getElementById('expiry').addEventListener('input', function(e) {
            this.value = this.value.replace(/\D/g, '')
                                   .replace(/(\d{2})(?=\d)/g, '$1/');
            if (this.value.length > 5) {
                this.value = this.value.substr(0, 5);
            }
        });

        document.getElementById('cvv').addEventListener('input', function(e) {
            this.value = this.value.replace(/\D/g, '');
            if (this.value.length > 3) {
                this.value = this.value.substr(0, 3);
            }
        });
    </script>
</body>
</html>