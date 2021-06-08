<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.bean.StudentDao"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
 <jsp:useBean id="s" class="com.bean.Student"></jsp:useBean>   
<<jsp:setProperty property="*" name="s"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
int status=0;
Connection connection;
String roll=request.getParameter("roll");
System.out.println(roll);
StudentDao.deleteData(Integer.parseInt(roll));
response.sendRedirect("viewstudent.jsp");

%>
</body>
</html>