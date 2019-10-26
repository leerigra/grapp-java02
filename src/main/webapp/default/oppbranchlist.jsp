<%@ page contentType="text/html; charset=utf-8"
         import="java.sql.*,java.text.*" %>


<script type="text/javascript" src="/scripts/util.js"></script>
<script type="text/javascript">

function tableClick(tr){

  //選択状態をクリア  
  resetTr("BranchListDB");

  // クリックされた行を取得
  table = tr.parentNode;
  rowidx = tr.sectionRowIndex;
  sel_status_id ="lst_status_"+ rowidx;
  sel_plan_Date_id = "lst_plan_Date_" + rowidx;
  sel_plan_amount_id = "lst_plan_amount_" + rowidx;
  sel_plan_accuracy_id = "lst_plan_accuracy_" + rowidx;
  sel_netting_id = "lst_netting_" + rowidx;
  sel_deduction_id = "lst_deduction_" + rowidx;
  sel_difference_id = "lst_difference_" + rowidx;

  sel_plan_Date_id_upd = "lst_plan_Date_upd_" + rowidx;
  sel_plan_amount_id_upd = "lst_plan_amount_upd_" + rowidx;
  sel_plan_accuracy_id_upd = "lst_plan_accuracy_upd_" + rowidx;
  sel_netting_id_upd = "lst_netting_upd_" + rowidx;
  sel_deduction_id_upd = "lst_deduction_upd_" + rowidx;
  sel_difference_id_upd = "lst_difference_upd_" + rowidx;


  tr.setAttribute("class","sel_row");

   //選択された行のidをセットして詳細表示
  document.getElementById( "sel_oppbranchid" ).value = table.rows[rowidx].cells[0].innerHTML;
  document.getElementById( "status_b" ).innerHTML = table.rows[rowidx].cells[1].innerHTML;
  
  document.getElementById( "plan_Date_b" ).innerHTML =  table.rows[rowidx].cells[2].innerHTML;
  document.getElementById( "plan_amount_b" ).innerHTML =  table.rows[rowidx].cells[3].innerHTML;
  document.getElementById( "plan_accuracy_b" ).innerHTML =  table.rows[rowidx].cells[4].innerHTML;
  
  document.getElementById( "netting_b" ).innerHTML = document.getElementById(sel_netting_id).innerHTML;
  document.getElementById( "deduction_b" ).innerHTML = document.getElementById(sel_deduction_id).innerHTML;
  document.getElementById( "difference_b" ).innerHTML = document.getElementById(sel_difference_id).innerHTML;
   
  document.getElementById( "plan_Date_a" ).value = document.getElementById(sel_plan_Date_id_upd).innerHTML;
  document.getElementById( "plan_amount_a" ).value = document.getElementById(sel_plan_amount_id_upd).innerHTML;
  document.getElementById( "plan_accuracy_a" ).value = document.getElementById(sel_plan_accuracy_id_upd).innerHTML;
  document.getElementById( "netting_a" ).value = document.getElementById(sel_netting_id_upd).innerHTML;
  document.getElementById( "deduction_a" ).value = document.getElementById(sel_deduction_id_upd).innerHTML;
  document.getElementById( "difference_a" ).value = document.getElementById(sel_difference_id_upd).innerHTML;


}
</script>

<%
Class.forName("org.postgresql.Driver");
String url = "jdbc:postgresql://ec2-107-22-160-185.compute-1.amazonaws.com:5432/deck0jp8rljjoa";
String user = "uxsvvqdujoyrti";
String password = "2d989239c38338117217f11fbd0bfc7cca8d1a671c3f395a833e0eab7932050c";
String recid = request.getParameter("recid");
String ses_oppid = (String) session.getAttribute("sel_oppid");
if((recid == null || recid.isEmpty()) && (ses_oppid != null || !ses_oppid.isEmpty())){
    recid = ses_oppid ;
}
if((recid != null || !recid.isEmpty()) && (ses_oppid == null || ses_oppid.isEmpty())) {
    session.setAttribute("sel_oppid", recid);
}

String strsql = "SELECT oppbranchid,COALESCE(status, '') as status,plan_date,plan_date_edit,plan_amount,plan_amount_edit,plan_accuracy,plan_accuracy_edit,create_date,update_date,COALESCE(netting,0) as netting,COALESCE(netting_edit,0) as netting_edit,COALESCE(deduction,0) as deduction,COALESCE(deduction_edit,0) as deduction_edit,COALESCE(netting,0)-COALESCE(deduction,0) as difference, COALESCE(netting_edit,0)-COALESCE(deduction_edit,0) as difference_edit FROM oppbranch where extid='" + recid + "' AND del_flg = false";

DecimalFormat objFmt=new DecimalFormat("#,###");

%>
<form id="fm_opplist" action="/default/oppbranchlist_update.jsp" method="POST">
<div class="content-data">
    <input type="hidden" id="sel_oppid" value="<%= recid %>" />
    <input type="hidden" id="session_oppid" value="<%= ses_oppid %>" />
    
    <input type="hidden" id="sel_oppbranchid"/>
    <input type="hidden" id="sendsql" name="sendsql"/>
    <input type="button" class="table_btn" value="行追加" onclick="insertRow('BranchListDB')"  />
    <div class="section-title"><h4>枝口リスト</h4></div>
    <table class="oppBrListTable" id="BranchListDB" >
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
int i = 1;

