<%@ page contentType="text/html; charset=Shift_JIS"
         import="java.sql.*,java.text.*" %>

<script type="text/javascript" src="/scripts/util.js"></script>
 
<div class="content-data">
    <input type="button" class="table_btn" value="行追加" onclick="insertRow('BranchList')" />

    <table class="oppBrListTable" id="BranchList">
    <tr>
        <th>変更区分</th>
        <th>実行／払込予定日</th>
        <th>実行／払込予定額（原通貨）</th>
        <th>実行／払込確度</th>
        <th>作成日時</th>
        <th>削除</th>
    </tr>
    
<%
Class.forName("org.postgresql.Driver");
String url = "jdbc:postgresql://ec2-107-22-160-185.compute-1.amazonaws.com:5432/deck0jp8rljjoa";
String user = "uxsvvqdujoyrti";
String password = "2d989239c38338117217f11fbd0bfc7cca8d1a671c3f395a833e0eab7932050c";

Connection db=DriverManager.getConnection(url, user, password);
db.setReadOnly(true);
Statement objSql=db.createStatement();
ResultSet rs=objSql.executeQuery("SELECT * FROM oppbranch where extid='0060k0000091Sc4AAE'");
DecimalFormat objFmt=new DecimalFormat("#,###円");
while(rs.next()){
%>
      <tr>
        <td class="center"><%= change_category1 %></td>
        <td class="left"><input type="text" size="10" value=<%=rs.getString("plan_Date")%> ></input></td>
        <td class="right"><input type="text" size="18" class="right" value=<%=objFmt.format(rs.getLong("plan_amount"))%> /></td>
        <td class="center">
            <select name="plan_accuracy1">
                <option value=""></option>
                <option value="A" selected>A</option>
                <option value="B">B</option>
                <option value="C">C</option>
            </select> 
        </td>
        <td class="left"><%=rs.getDate("create_date")%></td>
        <td nowrap><input type="button" value="行削除" onclick="deleteRow(this)" /></td>
    </tr>

<%
}
rs.close();
objSql.close();
db.close();
%>
</table>
</div>
