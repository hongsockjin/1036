<%@ page contentType="text/html" import="java.sql.*,javax.sql.*,java.util.*,javax.naming.*"%>

<%

    Context ctx = null;
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;

    try{

        out.println("<h2>DataSource test</h2>");
	ctx = new InitialContext();
        DataSource ds=(DataSource)ctx.lookup("jdbc/test");
        conn = ds.getConnection();
        stmt = conn.createStatement();  

        String sqlstr = "SELECT * from emp";                      
        stmt.executeQuery(sqlstr);              
        rs = stmt.getResultSet();  

	if(result > 0){
	conn.commit();
	}
%>

<html>
<body>
<table border=1 cellpadding=0 cellspacing=1 >
<tr height="25" bgcolor="#E2EBF3">
<td width="100" align="center"> EMPNO
<td width="100" align="center"> ENAME
<td width="100" align="center"> JOB
<td width="100" align="center"> MGR
<td width="100" align="center"> HIREDATE
<td width="100" align="center"> SAL
<td width="100" align="center"> COMM
<td width="100" align="center"> DEPTNO
</tr>

<%          

                   while(rs.next()) {

%>

<tr height="25">
                       <td width="100" align="center"><%= rs.getString(1)%>

                       <td width="100" align="center"><%= rs.getString(2)%>

        <td width="100" align="center"><%= rs.getString(3)%>
        <td width="100" align="center"><%= rs.getString(4)%>
        <td width="100" align="center"><%= rs.getString(5)%>
        <td width="100" align="center"><%= rs.getString(6)%>
        <td width="100" align="center"><%= rs.getString(7)%>
        <td width="100" align="center"><%= rs.getString(8)%>

</tr>

<%

            }                  
               }catch(Exception e) {                
                   System.out.println("Error : " + e.toString());             
               } finally {
	           rs.close();
                   stmt.close();                    
                   conn.close();      

        }

%>

</table>
</body>
</html>
