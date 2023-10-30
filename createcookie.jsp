<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.net.URLDecoder" %>
<html>
<head> Cookie 목록 </head>
<body>
Cookie 목록 <br>
<%
	Cookie[] cks = request.getCookies();
    	if( cks != null && cks.length > 0 ) {

		for( int i =0; i < cks.length; i++ ){
%>
			<%= cks[i].getName() %> = 
			<%= URLDecoder.decode(cks[i].getValue(), "utf-8") %> <br>
<%
		}
        
    	} else {
%>
No Cookie
<%
    	}
%>
</body>
</html>
