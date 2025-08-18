/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package project;


import java.sql.DriverManager;
import java.sql.ResultSet;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLIntegrityConstraintViolationException;


/**
 *
 * @author user
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {
   
 @Override
 protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");  

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM users WHERE username = ? AND password_hash = ?")) {

            ps.setString(1, username);
            ps.setString(2, password); 
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                String role = rs.getString("role");
                request.getSession().setAttribute("username", username);
                request.getSession().setAttribute("role", role);

                if ("Admin".equalsIgnoreCase(role)) {
                    response.sendRedirect("AdminHome.jsp");
                } else {
                    response.sendRedirect("Home.jsp");
                }
            } else {
                out.println("<h2>Invalid username or password.</h2>");
            }
        } catch (Exception e) {
            throw new ServletException("Database error: " + e.getMessage());
        }
    }
}
