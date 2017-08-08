<%@page import="com.book.books"%>
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
books b=new books();
bookdb bd=new bookdb();
int qty=Integer.parseInt(request.getParameter("qty"));
int oid=Integer.parseInt(request.getParameter("oid"));
int bid=Integer.parseInt(request.getParameter("bid"));

int stock=bd.checkstock(bid);
int sstock=(stock+qty);
boolean sst=bd.cqty(bid,sstock);
if(sst)
{

boolean st=bd.deleteorderbook(oid);
if(st)
{%>
<jsp:forward page="dacb.jsp">
	<jsp:param value="Canceled" name="result"/>
	</jsp:forward>
	<%
}}
else
{
	%>
	<jsp:forward page="dacb.jsp">
	<jsp:param value="FAILED" name="result"/>
	</jsp:forward>

<%
}
%>
</body>
</html>