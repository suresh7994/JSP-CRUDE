<%@page import="com.bean.StudentDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <jsp:useBean id="student" class="com.bean.Student"></jsp:useBean>
   <jsp:setProperty property="*" name="student"/> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
</head>
<body>
<%
	int s=StudentDao.saveData(student);
	if(s!=0){
		out.println("<h1 align='center' color: 'green'> Data Updated Successfully</h1>");
		
		request.getRequestDispatcher("addstudent.jsp").include(request, response);
	}else{
		out.println("<h1 align='center' color: 'red'> Data Updated Unsuccessfully</h1>");
		request.getRequestDispatcher("addstudent.jsp").include(request, response);
		
	}
%>
</body>
</html>