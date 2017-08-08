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
	background-color:blue;
	}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
int cid=Integer.parseInt(request.getParameter("cid"));
int bid=Integer.parseInt(request.getParameter("bid"));
bookdb bd=new bookdb();
int sstock=bd.cancelorderqty(cid);
int ssstock=bd.checkstock(bid);
int stock=(sstock+ssstock);
boolean sst=bd.cqty(bid,stock);
if(sst)
{
boolean st=bd.cancelorderbook(cid);
if(st)
{
%>
<jsp:forward page="dacb.jsp">
	<jsp:param value="All Order Canceled" name="result"/>
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