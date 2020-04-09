<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
    <%
    response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
    response.setHeader("pragma","no-cache");
    response.setHeader("Expires","0");

    if(session.getAttribute("uname") == null){
    	
    	response.sendRedirect("./login.jsp");
    }
    if(request.getParameter("submit")!=null){
   	String url = "jdbc:mysql://localhost:3306/abhi";
   	
   	String uname = session.getAttribute("uname").toString();
   	String pass = session.getAttribute("pass").toString();
   	
   	Class.forName("com.mysql.jdbc.Driver");
   	Connection con = DriverManager.getConnection(url,uname,pass);
  	PreparedStatement ps = con.prepareStatement("delete from student where rollno = ?");
 	
    ps.setString(1, request.getParameter("id"));
    int a = ps.executeUpdate();
    if(a>0){
    %>
    <script>
		alert("Deleted");
</script>
    <% 
    }
    else{
    	  %>
    	    <script>
    			alert("Error");
    	</script>
    	    <% 	
    	
    }
    }
    %>
<!DOCTYPE html>
<html>
<style>
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
div {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
}
input[type=button]:hover {
  background-color: #000000;
}
input[type=button] {
  width: 100%;
  background-color: grey;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}
input[type=submit] {
  width: 100%;
  background-color: grey;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

</style>
<head>
<meta charset="ISO-8859-1">
<title>Delete</title>
</head>
<body>
<font size=10 color="grey">Delete</font>
<div>
<form>
<font size = 4 color = grey>Enter Roll No</font><br>
<input type="text" name = "id">
<input type="submit" name="submit">
<input type="button" onclick="window.location.href = 'index.jsp';" value="Go to home page"> 
</form>
</div>
</body>
</html>