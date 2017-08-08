<%@page import="com.book.bookdb"%>
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
String ooid=request.getParameter("oid");
int oid=Integer.parseInt(ooid);
bookdb bd=new bookdb();
boolean st=bd.conorder2(oid);
if(st)
{
%>
<jsp:forward page="ordercon.jsp">
	<jsp:param value="Confirm" name="ressult"/>
	</jsp:forward>
	<%
}
else
{
	%>
	<jsp:forward page="ordercon.jsp">
	<jsp:param value="FAILED" name="ressult"/>
	</jsp:forward>

<%
}
%>
</body>
</html>