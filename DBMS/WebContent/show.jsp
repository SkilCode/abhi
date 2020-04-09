<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>

 

<!DOCTYPE html>
<html>
<font size = "10" color= grey>Search Record</font>
 <div>
 <%
 response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
 response.setHeader("pragma","no-cache");
 response.setHeader("Expires","0");

 if(session.getAttribute("uname") == null){
 	
 	response.sendRedirect("./login.jsp");
 }
if(request.getParameter("submit")!= null){

 	Class.forName("com.mysql.jdbc.Driver");
 	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/abhi",session.getAttribute("uname").toString(),session.getAttribute("uname").toString());
 	Statement st = con.createStatement();
 	
 	ResultSet rs = st.executeQuery("select * from student where rollno = " + request.getParameter("id") +  ";");
 	rs.next();
 	String id,name,grade,sex;
 	id = rs.getString(1);
 	name = rs.getString(2);
 	grade = rs.getString(3);
 	sex = rs.getString(4);
 	
 	%>
 	 <font color = grey size = 4;>
 	<%
 	out.println("ID = " + id);
 	out.println("<br> Name = " + name);
 	out.println("<br> Grade =  " + grade );
 	out.println("<br> Gender = " + sex);
	
 }
 %>
 </font>
 
 </div>
<style>
input[type=submit] {
  width: 100%;
  text-align: center;
  background-color: grey;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}
input[type=button] {
  width: 100%;
  text-align: center;
  background-color: grey;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}
input[type=text], select {
  width: 100%;
  color: grey;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}

input[type=button]:hover {
  background-color: #000000;
}
input[type=submit]:hover {
  background-color: #000000;
}
div {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
}
</style>
<head>
<meta charset="ISO-8859-1">
<title>show data</title>
</head>
<body>
<div>
<form action="#">
<font size="4" color=grey>Enter Unique ID</font><br>
<input type="text" name="id"><br>
<input type="submit" name="submit" >
<input type="button" onclick="window.location.href = 'index.jsp';" value="Go to home page">
</form>

</div>
</body>
</html>