<%@page import="com.book.bookdb"%>
<%@page import="com.book.books"%>
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
	background-color:silver;
	}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

$={param["bname"]}
$={param["author"]}
$={param["edition"]}

<%
String sstock=request.getParameter("stock");
String pprice=request.getParameter("price");
int stock=Integer.parseInt(sstock);
float price=Float.parseFloat(pprice);
%>
<jsp:useBean id="b" class="com.book.books"></jsp:useBean>
<jsp:setProperty property="*" name="b"/>
<jsp:useBean id="bd" class="com.book.bookdb"></jsp:useBean>
<%
boolean st=bd.insert(b);
if(st)
{
	%>
	<jsp:forward page="amenu.jsp">
	<jsp:param value="INERSTED" name="result"/>
	</jsp:forward>
	<%
}
else
{
	%>
	<jsp:forward page="amenu.jsp">
	<jsp:param value="FAILED" name="result"/>
	</jsp:forward>
	<%
}
%>
</body>
</html>