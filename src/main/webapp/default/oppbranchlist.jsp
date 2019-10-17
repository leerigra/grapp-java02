<%! 
  String plan_date1="2019/10/30";
  String plan_amount1="1,000,000";
  String plan_accuracy1="A";
  String create_date1="2019/10/15";

  String plan_date2="2019/11/20";
  String plan_amount2="2,000,000";
  String plan_accuracy2="B";
  String create_date2="2019/10/15";

  String plan_date3="2019/12/10";
  String plan_amount3="3,000,000";
  String plan_accuracy3="C";
  String create_date3="2019/10/15";
%>
<div class="content-data">
<table class="oppBrListTable">
    <tr>
        <th>実行／払込予定日</th>
        <th>実行／払込予定額（現通貨）</th>
        <th>実行／払込確度</th>
        <th>作成日時</th>
        <th>資金化への申請状況</th>
    </tr>
    
    <tr>
        <td class="center"><%= plan_date1%></td>
        <td class="right"><%= plan_amount1%></td>
        <td class="center"><%= plan_accuracy1%></td>
        <td class="right"><%= create_date1%></td>
        <td>申請中</td>
    </tr>

    <tr>
        <td class="center"><%= plan_date2%></td>
        <td class="right"><%= plan_amount2%></td>
        <td class="center"><%= plan_accuracy2%></td>
        <td class="right"><%= create_date2%></td>
        <td>&nbsp;</td>
    </tr>
    
    <tr>
        <td class="center"><%= plan_date3%></td>
        <td class="right"><%= plan_amount3%></td>
        <td class="center"><%= plan_accuracy3%></td>
        <td class="right"><%= create_date3%></td>
        <td>&nbsp;</td>
    </tr>
        
</table>
</div>
