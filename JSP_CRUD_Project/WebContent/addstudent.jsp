<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.bean.StudentDao"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student Form</title>
<style type="text/css">
.co{
color: red;
}
.c{
align:center;
align-self: center;
align-content: center;
align-items: center;
}
</style>
</head>
<body>
<h1 align="center">Student Form</h1>
<h1 align="center"><a class="c" href="viewstudent.jsp" >View All Student Details</a></h1>
<form action="add.jsp" method="post">
<table align="center" >
  <tr>
    <td>Roll Number</td>
    <td><h5 class="co">*</h5></td>
    <td> <input type="text" name="roll"> </td>
  </tr>
  <tr>
    <td>Student Name</td>
    <td><h5 class="co">*</h5></td>
    
    <td> <input type="text" name="name"> </td>
  </tr>
  <tr>
    <td>Gender</td>
    <td><h5 class="co">*</h5></td>
    
    <td> <input type="radio" name="gender" value="male">Male  
    	 <input type="radio" name="gender" value="female">Female
    </td>
  </tr>
    <tr>
    <td>Email</td>
    <td><h5 class="co">*</h5></td>
    
    <td> <input type="email" name="email"> </td>
  </tr>
    <tr>
    <td>Password</td>
    <td><h5 class="co">*</h5></td>
    
    <td> <input type="password" name="pass"> </td>
  </tr>
    <tr>
    <td>Contact</td>
    <td><h5 class="co">*</h5></td>
    
    <td> <input type="text" name="contact"> </td>
  </tr>
    <tr>
    <td>Course</td>
    <td><h5 class="co">*</h5></td>
    
    <td> <select name="course">
    <option>Select Course</option>
      <%
      	Connection con=StudentDao.getConnection();
      	PreparedStatement preparedStatement=con.prepareStatement("select (name) from quali ");
      	ResultSet resultSet=preparedStatement.executeQuery();
      	while(resultSet.next()){%>
    	<option><%= resultSet.getString(1) %> </option>
     <%
      }
      con.close();
      %>
      </select></td>
  </tr>
   <tr><td></td>
 <td > <input type="submit" value="Register"> </td>
  
</table>

</form>
</body>
</html>