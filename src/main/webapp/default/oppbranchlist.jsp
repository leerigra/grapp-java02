<%@ page contentType="text/html; charset=Shift_JIS"
         import="java.sql.*,java.text.*" %>


<script type="text/javascript" src="/scripts/util.js"></script>
<script type="text/javascript">

function tableClick(tr){

  // クリックされた行を取得
  table = tr.parentNode;
  rowidx = tr.sectionRowIndex;
  alert("選択した行は：" + rowidx +". idは:" +table.rows[rowidx].cells[0].innerHTML);
  tr.setAttribute("class","sel_row");
  
  //選択された行のidをセットしてリロード
  document.getElementById( "sel_oppbranchid" ).value = table.rows[rowidx].cells[0].innerHTML;

    document.getElementById( "col1_a" ).value = table.rows[rowidx].cells[2].value;
    document.getElementById( "col2_a" ).value = table.rows[rowidx].cells[3].value;
    document.getElementById( "col3_a" ).value = table.rows[rowidx].cells[4].value;
    document.getElementById( "col4_a" ).value = table.rows[rowidx].cells[5].value;
    document.getElementById( "col5_a" ).value = table.rows[rowidx].cells[6].value;
    document.getElementById( "col6_a" ).value = table.rows[rowidx].cells[7].value;

    document.getElementById( "col1_b" ).value = table.rows[rowidx].cells[2].innerHTML;
    document.getElementById( "col2_b" ).value = table.rows[rowidx].cells[3].innerHTML;
    document.getElementById( "col3_b" ).value = table.rows[rowidx].cells[4].innerHTML;
    document.getElementById( "col4_b" ).value = table.rows[rowidx].cells[5].innerHTML;
    document.getElementById( "col5_b" ).value = table.rows[rowidx].cells[6].innerHTML;
    document.getElementById( "col6_b" ).value = table.rows[rowidx].cells[7].innerHTML;



  reloadurl ="/default/oppbranchdetail.jsp?oppbranchid=" + table.rows[rowidx].cells[0].innerHTML;
  //document.getElementById('oppdetail')[0].contentDocument.location.reload(true);
  document.getElementById("sel_oppbranchid").contentDocument.location.replace(reloadurl);
}
</script>

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
        <td class="hidden"><%= rs.getString("oppbranchid") %></td>
        <td class="center">&nbsp;</td>　    <!--選択肢：新規,変更,削除,取下-->
        <td onclick="alert('列クリック')" class="left"><input type="text" size="10" id=<%="col2_" + String.valueOf(i) %> value=<%=objDtFmt.format(rs.getDate("plan_Date"))%> ></input></td>
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
i++;

}
rs.close();
objSql.close();
db.close();
%>

</table>

</div>

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
            <td class="left" id="col1_b"></td>
            <td class="right"><input type="text" id="col1_a"/></td>
        </tr>
        <tr>
            <td class="colth">実行払込予定額(現通貨):</td>
            <td class="right" id="col2_b"></td>
            <td class="right"><input type="text" id="col2_a"/></td>
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
 </form>
