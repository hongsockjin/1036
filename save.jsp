<%@page language="java" contentType="text/html; charset=utf-8" %>
<%@page import="javax.naming.*" %>
<%@page import="java.sql.*" %>
<%@page import="javax.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
	String ename = request.getParameter("ename");
	String job = request.getParameter("job");
	String sal = request.getParameter("sal");
	String comm = request.getParameter("comm");
	String deptno = request.getParameter("deptno");



	PreparedStatement pstmt = null;
	
	String sql ="INSERT INTO emp(EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) VALUES(?,?,?,NULL,SYSDATE,?,?,?)";

	try{
	//	con = getConection();

		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, empno);
		pstmt.setString(2, ename);
                pstmt.setString(3, job);
                pstmt.setString(4, sal);
                pstmt.setString(5, comm);
                pstmt.setString(6, deptno);
		pstmt.executeUpdate();
	} catch (SQLException e){
		e.printStackTrace();
	} finally {
		close(null,pstmt,con);
		response.sendRedirect("dbtest.jsp");
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
