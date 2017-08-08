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
String bbid=request.getParameter("bid");
int bid=Integer.parseInt(bbid);
b.setBid(bid);
b.setBname(request.getParameter("bname"));
b.setAuthor(request.getParameter("author"));
b.setEdition(request.getParameter("edition"));
String sstock=request.getParameter("stock");
String pprice=request.getParameter("price");
int stock=Integer.parseInt(sstock);
float price=Float.parseFloat(pprice);
b.setPrice(price);
b.setStock(stock);
bookdb bd=new bookdb();
boolean st=bd.updatebook(b);
if(st)
{
	%>
	<jsp:forward page="udv.jsp?page=1">
	<jsp:param value="UPDATED" name="result"/>
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