/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package project;

/**
 *
 * @author user
 */


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class BookDAO {
    
     // Get all books
    public List<Book> getAllBooks() {
        List<Book> books = new ArrayList<>();
        try (Connection connection = DBUtil.getConnection()) {
            String sql = "SELECT * FROM Books";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String title = resultSet.getString("title");
                String author = resultSet.getString("author");
                double price = resultSet.getDouble("price");
                String imageUrl = resultSet.getString("image_url");
                books.add(new Book(id, title, author, price, imageUrl));
            }
        } catch (Exception e) {
             e.printStackTrace();
        }
        return books;
    }
    
    
     //  Add new book
    public static void insertBook(Book book) {
        try (Connection connection = DBUtil.getConnection()) {
            String sql = "INSERT INTO Books (title, author, price, image_url) VALUES (?, ?, ?, ?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, book.getTitle());
            statement.setString(2, book.getAuthor());
            statement.setDouble(3, book.getPrice());
            statement.setString(4, book.getImageUrl());
            statement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    

    //  Delete book by ID
    public void deleteBook(int id) {
        try (Connection connection = DBUtil.getConnection()) {
            String sql = "DELETE FROM Books WHERE id = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            statement.executeUpdate();
        } catch (Exception e) {
        }
    }
    

     //  Get book by ID
    public Book getBookById(int id) {
        Book book = null;
        try (Connection connection = DBUtil.getConnection()) {
            String sql = "SELECT * FROM Books WHERE id = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                String title = resultSet.getString("title");
                String author = resultSet.getString("author");
                double price = resultSet.getDouble("price");
                String imageUrl = resultSet.getString("image_url");
                book = new Book(id, title, author, price, imageUrl);
            }
        } catch (Exception e) {
        }
        return book;
    }

    
     //  Update book details
    public void updateBook(Book book) {
        try (Connection connection = DBUtil.getConnection()) {
            String sql = "UPDATE Books SET title = ?, author = ?, price = ?, image_url = ? WHERE id = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, book.getTitle());
            statement.setString(2, book.getAuthor());
            statement.setDouble(3, book.getPrice());
            statement.setString(4, book.getImageUrl());
            statement.setInt(5, book.getId());
            statement.executeUpdate();
        } catch (Exception e) {
        }
    }
}
