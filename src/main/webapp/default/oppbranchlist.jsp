<%! 
  String change_category1="";
  String plan_date1="2019/10/30";
  String plan_amount1="1,000,000";
  String plan_accuracy1="A";
  String create_date1="2019/10/15";

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
<div class="content-data">
<table class="oppBrListTable">
    <tr>
        <th>変更区分</th>
        <th>実行／払込予定日</th>
        <th>実行／払込予定額（原通貨）</th>
        <th>実行／払込確度</th>
        <th>作成日時</th>
    </tr>
    
    <tr>
        <td class="center"><%= change_category1%></td>
        <td class="left"><%= plan_date1%></td>
        <td class="right"><%= plan_amount1%></td>
        <td class="center"><%= plan_accuracy1%></td>
        <td class="left"><%= create_date1%></td>
    </tr>

    <tr>
        <td class="center"><%= change_category2%></td>
        <td class="left"><%= plan_date2%></td>
        <td class="right"><%= plan_amount2%></td>
        <td class="center"><%= plan_accuracy2%></td>
        <td class="left"><%= create_date2%></td>
    </tr>
    
    <tr>
        <td class="center"><%= change_category3%></td>
        <td class="left"><%= plan_date3%></td>
        <td class="right"><%= plan_amount3%></td>
        <td class="center"><%= plan_accuracy3%></td>
        <td class="left"><%= create_date3%></td>
    </tr>
        
</table>
</div>
