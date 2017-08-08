<%@page import="javax.websocket.Session"%>
<%@ page errorPage="error.jsp" %>
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
String cid=request.getParameter("cid");
String pwd=request.getParameter("pwd");
String x="admin";
if((cid.equals(x)))
{
	if(pwd.equals(x))
	{
RequestDispatcher rd=request.getRequestDispatcher("admin.jsp");
rd.include(request,response);
	}
}
else
{
int id=Integer.parseInt(cid);
session.setAttribute("cid",cid);

bookdb bd=new bookdb();
boolean t=bd.cusmenucheck(id,pwd);
if(t)
{
	RequestDispatcher rrd=request.getRequestDispatcher("cus.jsp");
	rrd.include(request,response);	
}	
else
{
	%>
	<jsp:forward page="index.jsp">
	<jsp:param value="Check Info" name="resul"/>
	</jsp:forward>
	<% 
}
}
%>






</body>
</html>


