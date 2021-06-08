<%@page import="com.bean.Student"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.bean.StudentDao"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
  
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student Details</title>
</head>
<body>
<h1 align="center"><a href="addstudent.jsp" >Add New Student</a></h1>
<%

List<Student> list=StudentDao.getAllData();
request.setAttribute("list", list);
%>
<table border="1" cellpadding="10" width="100%">
  <tr>
    <th>Roll Number</th>
    <th>Student Name</th>
    <th>Email</th>
    <th>Gender</th>
    <th>Password</th>
    <th>Contact</th>
    <th>Course</th>
  	<th>Edit</th>
    <th>Delete</th>
  	
  </tr>
  
	<c:forEach items="${list}" var="st" >
	
	  <tr>
	<td>${st.getRoll()}</td>
	<td>${ st.getName()}</td>
	<td>${ st.getEmail()}</td>
	<td>${ st.getGender()}</td>
	<td>${ st.getPass()}</td>
	<td>${ st.getContact()}</td>
	<td>${ st.getCourse()}</td>
	<td> <a href="edit.jsp? roll='+${st.getRoll()}+'"> edit</a></td>
	<td><a href="delete.jsp? roll='+${st.getRoll()}+'"> delete</a></td>
	</tr>
</c:forEach>
	
</table>
</body>
</html>