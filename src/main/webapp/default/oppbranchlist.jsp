<%! 
  String change_category1="";
  String plan_date1="2019-10-30";
  String plan_amount1="1,000,000";
  String plan_accuracy1="A";
  String create_date1="2019-10-15";

  String change_category2="";
  String plan_date2="2019/11/20";
  String plan_amount2="2,000,000";
  String plan_accuracy2="B";
  String create_date2="2019/10/15";

  String change_category3="新規";
  String plan_date3="2019/12/10";
  String plan_amount3="3,000,000";
  String plan_accuracy3="C";
  String create_date3="2019/10/15";


%>

<script>
/**
 * 行追加
 */
function insertRow(id) {
    // テーブル取得
    var table = document.getElementById(id);
    // 行を行末に追加
    var row = table.insertRow(-1);
    // セルの挿入
    var cell1 = row.insertCell(-1);
    var cell2 = row.insertCell(-1);
    var cell3 = row.insertCell(-1);
    var cell4 = row.insertCell(-1);
    var cell5 = row.insertCell(-1);
    var cell6 = row.insertCell(-1);
    

    // ボタン用 HTML
    var delButton = '<input type="button" value="行削除" onclick="deleteRow(this)" />';
    var inText='<input type="text" onfocus="offComma(this)" onblur="toComma(this)" />';
    var inSelect='<select><option value=""></option><option value="A">A</option> <option value="B">B</option> <option value="C">C</option> </select>'
    var inDate='<input type="date"/>';
    // 行数取得
    var row_len = table.rows.length;
 
    // セルの内容入力
    cell1.innerHTML = "追加";
    cell2.innerHTML = inDate;
    cell3.innerHTML = inText;
    cell4.innerHTML = inSelect;
    cell5.innerHTML = "&nbsp;";
    cell6.innerHTML = delButton;

    cell1.setAttribute("class","center");
    cell2.setAttribute("class","left");
    cell3.setAttribute("class","right");
    cell4.setAttribute("class","center");
    cell5.setAttribute("class","left");
   

}
 
/**
 * 行削除
 */
function deleteRow(obj) {
    // 削除ボタンを押下された行を取得
    tr = obj.parentNode.parentNode;
    // trのインデックスを取得して行を削除する
    tr.parentNode.deleteRow(tr.sectionRowIndex);
}

/**************************
 * カンマ編集を行うFunction
 **************************/
function toComma(obj){
  if((obj.value).trim().length != 0 && !isNaN(obj.value)){
    obj.value = Number(obj.value).toLocaleString();
  }
}
 
/**************************
 * カンマ編集を解除するFunction
 **************************/
function offComma(obj){
  var reg = new RegExp(",", "g");
  var chgVal = obj.value.replace(reg, "");
  if(!isNaN(chgVal)){
    obj.value = chgVal;  //値セット
    obj.select();        //全選択
  }
}
</script>

<input type="button" value="行追加" onclick="insertRow('BranchList')" />
<div class="content-data">
<table class="oppBrListTable" id="BranchList">
    <tr>
        <th>変更区分</th>
        <th>実行／払込予定日</th>
        <th>実行／払込予定額（原通貨）</th>
        <th>実行／払込確度</th>
        <th>作成日時</th>
        <th>削除</th>
    </tr>
    
    <tr>
        <td class="center"><%= change_category1 %></td>
        <td class="left"><input type="date" value=<%= plan_date1 %>/></td>
        <td class="right"><input type="text" value=<%= plan_amount1 %> onfocus="offComma(this)" onblur="toComma(this)" /></td>
        <td class="center">
            <select name="plan_accuracy1">
                <option value=""></option>
                <option value="A" selected>A</option>
                <option value="B">B</option>
                <option value="C">C</option>
            </select> 
        </td>
        <td class="left"><%= create_date1%></td>
        <td nowrap><input type="button" value="行削除" onclick="deleteRow(this)" /></td>
    </tr>
    <tr>
        <td class="center"><%= change_category2 %></td>
        <td class="left"><%= plan_date2 %></td>
        <td class="right"><%= plan_amount2 %></td>
        <td class="center">
            <select name="plan_accuracy2">
                <option value=""></option>
                <option value="A">A</option>
                <option value="B" selected>B</option>
                <option value="C">C</option>
            </select> 
        </td>
        <td class="left"><%= create_date2 %></td>
        <td nowrap><input type="button" value="行削除" onclick="deleteRow(this)" /></td>
    </tr>
    <tr>
        <td class="center"><%= change_category3 %></td>
        <td class="left"><%= plan_date3 %></td>
        <td class="right"><%= plan_amount3 %></td>
       <td class="center">
            <select name="plan_accuracy3">
                <option value=""></option>
                <option value="A">A</option>
                <option value="B">B</option>
                <option value="C" selected>C</option>
            </select> 
        </td>
        <td class="left"><%= create_date3 %></td>
        <td nowrap><input type="button" value="行削除" onclick="deleteRow(this)" /></td>
    </tr>
        
</table>
</div>
