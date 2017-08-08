<%@page import="java.util.ArrayList"%>
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
	background-color:#ff9901;
	}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<center>
<%
bookdb bbdd=new bookdb();
ArrayList<books> list=bbdd.cusview();
out.write("<table border='1' cellpadding='4' width='60%'> ");
out.write("<tr><th>Customer ID</th><th>Customer Name</th><th>Password</th><th>Mail_id</th><th>Phone_number</th><th>Address</th></tr>");

for(books e:list)
{
	out.print("<tr><td>"+e.getCid()+"</td><td>"+e.getCname()+"</td><td>"+e.getPwd()+"</td><td>"+e.getMail_id()+"</td><td>"+e.getPhone_no()+"</td><td>"+e.getAddr()+"</td></tr>");
}


out.write("</table>");
out.write("</center>");

%>
</center>
<br>
<br>

</body>
</html>