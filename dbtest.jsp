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
<h1>SELECT</h1>
	<div>
                <button onclick="select()">조회</button>
                <button onclick="insert()">추가</button>
		<button onclick="deletet()">삭제</button>
                <button onclick="update()">수정</button>
        </div>

<form action="delete.jsp" method="post">
	<table width="700" border="1">
		<tr>
			<td>
				<input type="checkbox" name="all" onclick="allSel(this.checked)"/></td>
			<td width="100">EMPNO</td>
			<td width="100">ENAME</td>
			<td width="100">JOB</td>
			<td width="100">MGR</td>
			<td width="100">HIREDATE</td>
			<td width="100">SAL</td>
			<td width="100">COMM</td>
			<td width="100">DETPNO</td>
		</tr>
	
	<%
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		
		try{
			String sql = "SELECT * FROM emp ORDER BY EMPNO ASC";
		
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery(sql);
			
			while(rs.next()){
				%>
					<tr>
						<td><input type="checkbox" name="chk" value="<%=rs.getInt("EMPNO")%>"></td>
						<td width="100"><%=rs.getInt("EMPNO")%></td>
						<td width="100"><%=rs.getString("ENAME")%></td>
						<td width="100"><%=rs.getString("JOB")%></td>
						<td width="100"><%=rs.getString("MGR")%></td>
						<td width="100"><%=rs.getDate("HIREDATE")%></td>
						<td width="100"><%=rs.getInt("SAL")%></td>
						<td width="100"><%=rs.getString("COMM")%></td>
						<td width="100"><%=rs.getInt("DEPTNO")%></td>
		
					</tr>
		
				<%
			}
			%>
			<%
		}
		catch(Exception e){
			e.printStackTrace();
		}finally {
			close(null, pstmt, con);
		}
	%>
	
	<tr>
		<td colspan="9">
			<input type="submit" value="삭제"/>
		</td>
	</tr>
	</table>
</form>
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
