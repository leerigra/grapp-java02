<%@ page contentType="text/html; charset=Shift_JIS"
         import="java.sql.*,java.text.*" %>


<script type="text/javascript" src="/scripts/util.js"></script>
<script type="text/javascript">

function tableClick(tr){

  // クリックされた行を取得
  table = tr.parentNode;
  rowidx = tr.sectionRowIndex;
  
//alert("選択した行は：" + rowidx +". idは:" +table.rows[rowidx].cells[0].innerHTML);
  tr.setAttribute("class","sel_row");
 
}
</script>

<%
Class.forName("org.postgresql.Driver");
String url = "jdbc:postgresql://ec2-107-22-160-185.compute-1.amazonaws.com:5432/deck0jp8rljjoa";
String user = "uxsvvqdujoyrti";
String password = "2d989239c38338117217f11fbd0bfc7cca8d1a671c3f395a833e0eab7932050c";
String recid = request.getParameter("recid");
String strsql = "SELECT oppbranchid,plan_date,plan_date_edit,plan_amount,plan_amount_edit,plan_accuracy,plan_accuracy_edit,create_date,update_date,COALESCE(netting,0) as netting,COALESCE(netting_edit,0) as netting_edit,COALESCE(deduction,0) as deduction,COALESCE(deduction_edit,0) as deduction_edit,COALESCE(netting,0)-COALESCE(deduction,0) as difference, COALESCE(netting_edit,0)-COALESCE(deduction_edit,0) as difference_edit FROM oppbranch where extid='" + recid + "'";

DecimalFormat objFmt=new DecimalFormat("#,###");
SimpleDateFormat objDtFmt=new SimpleDateFormat("yyyy/MM/dd");
SimpleDateFormat objDtTmFmt=new SimpleDateFormat("yyyy/MM/dd HH:mm");


%>

<form name="fm_opplist">
<div class="content-data">
 
    <input type="text" id="sel_oppbranchid"/>
    <input type="button" class="table_btn" value="行追加" onclick="insertRow('BranchListDB')"  />

    <table class="oppBrListTable" id="BranchListDB" >
    <tr>
        <th class="hidden">recid</th>
        <th>変更区分</th>
        <th>実行／払込予定日</th>
        <th>実行／払込予定額（原通貨）</th>
        <th>実行／払込確度</th>
        <th>作成日時</th>
        <th>削除</th>
       <th>ネッティング額（原通貨）</th>
       <th>実行日控除額（原通貨）</th>
       <th>差額（現通貨）</th>

    </tr>
    <!--選択肢：新規,変更,削除,取下-->

<%
Connection db=DriverManager.getConnection(url, user, password);
db.setReadOnly(true);
Statement objSql=db.createStatement();
ResultSet rs=objSql.executeQuery(strsql);
int i = 1;

while(rs.next()){
%>
      <tr onclick="tableClick(this)">
        <td class="hidden" id="<%="lst_id_" + String.valueOf(i) %>" ><%= rs.getString("oppbranchid") %></td>
        <td class="center">&nbsp;</td>　    <!--選択肢：新規,変更,削除,取下-->
        <td class="left"><input type="text" size="10" id="<%="lst_plan_Date_" + String.valueOf(i) %>" value=<%= rs.getDate("plan_Date") %> ></input></td>
        <td class="right"><input type="text" size="18" class="right" id="<%="lst_plan_amount_" + String.valueOf(i) %>" value=<%= objFmt.format(rs.getLong("plan_amount")) %> onfocus="offComma(this)" onblur="toComma(this)" /></td>
        <td class="center">
            <select name="plan_accuracy" id="<%="lst_plan_accuracy_" + String.valueOf(i) %>">
                <option value=""></option>
                <option value="A" <% if ("A".equals(rs.getString("plan_accuracy"))) { %>selected<% } %>>A</option>
                <option value="B" <% if ("B".equals(rs.getString("plan_accuracy"))) { %>selected<% } %>>B</option>
                <option value="C" <% if ("C".equals(rs.getString("plan_accuracy"))) { %>selected<% } %>>C</option>
            </select> 
        </td>
        <td class="left"><%= rs.getDate("create_date")%></td>
        <!--td class="center" nowrap><input type="button" value="行削除" onclick="upddelRow(this);" /></td-->
        <td class="center" nowrap><input type="checkbox" name="chkdel" onclick="checkDel(this);" ></td>
        
        <td class="right" id="<%="lst_netting_" + String.valueOf(i) %>" value=<%= objFmt.format(rs.getLong("netting")) %> onfocus="offComma(this)" onblur="toComma(this)" /></td>
        <td class="right" id="<%="lst_deduction_" + String.valueOf(i) %>" value=<%= objFmt.format( rs.getLong("deduction")) %> onfocus="offComma(this)" onblur="toComma(this)" /></td>
        <td class="right" id="<%="lst_difference_" + String.valueOf(i) %>" value=<%= objFmt.format( rs.getLong("difference") %> onfocus="offComma(this)" onblur="toComma(this)" /> </td>

        <td class="hidden"><input type="text" size="10" id="<%="lst_plan_Date_upd_" + String.valueOf(i) %>" value=<%= rs.getDate("plan_Date_edit") %> ></input></td>
        <td class="hidden"><input type="text" size="18" class="right" id="<%="lst_plan_amount_upd_" + String.valueOf(i) %>" value=<%= objFmt.format(rs.getLong("plan_amount_edit"))%> onfocus="offComma(this)" onblur="toComma(this)" /></td>
        <td class="hidden">
            <select  id="<%="lst_plan_accuracy_upd_" + String.valueOf(i) %>">
                <option value=""></option>
                <option value="A" <% if ("A".equals(rs.getString("plan_accuracy_edit"))) { %>selected<% } %>>A</option>
                <option value="B" <% if ("B".equals(rs.getString("plan_accuracy_edit"))) { %>selected<% } %>>B</option>
                <option value="C" <% if ("C".equals(rs.getString("plan_accuracy_edit"))) { %>selected<% } %>>C</option>
            </select> 
        </td>
       
        <td class="hidden" id="<%="lst_netting_upd_" + String.valueOf(i) %>" ><%= rs.getString("netting_edit") %></td>
        <td class="hidden" id="<%="lst_deduction_upd_" + String.valueOf(i) %>" ><%= rs.getString("deduction_edit") %></td>
        <td class="hidden" id="<%="lst_difference_upd_" + String.valueOf(i) %>" ><%= rs.getString("difference_edit") %></td>
        
    </tr>

<%
i++;

}
rs.close();
objSql.close();
db.close();
%>

</table>

</div>


 </form>
