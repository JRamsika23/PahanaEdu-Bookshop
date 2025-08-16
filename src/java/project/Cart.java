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
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author user
 */
@WebServlet(name = "Cart", urlPatterns = {"/Cart"})
public class Cart extends HttpServlet {

       @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        String action = request.getParameter("action");

        if ("add".equals(action)) {
            int bookId = Integer.parseInt(request.getParameter("bookId"));

            List<Book> cart = (List<Book>) session.getAttribute("cart");
            if (cart == null) {
                cart = new ArrayList<>();
            }

            BookDAO bookDAO = new BookDAO();
            Book book = bookDAO.getBookById(bookId);
            if (book != null) {
                cart.add(book);
            }

            session.setAttribute("cart", cart);
            response.sendRedirect("Cart.jsp");
            return;
        } 
        // --- NEW PAYMENT ACTION -----------
        else if ("pay".equals(action)) {
            // you can add some validation here if needed (e.g. cart is empty?)

            // Redirect to a payment page
            response.sendRedirect("Payment.jsp");
            return;
        }

        response.sendRedirect("Cart.jsp");
    }
}
