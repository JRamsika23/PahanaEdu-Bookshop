/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package project;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "PaymentServlet", urlPatterns = {"/PaymentServlet"})
public class PaymentServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Retrieve payment details from the request
        String cardNumber = request.getParameter("cardNumber");
        String cardName = request.getParameter("cardName");
        String expiry = request.getParameter("expiry");
        String cvv = request.getParameter("cvv");

        // Here you would typically validate the payment details and process the payment
        // For demonstration purposes, we'll just print the details to the console
        System.out.println("Processing payment...");
        System.out.println("Card Number: " + cardNumber);
        System.out.println("Card Holder Name: " + cardName);
        System.out.println("Expiry Date: " + expiry);
        System.out.println("CVV: " + cvv);

        // Simulate payment processing (you would replace this with actual payment logic)
        boolean paymentSuccessful = true; // Assume payment is successful for this example

        if (paymentSuccessful) {
            // Redirect to Thank You page
            response.sendRedirect("ThankYou.jsp");
        } else {
            // Handle payment failure (e.g., show an error message)
            response.sendRedirect("Payment.jsp?error=Payment failed. Please try again.");
        }
    }
}

