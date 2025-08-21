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

        // Initialize cart if it doesn't exist
        List<Book> cart = (List<Book>) session.getAttribute("cart");
        if (cart == null) {
            cart = new ArrayList<>();
            session.setAttribute("cart", cart);
        }

        if (null != action) switch (action) {
            case "add":
            {
                int bookId = Integer.parseInt(request.getParameter("bookId"));
                BookDAO bookDAO = new BookDAO();
                Book book = bookDAO.getBookById(bookId);
                if (book != null) {
                    cart.add(book);
                    session.setAttribute("cartCount", cart.size()); // Update cart count
                }
                response.sendRedirect("Cart.jsp");
                return;
            }
            case "pay":
                response.sendRedirect("Payment.jsp");
                return;
            case "remove":
            {
                int bookId = Integer.parseInt(request.getParameter("bookId"));
                cart.removeIf(book -> book.getId() == bookId); // Remove the book
                session.setAttribute("cartCount", cart.size()); // Update cart count
                response.sendRedirect("Cart.jsp");
                return;
            }
            default:
                break;
        }

        // Default redirect to Cart.jsp
        response.sendRedirect("Cart.jsp");
    }
}
