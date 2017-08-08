<%@page import="java.util.ArrayList"%>
<%@page import="com.book.bookdb"%>
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
	background-color:#ff9900;
	}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<br>
<br>
<%
bookdb bb=new bookdb();
out.write("<center>");

ArrayList<books> list=bb.conorderstatus();
out.write("<table border='1' cellpadding='4' width='60%'> ");
out.write("<tr><th>Order_ID</th><th>Customer_ID</th><th>Book_ID</th><th>Qty</th><th>Total Price</th><th>Order Date</th><th>Order Status</th><th>CONFIRM STATUS</th></tr>");

for(books e:list)
{
	out.print("<tr><td>"+e.getOid()+"</td><td>"+e.getCid()+"</td><td>"+e.getBid()+"</td><td>"+e.getQty()+"</td><td>"+e.getTprice()+"</td><td>"+e.getOdate()+"</td><td>"+e.getStatus()+"</td><td><a href=ordercon2.jsp?oid="+e.getOid()+">Confirm</a></td></tr>");
}


out.write("</table>");
out.write("</center>");

%>
<br>
<br>
<center>
${param["ressult"]}
</center>

</body>
</html>