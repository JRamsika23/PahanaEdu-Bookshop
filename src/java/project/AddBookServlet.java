/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package project;

import java.sql.Connection;
import java.io.IOException;
import java.sql.PreparedStatement;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author user
 */
@WebServlet(name = "AddBookServlet", urlPatterns = {"/AddBook"})
public class AddBookServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

        String title = request.getParameter("title");
        String author = request.getParameter("author");
        double price = Double.parseDouble(request.getParameter("price"));
        String imageUrl = request.getParameter("imageUrl");
        // Create a new Book object
        Book book = new Book(title, author, price, imageUrl);
        // Use DBUtil to get a connection and insert the book into the database
        try (Connection connection = (Connection) DBUtil.getConnection()) { // Use the correct Connection class
            String sql = "INSERT INTO Books (title, author, price, image_url) VALUES (?, ?, ?, ?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, book.getTitle());
            statement.setString(2, book.getAuthor());
            statement.setDouble(3, book.getPrice());
            statement.setString(4, book.getImageUrl());
            statement.executeUpdate();
        } catch (Exception e) {
        }
        // Redirect back to AdminHome.jsp with a success message
        response.sendRedirect("AddBook.jsp? message=Book added successfully!");
    }

}

