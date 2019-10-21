<%@ page contentType="text/html; charset=Shift_JIS"
         import="java.sql.*,java.text.*" %>

<%
Class.forName("org.postgresql.Driver");
String url = "jdbc:postgresql://ec2-107-22-160-185.compute-1.amazonaws.com:5432/deck0jp8rljjoa";
String user = "uxsvvqdujoyrti";
String password = "2d989239c38338117217f11fbd0bfc7cca8d1a671c3f395a833e0eab7932050c";
String oppbranchid = request.getParameter("oppbranchid");
String strsql = "SELECT * FROM oppbranch where oppbranchid='" + oppbranchid + "'";

Connection db=DriverManager.getConnection(url, user, password);
db.setReadOnly(true);
Statement objSql=db.createStatement();
ResultSet rs=objSql.executeQuery(strsql);
rs.next();
DecimalFormat objFmt=new DecimalFormat("#,###");
SimpleDateFormat objDtFmt=new SimpleDateFormat("yyyy/MM/dd");
SimpleDateFormat objDtTmFmt=new SimpleDateFormat("yyyy/MM/dd HH:mm");
%>
<link rel="stylesheet" type="text/css" href="/css/style.css" />
  
<script type="text/javascript" src="/scripts/json2.js"></script>
<script type="text/javascript" src="/sdk/js/canvas-all.js"></script>
<script type="text/javascript" src="/scripts/util.js"></script>
 
<div class="content-data">

    <div class="section-title"><h4>枝口情報</h4></div>
    <table class="oppBrDetailTable" id="BranchDetailDB">
        <tr>
            <th>&nbsp;</th>
            <th>変更前</th>
            <th>変更後</th>
        </tr>
        <tr>
            <td class="colth">実行／払込予定日:</td>
            <td class="left"><%= objDtFmt.format(rs.getDate("plan_Date")) %> </td>
            <td class="right"><input type="text" value=<%= objDtFmt.format(rs.getDate("plan_Date")) %> ></input></td>
        </tr>
        <tr>
            <td class="colth">実行払込予定額(現通貨):</td>
            <td class="right"><%= objFmt.format(rs.getLong("plan_amount")) %></td>
            <td class="right"><input type="text" size="18" class="right" value=<%= objFmt.format(rs.getLong("plan_amount")) %> onfocus="offComma(this)" onblur="toComma(this)" /></td>
        </tr>
        <tr>
            <td class="colth">実行／払込確度:</td>
            <td class="center"><%= rs.getString("plan_accuracy") %></td>
            <td class="right">
                <select name="plan_accuracy">
                    <option value=""></option>
                    <option value="A" <% if ("A".equals(rs.getString("plan_accuracy"))) { %>selected<% } %>>A</option>
                    <option value="B" <% if ("B".equals(rs.getString("plan_accuracy"))) { %>selected<% } %>>B</option>
                    <option value="C" <% if ("C".equals(rs.getString("plan_accuracy"))) { %>selected<% } %>>C</option>
                </select> 
            </td>
        </tr>
        <tr>
            <td class="colth">ネッティング額（現通貨）:</td>
            <td class="right"><%= objFmt.format(rs.getLong("plan_amount")) %></td>
            <td class="right"><input type="text" size="18" class="right" value=<%=objFmt.format(rs.getLong("plan_amount"))%> onfocus="offComma(this)" onblur="toComma(this)" /></td>
        </tr>
        <tr>
            <td class="colth">実行日控除額（現通貨）:</td>
            <td class="right"><%= objFmt.format(rs.getLong("plan_amount")) %></td>
            <td class="right"><input type="text" size="18" class="right" value=<%=objFmt.format(rs.getLong("plan_amount"))%> onfocus="offComma(this)" onblur="toComma(this)" /></td>
        </tr>
        <tr>
            <td class="colth">差額（現通貨）:</td>
            <td class="right"><%= objFmt.format(rs.getLong("plan_amount")) %></td>
            <td class="right"><input type="text" size="18" class="right" value=<%=objFmt.format(rs.getLong("plan_amount"))%> onfocus="offComma(this)" onblur="toComma(this)" /></td>
        </tr>

    </table>
</div>
<div class="content-data">
    <table class="oppBrDetailTable" id="BranchDetailmemo">
        <tr>
            <td class="colth">備考:</td>
            <td class="left"><textarea id="memo" rows="10" cols="50">ここに記入してください</textarea></td>
        </tr>
    
    </table>
</div>
<div class="content-data">
    <div class="section-title"><h4>資金課 確認状況</h4></div>
    <table class="oppBrDetailTable" id="BranchDetailApproval">
        <tr>
            <td class="colth">資金課への申請状況</td><
            <td class="left">申請中</td>　<!--一時保存,申請中,差戻,承認反映中-->
        </tr>

        <tr>
            <td class="colth">資金課担当者：</td>
            <td class="left">担当　一郎</td>
        </tr>
 
        <tr>
            <td class="colth">承認／差戻コメント：</td>
            <td class="left">承認 or 差し戻しのコメントがここに表示されます。</td>
        </tr>
    </table>
 </div>
<%
rs.close();
objSql.close();
db.close();
%>

