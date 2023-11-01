<%@page language="java" contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*" %>
<%@page import="javax.naming.*" %>
<%@ page import="java.net.InetAddress" %>
<%@page import="java.sql.*" %>
<%@page import="javax.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	.test1 {
		color: red;
	}
	#test2 {
		color: blue;
	}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<h1><a class="test1">hello1ddd343edfsdfsdddddfsvevfffffffffvv dffsd4343434ddd</a>sjkim<a id="test2">world</a>.</h1>

</body>
<%
Thread.sleep(1000);
 Integer count = (Integer)session.getAttribute("count");
 if(count == null){
  count = new Integer(1);
 } else{
  count = new Integer(count.intValue() + 1);
 }
 session.setAttribute("count", count);

 out.println("SESSION ID: " + session.getId() + "<br>");
%>
</html>
