<%! 
  String change_category1="";
  String plan_date1="2019/10/30";
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

<script type="text/javascript" src="/scripts/util.js"></script>
 
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
        <td class="left"><input type="text" value=<%= plan_date1 %>/></td>
        <td class="right"><input type="text" class="right" value=<%= plan_amount1 %> onfocus="offComma(this)" onblur="toComma(this)" /></td>
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
        <td class="left"><input type="text" value=<%= plan_date2 %>/></td>
        <td class="right"><input type="text" class="right" value=<%= plan_amount3 %> onfocus="offComma(this)" onblur="toComma(this)" /></td>
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
        <td class="left"><input type="text" value=<%= plan_date3 %>/></td>
        <td class="right"><input type="text" class="right" value=<%= plan_amount3 %> onfocus="offComma(this)" onblur="toComma(this)" /></td>
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
