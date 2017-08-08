<%@page import="com.book.bookdb"%>
<%@page import="com.book.books"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.book.*" %>
<%@ page errorPage="error.jsp" %>
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

<%
String bname=request.getParameter("bname");
Class.forName("com.mysql.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/book","root","root");
PreparedStatement pss=conn.prepareStatement("select * from bdetails where bname=?;");
pss.setString(1,bname);
ResultSet r=pss.executeQuery();
while(r.next())	
{	 
%>
<%@ include file="vob.jsp" %>
<center>
<br>
<br>
<table>
<tr><td>Book_ID</td><td>:<%= r.getInt(1)%></td></tr>
<tr><td>Book_name</td><td>:<%=r.getString(2)%></td></tr>
<tr><td>Book_Author</td><td>:<%= r.getString(3)%></td></tr>
<tr><td>Book_Edition</td><td>:<%= r.getString(4)%></td></tr>
<tr><td>Book_Price</td><td>:<%= r.getFloat(5)%></td></tr>
<tr><td>Book_Stock</td><td>:<%= r.getInt(6)%></td></tr>
</table>
<%} %>
</center>
</body>
</html>