while(rs.next()){
%>
      <tr id="<%="tr_" + String.valueOf(i) %>" onclick="tableClick(this)">
        <td class="hidden" id="<%="lst_id_" + String.valueOf(i) %>" ><%= rs.getString("oppbranchid") %></td>
        <td class="center"id="<%="lst_Status_" + String.valueOf(i) %> "><%= rs.getString("status") %></td>　    <!--選択肢：新規,変更,削除,取下-->
        <td class="left" id="<%="lst_plan_Date_" + String.valueOf(i) %> "><%= rs.getDate("plan_Date") %></td>
        <td class="right" id="<%="lst_plan_amount_" + String.valueOf(i) %> "><%= objFmt.format(rs.getLong("plan_amount")) %></td>
        <td class="center" id="<%="lst_plan_accuracy_" + String.valueOf(i) %> "><%= rs.getString("plan_accuracy") %></td>
        <td class="left"><%= rs.getDate("create_date") %></td>

        <td class="center" nowrap><input type="button" value="行削除" onclick="deleteRow(this)" /></td>
        <td class="hidden" id="<%="lst_netting_" + String.valueOf(i) %>" ><%= objFmt.format(rs.getLong("netting")) %></td>
        <td class="hidden" id="<%="lst_deduction_" + String.valueOf(i) %>" ><%= objFmt.format(rs.getLong("deduction")) %></td>
        <td class="hidden" id="<%="lst_difference_" + String.valueOf(i) %>" ><%= objFmt.format(rs.getLong("difference")) %></td>

        <td class="hidden" id="<%="lst_plan_Date_upd_" + String.valueOf(i) %>" ><%= rs.getDate("plan_Date_edit") %></td>
        <td class="hidden" id="<%="lst_plan_amount_upd_" + String.valueOf(i) %>" ><%= objFmt.format(rs.getLong("plan_amount_edit"))%></td>
        <td class="hidden" id="<%="lst_plan_accuracy_upd_" + String.valueOf(i) %>"><%= rs.getString("plan_accuracy_edit") %></td>
       
        <td class="hidden" id="<%="lst_netting_upd_" + String.valueOf(i) %>" ><%= objFmt.format(rs.getLong("netting_edit")) %></td>
        <td class="hidden" id="<%="lst_deduction_upd_" + String.valueOf(i) %>" ><%= objFmt.format(rs.getLong("deduction_edit")) %></td>
        <td class="hidden" id="<%="lst_difference_upd_" + String.valueOf(i) %>" ><%= objFmt.format(rs.getLong("difference_edit")) %></td>
         
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

<div class="content-data">

    <div class="section-title"><h4>枝口情報更新</h4></div>
    <p>変更区分：<span id ="status_b"></span></p>
    <table class="oppBrDetailTable" id="BranchDetailDB">
        <tr>
            <th>&nbsp;</th>
            <th>変更前</th>
            <th>変更後</th>
        </tr>
        <tr>
            <td class="colth">実行／払込予定日:</td>
            <td class="left" id="plan_Date_b"></td>
            <td class="right"><input type="text" id="plan_Date_a" size="18" class="left" /></td>
        </tr>
        <tr>
            <td class="colth">実行払込予定額(現通貨):</td>
            <td class="right" id="plan_amount_b"></td>
            <td class="right"><input type="text" id="plan_amount_a" size="18" class="right" onfocus="offComma(this)" onblur="toComma(this)"/></td>
        </tr>

        <tr>
            <td class="colth">確度:</td>
            <td class="right" id="plan_accuracy_b"></td>
            <td class="right">
                <select name="plan_accuracy" id="plan_accuracy_a">">
                    <option value=""></option>
                    <option value="A">A</option>
                    <option value="B">B</option>
                    <option value="C">C</option>
                </select> 
            </td>
        </tr>
 
        <tr>
            <td class="colth">ネッティング額（現通貨）:</td>
            <td class="right" id="netting_b"></td>
            <td class="right"><input type="text" id="netting_a" size="18" class="right" onfocus="offComma(this)" onblur="toComma(this)" /></td>
        </tr>
        <tr>
            <td class="colth">実行日控除額（現通貨）:</td>
            <td class="right" id="deduction_b"></td>
            <td class="right"><input type="text" id="deduction_a" size="18" class="right" onfocus="offComma(this)" onblur="toComma(this)" /></td>
        </tr>
        <tr>
            <td class="colth">差額（現通貨）:</td>
            <td class="right" id="difference_b"></td>
            <td class="right"><input type="text" id="difference_a"size="18" class="right" onfocus="offComma(this)" onblur="toComma(this)" /></td>
        </tr>

    </table>
</div>
<div class="content-data">
    <!--<table class="oppBrDetailTable" id="BranchDetailmemo">
        <tr>
            <td class="colth">備考:</td>
            <td class="left"><textarea id="description" rows="10" cols="50"></textarea></td>
        </tr>
    
    </table-->
</div>
<div class="content-data">
    <div class="section-title"><h4>資金課 確認状況</h4></div>
    <table class="oppBrDetailTable" id="BranchDetailApproval">
        <tr>
            <td class="colth">資金課への申請状況</td>
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

 <div class="content-navi">
     <ul>
        <li class="btnCancel"><a class="linkCancel" href="javascript:void(0)" onclick="btnCancel_Click()">キャンセル</a></li>
        <li class="btnOK"><a class="linkOK" href="javascript:void(0)" onclick="btnOK_click()">保存</a></li>
    </ul>
</div>

</form>
