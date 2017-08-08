<%@page import="com.book.bookdb"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.book.*" %>
<%@ page errorPage="error.jsp" %>
<%@page import="com.book.books"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
books b=new books();
b.setCname(request.getParameter("ccname"));
b.setPwd(request.getParameter("ppwd"));
b.setMail_id(request.getParameter("mmail_id"));
b.setAddr(request.getParameter("aaddr"));
String ppphone_no=request.getParameter("pphone_no");
//int phone_no=Integer.parseInt(ppphone_no);
Long ph=Long.parseLong(ppphone_no);

b.setPh(ph);
bookdb bbd=new bookdb();
boolean sst=bbd.icus(b);

if(sst)
{
%>
	<jsp:forward page="index.jsp">
	<jsp:param value="INERSTED" name="res"/>
	</jsp:forward>
<%
}
else
{
%>
	<jsp:forward page="index.jsp">
	<jsp:param value="FAILED" name="res"/>
	</jsp:forward>
<%
}
%>
</body>
</html>