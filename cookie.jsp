<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.net.URLEncoder" %>
<%
	Cookie ck = new Cookie("name", URLEncoder.encode("낙타", "utf-8"));
	response.addCookie(ck);
%>
<html>
<head><title> Cookie 생성 </title></head>
<body>
Cookie Name : <%= ck.getName() %> <br>
<%= ck.getName() %> Cookie Value : <%= ck.getValue() %>
</body>
</html>
