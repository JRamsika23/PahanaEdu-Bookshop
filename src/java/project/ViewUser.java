/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package project;

import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.logging.Logger;
import java.util.logging.Level;
import java.util.List;




/**
 *
 * @author user
 */
@WebServlet(name = "ViewUser", urlPatterns = {"/ViewUser"})
public class ViewUser extends HttpServlet {
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        UserDAO userDAO = new UserDAO();
        List<User> users = userDAO.getAllUsers();
        
        request.setAttribute("userList", users);
        request.getRequestDispatcher("/ViewUser.jsp").forward(request, response);
    }
}
