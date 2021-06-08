<%@page import="com.bean.StudentDao"%>
<%@page import="com.bean.Student"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:useBean id="student" class="com.bean.Student"/>
<<jsp:setProperty property="*" name="student"/>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Updated student</title>
</head>
<body>
<%
int i=StudentDao.UpdateData(student);
if(i!=0){
	out.print("Data Updated");
	response.sendRedirect("viewstudent.jsp");
}else{
	out.print("Data Not Updated");
	response.sendRedirect("viewstudent.jsp");
	
}

%>
</body>
</html>