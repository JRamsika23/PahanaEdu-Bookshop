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
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLIntegrityConstraintViolationException;


/**
 *
 * @author user
 */
@WebServlet(name = "SignupServlet", urlPatterns = {"/SignupServlet"})
public class SignupServlet extends HttpServlet {


   @Override
   protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

       String username = request.getParameter("username");
        String password = request.getParameter("password"); // plain text for now
        String email = request.getParameter("email");
        String role = request.getParameter("role");

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(
                "INSERT INTO users (username, password_hash, email, role) VALUES (?, ?, ?, ?)")) {

            ps.setString(1, username);
            ps.setString(2, password); // later change to hashed password
            ps.setString(3, email);
            ps.setString(4, role);

            int result = ps.executeUpdate();

            if (result > 0) {
                out.println("<h2>Registration successful for " + username + "</h2>");
                out.println("<a href='index.jsp'>Go to Login</a>");
            } else {
                out.println("<h2>Registration failed.</h2>");
            }

        } catch (SQLIntegrityConstraintViolationException e) {
            out.println("<h2>Username already exists!</h2>");
        } catch (Exception e) {
            throw new ServletException("Database error: " + e.getMessage());
        }
    }
}

    

