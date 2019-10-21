<%@ page contentType="text/html; charset=Shift_JIS"
         import="java.sql.*,java.text.*" %>

<%
Class.forName("org.postgresql.Driver");
String url = "jdbc:postgresql://ec2-107-22-160-185.compute-1.amazonaws.com:5432/deck0jp8rljjoa";
String user = "uxsvvqdujoyrti";
String password = "2d989239c38338117217f11fbd0bfc7cca8d1a671c3f395a833e0eab7932050c";
String recid = request.getParameter("recid");
String strsql = "SELECT * FROM oppbranch where extid='" + recid + "'";
%>

<script type="text/javascript" src="/scripts/util.js"></script>
 
<div class="content-data">
    <input type="button" class="table_btn" value="行追加" onclick="insertRow('BranchListDB');" />

    <table class="oppBrListTable" id="BranchListDB">
    <tr>
        <th class="hidden">recid</th>
        <th>変更区分</th>
        <th>実行／払込予定日</th>
        <th>実行／払込予定額（原通貨）</th>
        <th>実行／払込確度</th>
        <th>作成日時</th>
        <th>削除</th>

    </tr>
    
<%
Connection db=DriverManager.getConnection(url, user, password);
db.setReadOnly(true);
Statement objSql=db.createStatement();
ResultSet rs=objSql.executeQuery(strsql);
DecimalFormat objFmt=new DecimalFormat("#,###");
SimpleDateFormat objDtFmt=new SimpleDateFormat("yyyy/MM/dd");
SimpleDateFormat objDtTmFmt=new SimpleDateFormat("yyyy/MM/dd HH:mm");
while(rs.next()){
%>
      <tr>
        <td class="hidden"><%= rs.getString("oppbranchid") %></td>
        <td class="center">&nbsp;</td>
        <td class="left"><input type="text" size="10" value=<%=objDtFmt.format(rs.getDate("plan_Date"))%> ></input></td>
        <td class="right"><input type="text" size="18" class="right" value=<%=objFmt.format(rs.getLong("plan_amount"))%> onfocus="offComma(this)" onblur="toComma(this)" /></td>
        <td class="center">
            <select name="plan_accuracy">
                <option value=""></option>
                <option value="A" <% if ("A".equals(rs.getString("plan_accuracy"))) { %>selected<% } %>>A</option>
                <option value="B" <% if ("B".equals(rs.getString("plan_accuracy"))) { %>selected<% } %>>B</option>
                <option value="C" <% if ("C".equals(rs.getString("plan_accuracy"))) { %>selected<% } %>>C</option>
            </select> 
        </td>
        <td class="left"><%=objDtTmFmt.format(rs.getDate("create_date"))%></td>
        <!--td class="center" nowrap><input type="button" value="行削除" onclick="upddelRow(this);" /></td-->
        <td class="center" nowrap><input type="checkbox" name="chkdel" /></td-->
        
    </tr>

<%
}
rs.close();
objSql.close();
db.close();
%>
</table>
</div>
