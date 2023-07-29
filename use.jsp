<%@ page import = "java.sql.*"%>
<%
String f_name = request.getParameter("f_name");
String s_name = request.getParameter("s_name");
String email = request.getParameter("email");
String password = request.getParameter("password");
String gender = request.getParameter("gender");
String course = request.getParameter("course");

try{
  Class.forName("com.mysql.jdbc.Driver");
  Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/students","root","");
  PreparedStatement ps = conn.prepareStatement("insert into details(f_name,s_name,email,password,gender,course) values(?,?,?,?,?,?);");
  ps.setString(1,f_name);
  ps.setString(2,s_name);
  ps.setString(3,email);
  ps.setString(4,password);
  ps.setString(5,gender);
  ps.setString(6,course);
  
  int x = ps.executeUpdate();
  if(x>0){
    out.println("Registration Successful...");
  }
  else{
    out.println("Registration Unsuccessful....");
  }

}
catch(Exception e){
  out.println(e);
}

%>