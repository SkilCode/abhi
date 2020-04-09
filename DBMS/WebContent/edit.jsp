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
    String err = "0";
    
    Class.forName("com.mysql.jdbc.Driver"); 
    Connection con = DriverManager.getConnection(url,uname,pass);
    PreparedStatement st = con.prepareStatement("update student set name = ?, class = ?, sex = ? where rollno = ?");
    
    st.setString(4,request.getParameter("rollno"));	
    st.setString(1,request.getParameter("name"));	
    st.setString(2,request.getParameter("grade"));
    st.setString(3,request.getParameter("sex"));
    int a=0 ;
    try{
    a = st.executeUpdate();
    }
     catch(Exception e){
    	out.print(e.getMessage());
    }
    
    if(a>0){
    	
    	System.out.println("record updated");
    	
    }
    else{
    	out.print("error");
    	System.out.println("error");
    }
    
    st.close();
    con.close();
  
  if(a>0){
  %>
  <script>
		alert("Data change updated");
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
  width: 100%;
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
<title>Edit</title>

</head>
<body>

<font size = 10 color = grey> Edit Data</font><br>

<div>
<form action="#">
<font size = 4 color = grey >Roll No</font><br>
<input type = "text" name = "rollno">
<font size = 4 color = grey >Name</font><br>
<input type = "text" name = "name">
<font size = 4 color = grey >Class</font><br>
<input type = "text" name = "grade">
<font size = 4 color = grey >Gender</font><br>
<select name = "sex">
<option value = "M">Male</option>
<option value = "F">Female</option>
<option value = "O">Others</option>
</select>
<input type = "submit" name="submit">
<input type="button" onclick="window.location.href = 'index.jsp';" value="Go to home page">
 </form>
 </div>
 </body>
</html>