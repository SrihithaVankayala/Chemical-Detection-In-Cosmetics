<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>

<!DOCTYPE html>
<html>
<head>
    <title>Registration Process</title>
</head>
<body>
    <h2>Registration Process</h2>
    <%
        String url = "jdbc:mysql://localhost:3306/login_2";
        String dbUsername = "root"; // Your MySQL username
        String dbPassword = ""; // Your MySQL password

        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirm_password = request.getParameter("confirm_password");

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            // Load the JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            // Establish connection
            conn = DriverManager.getConnection(url, dbUsername, dbPassword);

            // Insert data into the Users table
            String sql = "INSERT INTO tusers (username, email, password, confirm_password) VALUES (?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, username);
            pstmt.setString(2, email);
            pstmt.setString(3, password);
            pstmt.setString(4, confirm_password);
            int row = pstmt.executeUpdate();

            if (row > 0) {
                out.println("Registration successful.<br>");
            } else {
                out.println("Registration failed.<br>");
            }
        } catch (SQLIntegrityConstraintViolationException e) {
            out.println("Error: Username already exists.<br>");
        } catch (Exception e) {
            e.printStackTrace();
            out.println("Error: " + e.getMessage() + "<br>");
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException se) {
                se.printStackTrace();
            }
        }
    %>
    <a href="login.html">SIGN IN</a>
</body>
</html>
