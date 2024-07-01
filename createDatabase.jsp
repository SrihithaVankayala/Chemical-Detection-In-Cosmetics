<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Create Database</title>
</head>
<body>
    <h2>Create Database and Table</h2>
    <%
        String url = "jdbc:mysql://localhost:3306/";
        String dbUsername = "root"; // Your MySQL username
        String dbPassword = ""; // Your MySQL password

        Connection conn = null;
        Statement stmt = null;

        try {
            // Load the JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            // Establish connection
            conn = DriverManager.getConnection(url, dbUsername, dbPassword);
            stmt = conn.createStatement();

            // Create database
            String sql = "CREATE DATABASE IF NOT EXISTS login_2";
            stmt.executeUpdate(sql);
            out.println("Database login_2 created successfully.<br>");

           
        } catch (Exception e) {
            e.printStackTrace();
            out.println("Error: " + e.getMessage() + "<br>");
        } finally {
            try {
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException se) {
                se.printStackTrace();
            }
        }
    %>
</body>
</html>
