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
            // Basic validation (more comprehensive validation needed as per Task B)
            if (username == null || username.isEmpty() || password == null || password.isEmpty()) {
                request.setAttribute("errorMessage", "Username and password cannot be empty.");
                request.getRequestDispatcher("AddUser.jsp").forward(request, response);
                return;
            }
            
                        // Hash the password before storing (essential for security)
            String hashedPassword = PasswordHasher.hashPassword(password); // Assuming you have a PasswordHasher utility
            try (Connection conn = DBUtil.getConnection()) { // Assuming you have a DatabaseUtil
                String sql = "INSERT INTO users (username, password_hash, email, role) VALUES (?, ?, ?, ?)";
                PreparedStatement statement = conn.prepareStatement(sql);
                statement.setString(1, username);
                statement.setString(2, hashedPassword);
                statement.setString(3, email);
                statement.setString(4, role);
                int rowsAffected = statement.executeUpdate();
                if (rowsAffected > 0) {
                    response.sendRedirect("adminDashboard.jsp?message=User added successfully!");
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
    
    
    
    
    
    
    
