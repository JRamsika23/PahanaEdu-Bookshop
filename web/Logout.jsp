<%-- 
    Document   : Logout
    Created on : Aug 5, 2025, 9:47:18 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
        // Get role before session is invalidated
    String role = (String) session.getAttribute("role");
    
    
    // Set logout success message in session
    session.setAttribute("logoutSuccess", "Logout Successful!");
    
    // Invalidate the session
    session.invalidate();
    
   
   // Redirect based on role
    if ("Admin".equalsIgnoreCase(role)) {
        response.sendRedirect("index.jsp"); // Admin goes to login page
    } else {
        response.sendRedirect("Home.jsp");  // User goes to home page
    }
%>
