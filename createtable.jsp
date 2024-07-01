<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <title>Create TUsers Table</title>
</head>
<body>
    <h2>Create  TUsers Table</h2>
    <%
        String url = "jdbc:mysql://localhost:3306/login_2";
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

            // Create table SQL statement
            String sql = "CREATE TABLE tusers ("  +
                         "username VARCHAR(50) NOT NULL UNIQUE, " +
                         "email VARCHAR(50) NOT NULL, " +
                         "password VARCHAR(100) NOT NULL, " +
                         "confirm_password VARCHAR(100))";

            // Execute the statement
            stmt.executeUpdate(sql);
            out.println("Table Users created successfully.<br>");
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
