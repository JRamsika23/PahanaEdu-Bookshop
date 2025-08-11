/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package project;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author user
 */
@WebServlet(name = "EditUser", urlPatterns = {"/EditUser"})
public class EditUser extends HttpServlet {

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        int userId = Integer.parseInt(request.getParameter("id"));
        UserDAO userDAO = new UserDAO();
        User user = null;
      try {
          user = userDAO.getUserById(userId);
      } catch (Exception ex) {
          Logger.getLogger(EditUser.class.getName()).log(Level.SEVERE, null, ex);
      }
        
        request.setAttribute("user", user);
        request.getRequestDispatcher("/EditUser.jsp").forward(request, response);
    }
  
  @Override
      protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        int id = Integer.parseInt(request.getParameter("id"));
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String role = request.getParameter("role");
        
        User user = new User(id, username, email, password, role);
        UserDAO userDAO = new UserDAO();
        
      try {
          if(userDAO.updateUser(user)) {
              request.getSession().setAttribute("message", "User updated successfully!");
          } else {
              request.getSession().setAttribute("error", "Failed to update user");
          }
      } catch (Exception ex) {
          Logger.getLogger(EditUser.class.getName()).log(Level.SEVERE, null, ex);
      }
        
        response.sendRedirect("ViewUser");
    }
}
