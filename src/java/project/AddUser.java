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
import java.sql.Connection;
import java.sql.PreparedStatement;
/**
 *
 * @author user
 */
@WebServlet(name = "AddUser", urlPatterns = {"/AddUser"})
public class AddUser extends HttpServlet {
    
          protected void doPost(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException {
         String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String role = request.getParameter("role");

        // Basic validation
        if (username == null || username.isEmpty() || password == null || password.isEmpty()) {
            request.setAttribute("errorMessage", "Username and password cannot be empty.");
            request.getRequestDispatcher("AddUser.jsp").forward(request, response);
            return;
        }

        try {
            // Hash password (User.setPassword will auto-hash)
            User newUser = new User(username, email, password, role);
            
            UserDAO userDAO = new UserDAO();
            boolean inserted = userDAO.insertUser(newUser);

            if (inserted) {
                response.sendRedirect("ViewUser"); // Redirect to user list
            } else {
                request.setAttribute("errorMessage", "Failed to add user.");
                request.getRequestDispatcher("AddUser.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "An error occurred: " + e.getMessage());
            request.getRequestDispatcher("AddUser.jsp").forward(request, response);
        }
    }
}
    
    
    
    
    
    
    
