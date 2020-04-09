<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import ="java.sql.*" %>
    
<%
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
response.setHeader("pragma","no-cache");
response.setHeader("Expires","0");
if(request.getParameter("sub")!=null)
{
	session.setAttribute("uname", request.getParameter("uname"));
	session.setAttribute("pass", request.getParameter("pass"));
}
if(session.getAttribute("uname") == null){
	response.sendRedirect("./login.jsp");
}
%>
    <%

    if(request.getParameter("submit")!=null){
    
    String url = "jdbc:mysql://localhost:3306/abhi";
    String uname = session.getAttribute("uname").toString();
    String pass = session.getAttribute("pass").toString();
    String msg = "0";
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection(url,uname,pass);
    PreparedStatement st = con.prepareStatement("insert into student values(?,?,?,?)");
    st.setString(1,request.getParameter("id"));
    st.setString(2,request.getParameter("name"));	
    st.setString(3,request.getParameter("grade"));
    st.setString(4,request.getParameter("Sex"));
    int a=0;
    
    try{
    a = st.executeUpdate();
    }
     catch(Exception e){
    	out.print(msg = e.getMessage());
    }
    
    if(a>0){
    	
    	System.out.println("record updated");
    }
    else{
    	out.print("error");
    }
    
    st.close();
    con.close();
  
  
    if(a>0){
    	  %>
    	  <script>
    			alert("Data Submitted");
    	</script>
    	  <%
    	  }
    else {
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

input[type=submit]:hover {
  background-color: black;
}

input[type=button] {
  width: 49.5%;
  background-color: grey;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

input[type=button]:hover {
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
<title>database management system</title>
</head>
<body>
<form action="#" method="post">

<font size="15" color=grey >Database</font>

<div>
<font size="4" color=grey>Enter Unique ID </font><br>
<input type="text" name="id"><br>
<font size="4" color=grey>Enter Name </font><br>
<input type="text" name="name"><br>
<font size="4" color=grey>Enter grade </font><br>
<input type="text" name="grade"><br>
<font size="4" color=grey>Select Gender </font><br>

   <select id="Sex" name="Sex">
      <option value="M">Male</option>
      <option value="F">Female</option>
      <option value="O">Others</option>
    </select>		
<input type="submit" id="submit" value="Submit" name="submit" >
	
</form>

<input type="button" onclick="window.location.href = 'show.jsp';" value="Search Record" >
<input type="button" onclick="window.location.href = 'edit.jsp';" value="Edit Data" >
<input type="button" onclick="window.location.href = 'show_all.jsp';" value="Show All Data">
<input type="button" onclick="window.location.href = 'delete.jsp';" value="Delete Record">
<form action="logout">
<input type="submit" value= "Log Out">
</form>
</div>
</body>
</html>