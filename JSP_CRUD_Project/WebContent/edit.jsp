<%@page import="com.bean.Student"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.bean.StudentDao"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.co{
color: red
}
</style>
<meta charset="ISO-8859-1">
<title>Edit Details</title>
</head>
<body>
<h1 align="center">Student Form</h1>
<h1 align="center"><a href="viewstudent.jsp" >View All Student Details</a></h1>
<%
String roll=request.getParameter("roll"); 
Student s=StudentDao.getData(Integer.parseInt(roll));
Connection con=StudentDao.getConnection();
PreparedStatement ps=con.prepareStatement("select * from student1 where roll=?");
ps.setInt(1, Integer.parseInt(roll));
ResultSet resultSet=ps.executeQuery();
while(resultSet.next()){
	
}

%>
<form action="editstudent.jsp" method="post">


<table align="center" >
  <tr>
    <td>Roll Number</td>
    <td><h5 class="co">*</h5></td>
    <td> <input type="text" name="roll" value="<%= s.getRoll() %>" > </td>
  </tr>


  <tr>
    <td>Student Name</td>
    <td><h5 class="co">*</h5></td>
    
    <td> <input type="text" name="name" value="<%= s.getName() %>" > </td>
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
    
    <td> <input type="email" name="email" value="<%= s.getEmail() %>" > </td>
  </tr>
    <tr>
    <td>Password</td>
    <td><h5 class="co">*</h5></td>
    
    <td> <input type="password" name="pass"  value="<%= s.getPass() %>"> </td>
  </tr>
    <tr>
    <td>Contact</td>
    <td><h5 class="co">*</h5></td>
    
    <td> <input type="text" name="contact" value="<%= s.getContact() %>"> </td>
  </tr>
    <tr>
    <td>Course</td>
    <td><h5 class="co">*</h5></td>
    
    <td> <select name="course">
    <option>Select Course</option>
      <%
      	Connection con1=StudentDao.getConnection();
      	PreparedStatement preparedStatement=con1.prepareStatement("select (name) from quali ");
      	ResultSet resultSet1=preparedStatement.executeQuery();
      	while(resultSet1.next()){%>
    	<option><%= resultSet1.getString(1) %> </option>
     <%
      }
      con.close();
      %>
      </select></td>
  </tr>
   <tr><td></td>
 <td > <input type="submit" value="Edit Student"> </td>
  
</table>

</form>
</body>
</html>