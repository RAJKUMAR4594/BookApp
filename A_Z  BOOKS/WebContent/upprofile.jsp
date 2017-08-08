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
<%
books p=new books();
int cid=Integer.parseInt(request.getParameter("cid"));
p.setCid(cid);
p.setCname(request.getParameter("cname"));
p.setPwd(request.getParameter("pwd"));
p.setMail_id(request.getParameter("mail_id"));
int phone=Integer.parseInt(request.getParameter("phone_no"));
p.setPhone_no(phone);
p.setAddr(request.getParameter("addr"));
bookdb bd=new bookdb();
boolean st=bd.updateprofile(p);
if(st)
{
%>
<jsp:forward page="vprofile.jsp">
	<jsp:param value="Updated" name="result"/>
	</jsp:forward>
	<%
}
else
{
	%>
	<jsp:forward page="vprofile.jsp">
	<jsp:param value="FAILED" name="result"/>
	</jsp:forward>
<%
}
%>
</body>
</html>