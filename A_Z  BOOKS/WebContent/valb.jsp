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
	background-color:lime;
	}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
String spageid=request.getParameter("page");
int pageid=Integer.parseInt(spageid);
bookdb bbdd=new bookdb();
int total=3;
if(pageid==1){
	pageid=pageid-1;
	
}
else
{
	pageid=pageid-1;
	pageid=pageid*total+1;
}
out.write("<center>");
out.print("<h3>Page No."+spageid+"</h3>");
ArrayList<books> list=bbdd.getRecord(pageid, total);
out.write("<table border='1' cellpadding='4' width='60%'> ");
out.write("<tr><th>BID</th><th>Book Name</th><th>Author</th><th>Edition</th><th>Book Price</th><th>Stocks</th></tr>");

for(books e:list)
{
	out.print("<tr><td>"+e.getBid()+"</td><td>"+e.getBname()+"</td><td>"+e.getAuthor()+"</td><td>"+e.getEdition()+"</td><td>"+e.getPrice()+"</td><td>"+e.getStock()+"</td></tr>");
}


out.write("</table>");
out.write("</center>");

%>
<br>
<br>
<center>
<a href="valb.jsp?page=1">1</a>
<a href="valb.jsp?page=2">2</a>
<a href="valb.jsp?page=3">3</a>

</center>
</body>
</html>