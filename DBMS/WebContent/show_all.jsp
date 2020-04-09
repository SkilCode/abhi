<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
    
   <%@ page import="java.sql.*" %>
   
<!DOCTYPE html>
<html>
<style>
input[type=button] {
  width: 21%;
  text-align: center;
  background-color: #A9A9A9;
  color: black;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}
</style>
<head>
<meta charset="ISO-8859-1">
<title>Show all</title>
</head>

<body bgcolor="grey">
            <div>
            <input type="button" onclick="window.location.href = 'index.jsp';" value="Go to home page">
            </div>

<div>                
        <font size="5">
        <table border = "1" cellspacing="0">
        <tr>
            <th colspan="10"> Student Data</th>
            </tr>
            <tr>
            <th>RollNo</th>
            <th>Name</th>
            <th>Class</th>
            <th>Gender</th>
            </tr>
            
            <%
            response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
            response.setHeader("pragma","no-cache");
            response.setHeader("Expires","0");

            if(session.getAttribute("uname") == null){
            	
            	response.sendRedirect("./login.jsp");
            }
        String url = "jdbc:mysql://localhost:3306/abhi";
        String uname = session.getAttribute("uname").toString();
        String pass = session.getAttribute("pass").toString();
        String query = "select * from student;";
        
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection(url,uname,pass);
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery(query);
        
 		while(rs.next()){
 			out.print("<tr><th>" + rs.getString(1) );
 		
 			out.print("</th><th>" + rs.getString(2));

 	        out.print("</th><th>" + rs.getString(3));

 	        out.print("</th><th>" + rs.getString(4));
 	        
 			out.print("</th></tr>");
 		}
        
        st.close();
        con.close();
        
        %>
        </table>
            </font>
            </div>
        
    </body>
</html>