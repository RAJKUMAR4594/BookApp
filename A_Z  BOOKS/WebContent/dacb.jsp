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
	background-color:orange;
	}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<br>
<br>

<%
String ccid=session.getAttribute("cid").toString();
int cid=Integer.parseInt(ccid);
%>

<%
bookdb bbdd=new bookdb();
out.write("<center>");

ArrayList<books> list=bbdd.vieworderstatus(cid);
out.write("<table border='1' cellpadding='4' width='60%'> ");
out.write("<tr><th>Order_ID</th><th>Customer_ID</th><th>Book_ID</th><th>Qty</th><th>Total Price</th><th>Order Date</th><th>Order Status</th><th>Delete Book</th><th>Order Cancel</th></tr>");

for(books e:list)
{
	out.print("<tr><td>"+e.getOid()+"</td><td>"+e.getCid()+"</td><td>"+e.getBid()+"</td><td>"+e.getQty()+"</td><td>"+e.getTprice()+"</td><td>"+e.getOdate()+"</td><td>"+e.getStatus()+"</td><td><a href=orderdelete.jsp?oid="+e.getOid()+"&qty="+e.getQty()+"&bid="+e.getBid()+">Delete Book</a></td><td><a href=cancelorder.jsp?cid="+e.getCid()+"&bid="+e.getBid()+">Cancel Order</a></td></tr>");
}


out.write("</table>");
out.write("</center>");

%>
<center>
${param["result"]}
</center>

</body>
</html>