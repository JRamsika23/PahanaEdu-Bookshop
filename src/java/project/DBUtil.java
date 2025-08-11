/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package project;

/**
 *
 * @author user
 */
import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;


public class DBUtil {
    // Logger for logging messages
    private static final Logger LOGGER = Logger.getLogger(DBUtil.class.getName());

    // Private constructor to prevent direct instantiation
    // This class is meant to be used statically (DBUtil.getConnection())
    private DBUtil() {
        // No implementation needed
    }


    public static Connection getConnection() throws SQLException {
        Connection connection = null;
        try {
            // Load the MySQL JDBC driver. This only needs to happen once,
            // but it's safe to call multiple times.
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish a new connection to the database
            // IMPORTANT: Replace "shop", "root", and "" with your actual database name, username, and password.
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/shop", "root", "");

            LOGGER.log(Level.INFO, "New database connection established successfully.");

        } catch (ClassNotFoundException e) {
            LOGGER.log(Level.SEVERE, "MySQL JDBC Driver not found! Make sure the JDBC driver JAR is in your project's classpath.", e);
            // Re-throw as SQLException to indicate a connection failure
            throw new SQLException("Failed to load JDBC driver: " + e.getMessage(), e);
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error establishing database connection. Check your JDBC URL, username, and password.", e);
            throw e; // Re-throw the SQLException
        }
        return connection;
    }


    public static void closeResources(Connection connection, java.sql.Statement statement, java.sql.ResultSet resultSet) {
        if (resultSet != null) {
            try {
                resultSet.close();
            } catch (SQLException e) {
                LOGGER.log(Level.WARNING, "Error closing ResultSet", e);
            }
        }
        if (statement != null) {
            try {
                statement.close();
            } catch (SQLException e) {
                LOGGER.log(Level.WARNING, "Error closing Statement", e);
            }
        }
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException e) {
                LOGGER.log(Level.WARNING, "Error closing Connection", e);
            }
        }
    }
}
