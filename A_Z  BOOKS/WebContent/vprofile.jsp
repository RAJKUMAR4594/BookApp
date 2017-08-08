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
	background-color:#ff9901;
	}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String ccid=session.getAttribute("cid").toString();
int cid=Integer.parseInt(ccid);
Class.forName("com.mysql.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/book","root","root");
PreparedStatement pss=conn.prepareStatement("select * from customer where cid=?;");
pss.setInt(1,cid);
ResultSet r=pss.executeQuery();
while(r.next())	
{	 
%>
<center>
<br>
<br>
<form action="upprofile.jsp">
<table>
<tr><td>Customer_ID</td><td>:<input type="text" readonly="readonly" name="cid" value="<%= r.getInt(1)%>"></td></tr>
<tr><td>Customer Name</td><td>:<input type="text"  name="cname" value="<%=r.getString(2)%>"></td></tr>
<tr><td>Password</td><td>:<input type="text" name="pwd" value="<%= r.getString(3)%>"></td></tr>
<tr><td>Mail_ID</td><td>:<input type="text" name="mail_id" value="<%= r.getString(4)%>"></td></tr>
<tr><td>Phone_no</td><td>:<input type="text" name="phone_no" value="<%= r.getInt(5)%>"></td></tr>
<tr><td>Address</td><td>:<input type="text" name="addr" value="<%= r.getString(6)%>"></td></tr>
<tr><td><input type="submit" value="Update Profile"></td></tr>
</table>
</form>
<%
}
%>
${param["result"] }
</center>

</body>
</html>