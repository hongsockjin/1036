<%@page language="java" contentType="text/html; charset=utf-8" %>
<%@page import="javax.naming.*" %>
<%@page import="java.sql.*" %>
<%@page import="javax.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
	#insertb{
		display = none;
	}
</style>
<script type="text/javascript">

function allSel(bool) {
		var chks = document.getElementsByName("chk");
		for (var i = 0; i < chks.length; i++) {
			chks[i].checked = bool;
		}
	}

function select(){
	location.href="dbtest.jsp";
}
function insert(){
	location.href="insert.jsp";
}
function deletet(){
	location.href="delete.jsp";
}
function update(){
	location.href="update.jsp";
}
</script>
</head>
<body>

<%
DataSource ds = null;
Connection con = null;
/*3-tier db connection */

final String DATASOUCE="jdbc/test";
try{InitialContext ic = new InitialContext();
	ds = (DataSource)ic.lookup(DATASOUCE);
	con = ds.getConnection();
}catch(Exception ex)
{
	ex.printStackTrace();
}
	if( con != null ){
		out.print("3-tier방식 연결성공!!");
	}
	else{
		out.print("It's Null");
	}
%>
<%
	String empno = request.getParameter("empno");
	//int empnono = Integer.parseInt(empno);

	PreparedStatement pstmt = null;

	String sql ="DELETE FROM emp WHERE EMPNO=?";

	try{
		//con.setAutoCommit(false);
		pstmt = con.prepareStatement(sql);
		//for(int i = 0;i < empnono.length; i++){
			pstmt.setString(1, empno);
			//pstmt.addBatch();
			//pstmt.executeBatch();
			//con.commit();
			pstmt.executeUpdate();
		//}
	} catch(SQLException e) {
		e.printStackTrace();
	} finally {
		//try {
		//	con.setAutoCommit(true);
			close(null,pstmt,con);
			response.sendRedirect("dbtest.jsp");
		//} catch (SQLException e){
		//	e.printStackTrace();
		//}
	}
%>

<%!
public void close(ResultSet rs, PreparedStatement psmt, Connection con) {
		try {
			if(rs!=null) {
				rs.close();
			}
			if(psmt!=null) {
				psmt.close();
			}
			if(con!=null) {
				con.close();
			}
			System.out.println("6단계 : DB닫기 성공!!");
		} catch (SQLException e) {
			System.out.println("6단계 : DB닫기 실패!!");
			e.printStackTrace();
		}
	}
%>
</body>
</html>
