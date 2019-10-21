<%@ page contentType="text/html; charset=Shift_JIS"
         import="java.sql.*,java.text.*" %>

<%
Class.forName("org.postgresql.Driver");
String url = "jdbc:postgresql://ec2-107-22-160-185.compute-1.amazonaws.com:5432/deck0jp8rljjoa";
String user = "uxsvvqdujoyrti";
String password = "2d989239c38338117217f11fbd0bfc7cca8d1a671c3f395a833e0eab7932050c";
String recid = request.getParameter("recid");
String strsql = "SELECT * FROM oppbranch where extid='" + recid + "'";

DecimalFormat objFmt=new DecimalFormat("#,###");
SimpleDateFormat objDtFmt=new SimpleDateFormat("yyyy/MM/dd");
SimpleDateFormat objDtTmFmt=new SimpleDateFormat("yyyy/MM/dd HH:mm");

String sel_recid = "1";
Date sel_plan_Date_b;
Date sel_plan_Date_a;
long sel_plan_amount_b = 1000000;
long sel_plan_amount_a = 2000000;
String sel_plan_accuracy_b = "B";
String sel_plan_accuracy_a = "A";

%>

<script type="text/javascript" src="/scripts/util.js"></script>
 
<div class="content-data">
    <p id="memo">memo</p>
    <input type="button" class="table_btn" value="行追加" onclick="insertRow('BranchListDB');" />

    <table class="oppBrListTable" id="BranchListDB" onclick="tableClick('BranchListDB')">
    <tr>
        <th class="hidden">recid</th>
        <th>変更区分</th>
        <th>実行／払込予定日</th>
        <th>実行／払込予定額（原通貨）</th>
        <th>実行／払込確度</th>
        <th>作成日時</th>
        <th>削除</th>

    </tr>
    <!--選択肢：新規,変更,削除,取下-->

<%
Connection db=DriverManager.getConnection(url, user, password);
db.setReadOnly(true);
Statement objSql=db.createStatement();
ResultSet rs=objSql.executeQuery(strsql);

while(rs.next()){
%>
      <tr>
        <td class="hidden"><%= rs.getString("oppbranchid") %></td>
        <td class="center">&nbsp;</td>　    <!--選択肢：新規,変更,削除,取下-->
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
        <td class="center" nowrap><input type="checkbox" name="chkdel" onclick="checkDel(this);" /></td-->
        
    </tr>

<%
}
rs.close();
objSql.close();
db.close();
%>
</table>

<div class="content-data">

    <div class="section-title"><h4>枝口情報</h4></div>
    <p>oppbranchid:<%= sel_recid %></p>

    <table class="oppBrDetailTable" id="BranchDetailDB">
        <tr>
            <th>&nbsp;</th>
            <th>変更前</th>
            <th>変更後</th>
        </tr>
        <tr>
            <td class="colth">実行／払込予定日:</td>
            <td class="left"></td><%= sel_plan_Date_b %> </td>
            <td class="right"><input type="text" value=<%= objDtFmt.format(sel_plan_Date_a) %> ></input></td>
        </tr>
        <tr>
            <td class="colth">実行払込予定額(現通貨):</td>
            <td class="right"><%= objFmt.format(sel_plan_amount_b) %></td>
            <td class="right"><input type="text" size="18" class="right" value=<%= objFmt.format(sel_plan_amount_a) %> onfocus="offComma(this)" onblur="toComma(this)" /></td>
        </tr>
        <tr>
            <td class="colth">実行／払込確度:</td>
            <td class="center"><%= sel_plan_accuracy_b %></td>
            <td class="right">
                <select name="plan_accuracy">
                    <option value=""></option>
                    <option value="A" <% if ("A".equals(sel_plan_accuracy_a)) { %>selected<% } %>>A</option>
                    <option value="B" <% if ("B".equals(sel_plan_accuracy_a)) { %>selected<% } %>>B</option>
                    <option value="C" <% if ("C".equals(sel_plan_accuracy_a)) { %>selected<% } %>>C</option>
                </select> 
            </td>
        </tr>
        <tr>
            <td class="colth">ネッティング額（現通貨）:</td>
            <td class="right"></td>
            <td class="right"><input type="text" size="18" class="right" onfocus="offComma(this)" onblur="toComma(this)" /></td>
        </tr>
        <tr>
            <td class="colth">実行日控除額（現通貨）:</td>
            <td class="right"><%= objFmt.format(rs.getLong("plan_amount")) %></td>
            <td class="right"><input type="text" size="18" class="right" onfocus="offComma(this)" onblur="toComma(this)" /></td>
        </tr>
        <tr>
            <td class="colth">差額（現通貨）:</td>
            <td class="right"><%= objFmt.format(rs.getLong("plan_amount")) %></td>
            <td class="right"><input type="text" size="18" class="right" onfocus="offComma(this)" onblur="toComma(this)" /></td>
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



</div>
