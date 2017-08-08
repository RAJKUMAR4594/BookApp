<%@page import="com.book.books"%>
<%@page import="com.book.bookdb"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
body {
	font-family:verdana,arial,sans-serif;
	font-size:10pt;
	margin:10px;
	background-color:lime;
	}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% 
String bbid=request.getParameter("bid");
int bid=Integer.parseInt(bbid);
bookdb bd=new bookdb();
boolean st=bd.deletebook(bid);
if(st)
{
	%>
	<jsp:forward page="udv.jsp?page=1">
	<jsp:param value="DELETED" name="result"/>
	</jsp:forward>
	<%
}
else
{
	%>
	<jsp:forward page="udv.jsp?page=1">
	<jsp:param value="FAILED" name="result"/>
	</jsp:forward>
	<%
}
%>
</body>
</html>