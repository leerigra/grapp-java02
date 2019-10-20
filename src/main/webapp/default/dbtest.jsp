<%@ page contentType="text/html; charset=Shift_JIS"
         import="java.sql.*,java.text.*" %>
<table border="1">
<tr>
  <th>予定日</th><th>予定額</th><th>角度</th><th>作成日</th>
</tr>

<%
Class.forName("org.postgresql.Driver");
String url = "jdbc:postgresql://ec2-107-22-160-185.compute-1.amazonaws.com:5432/deck0jp8rljjoa";
String user = "uxsvvqdujoyrti";
String password = "2d989239c38338117217f11fbd0bfc7cca8d1a671c3f395a833e0eab7932050c";

Connection db=DriverManager.getConnection(url, user, password);
db.setReadOnly(true);
Statement objSql=db.createStatement();
ResultSet rs=objSql.executeQuery("SELECT * FROM oppbranch");
DecimalFormat objFmt=new DecimalFormat("#,###円");
while(rs.next()){
%>
  <tr>
    <td><%=rs.getString("plan_Date")%></td>
    <td align="right"><%=objFmt.format(rs.getLong("plan_amount"))%></td>
    <td><%=rs.getString("plan_accuracy")%></td>
    <td><%=rs.getDate("create_date")%></td>
  </tr>
<%
}
rs.close();
objSql.close();
db.close();
%>
</table>