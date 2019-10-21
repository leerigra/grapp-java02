<%@ page contentType="text/html; charset=Shift_JIS"
         import="java.sql.*,java.text.*" %>


<script type="text/javascript" src="/scripts/util.js"></script>
<script type="text/javascript">

function tableClick(tr){

  // クリックされた行を取得
  table = tr.parentNode;
  rowidx = tr.sectionRowIndex;
  alert("選択した行は：" + rowidx +". idは:" +table.rows[rowidx].cells[0].innerHTML);
 
  //選択された行のidをセットしてリロード
  oppbranchid = table.rows[rowidx].cells[0].innerHTML;
　tr.setAttribute("class","sel_row");
  document.getElementById('oppdetail')[0].contentDocument.location.reload(true);
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


<div class="content-data">
    <input type="button" class="table_btn" value="行追加" onclick="insertRow(BranchListDB)") />

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

while(rs.next()){

%>
      <tr onclick="tableClick(this)">
        <td class="hidden"><%= rs.getString("oppbranchid") %></td>
        <td class="center">&nbsp;</td>　    <!--選択肢：新規,変更,削除,取下-->
        <td onclick="alert('列クリック')" class="left"><input type="text" size="10" value=<%=objDtFmt.format(rs.getDate("plan_Date"))%> ></input></td>
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

</div>

<div id="iframeBlock">
    <div class="iframeBody">
        <iframe id="oppdetail" src="/default/oppbranchdetail.jsp?oppbranchid=<%= oppbranchid %>" name="testIframe" frameborder="0" width="800px" height="1500px"></iframe>
    </div>
</div>