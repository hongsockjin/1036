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
<h1>INSERT</h1>
	<div>
		<button onclick="select()">조회</button>
		<button onclick="insert()">추가</button>
		<button onclick="deletet()">삭제</button>
		<button onclick="update()">수정</button>
        </div>
	<form action="save.jsp" method="post">
                <table border="1">
                        <tr>
				<th>empno</th>
				<td><input type="text" name="empno"/></td>
                                <th>ename</th>
                                <td><input type="text" name="ename"/></td>
                                <th>job</th>
				<td><input type="text" name="job"/></td></tr>
			<tr>
                                <th>sal</th>
                                <td><input type="text" name="sal" placeholder="you sal(limit: number[4])" maxlength="4" onkeyup="this.value=this.value.replace(/[^-0-9]/g,'');"/></td>
                                <th>comm</th>
                                <td><input type="text" name="comm"/></td>
				<th>deptno</th>
				<td><input type="text" name="deptno"/></td>
                	</tr>
			<tr>
				<input type="submit" value="저장"/>
			</tr>
		</table>
	</form>
<%
//public void insertS(){
	
	//Connection con = null;
//	PreparedStatement pstmt = null;
	
//	String sql ="INSERT INTO emp(EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) VALUES(8,'rrer','deed',NULL,SYSDATE,300,'yeey',970)";

//	try{

//		pstmt = con.prepareStatement(sql);
//		pstmt.executeUpdate();
//	} catch (SQLException e){
//		e.printStackTrace();
//	} finally {
	//	close(null,pstmt,con);
//	}
	
//}
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
