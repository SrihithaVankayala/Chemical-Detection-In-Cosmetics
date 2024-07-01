<%@ page import="java.sql.*" %>
<%@ page import="avax.servlet.http.*"%>
<%@ page import="javax.servlet.*"%>
<% 
    String url = "jdbc:mysql://localhost:3306/login_2";
    String dbUsername = "root"; // Your DB username
    String dbPassword = ""; // Your DB password
    String driver = "com.mysql.cj.jdbc.Driver";

    String username = request.getParameter("username");
    String password = request.getParameter("password");
    Connection conn =null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    try {
        Class.forName(driver);
         conn = DriverManager.getConnection(url, dbUsername, dbPassword);
        String sql = "SELECT * FROM tusers WHERE username = ? AND password = ?";
        ps = conn.prepareStatement(sql);
        ps.setString(1, username);
        ps.setString(2, password);
        rs = ps.executeQuery();

        if (rs.next()) {
            session.setAttribute("userEmail",rs.getString("email"));
            response.sendRedirect("ing.jsp");
        } else {
            out.println("Invalid username or password");
        }
    }
     catch (Exception e) {
        e.printStackTrace();
        out.println("An error occured while processing your request.Please try again later.");
    }finally{
        try{
            if(rs!=null)
            rs.close();
            if(ps!=null)
            ps.close();
            if(conn!=null)
            conn.close();
        }catch(SQLException e){
            e.printStackTrace();
        }
    }
%>
