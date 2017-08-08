<%@page import="com.book.books"%>
<%@page import="com.book.bookdb"%>
<%@page import="java.util.*" %>
<%@page import="java.sql.*" %>
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
String bookid=request.getParameter("bid");
int bid=Integer.parseInt(bookid);
Class.forName("com.mysql.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/book","root","root");
PreparedStatement pss=conn.prepareStatement("select * from bdetails where bid=?;");
pss.setInt(1,bid);
ResultSet r=pss.executeQuery();
while(r.next())	
{	 
%>

<center>
<form action="orderbook2.jsp">
<br>
<br>
<table>
<tr><td>Book_ID</td><td>:<input type="text" readonly="readonly" name="bid" value="<%= r.getInt(1)%>"></td></tr>
<tr><td>Book_name</td><td>:<input type="text" value="<%=r.getString(2)%>"></td></tr>
<tr><td>Book_Author</td><td>:<input type="text" value="<%= r.getString(3)%>"></td></tr>
<tr><td>Book_Edition</td><td>:<input type="text" value="<%= r.getString(4)%>"></td></tr>
<tr><td>Book_Price</td><td>:<input type="text" name="price" value="<%= r.getFloat(5)%>"></td></tr>
<tr><td>Book_Stock</td><td>:<input type="text" name="stock" value="<%= r.getInt(6)%>"></td></tr>
<tr><td>Qty</td><td>:<input type="text" name="qty"></td></tr>
<tr><td><input type="submit" value="Order Confirm"></td></tr>
</table>
</form>
<%} %>

</center>

</body>
</html>