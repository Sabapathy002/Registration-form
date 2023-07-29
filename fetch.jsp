<%@ page import="java.sql.*" %>
<%
   // Setting up the database connection
   String driver = "com.mysql.jdbc.Driver";
   String url = "jdbc:mysql://localhost:3306/students";
   String username = "root";
   String password = "";
   Connection conn = null;
   Statement stmt = null;
   ResultSet rs = null;
   try {
      Class.forName(driver);
      conn = DriverManager.getConnection(url, username, password);
      
      // Retrieving data from the database
      stmt = conn.createStatement();
      String sql = "SELECT * FROM details";
      rs = stmt.executeQuery(sql);
      
      // Displaying data in a table
      out.println("<table>");
      out.println("<tr><th>FIRST NAME</th><th>SECOND NAME</th><th>EMAIL</th><th>GENDER</th><th>COURSE</th></th>");
      while(rs.next()) {
        
         out.println("<tr>");
         out.println("<td>" + rs.getString("f_name") + "</td>");
         out.println("<td>" + rs.getString("s_name") + "</td>");
         out.println("<td>" + rs.getString("email") + "</td>");
         out.println("<td>" + rs.getString("password") + "</td>");
         out.println("<td>" + rs.getString("gender") + "</td>");
         out.println("<td>" + rs.getString("course") + "</td>");
        

         out.println("</tr>");
      }
      out.println("</table>");
   } catch(Exception e) {
      e.printStackTrace();
   } finally {
      try {
         if(rs!=null) rs.close();
         if(stmt!=null) stmt.close();
         if(conn!=null) conn.close();
      } catch(Exception e) {
         e.printStackTrace();
      }
   }
%>