<%@ page contentType="text/html; charset=utf-8" %>
<%@ page session="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% 
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

<table class="oppBrListTable" style="width: 100%;
border-collapse: collapse;
border-spacing: 0;
margin-left:10px;">
    <tr>
        <th>実行／払込予定日</th>
        <th>実行／払込予定額（現通貨）</th>
        <th>実行／払込確度</th>
        <th>作成日時</th>
    </tr>
    
    <tr>
        <td><%= plan_date1%></td>
        <td><%= plan_amount1%></td>
        <td><%= plan_accuracy1%></td>
        <td><%= create_date1%></td>
        <td><input type ="submit" name="btn1" value ="変更"></td>
    </tr>

    <tr>
        <td><%= plan_date2%></td>
        <td><%= plan_amount2%></td>
        <td><%= plan_accuracy2%></td>
        <td><%= create_date2%></td>
        <td><input type ="submit" name="btn2" value ="変更"></td>
    </tr>
    
    <tr>
        <td><%= plan_date3%></td>
        <td><%= plan_amount3%></td>
        <td><%= plan_accuracy3%></td>
        <td><%= create_date3%></td>
        <td><input type ="submit" name="btn3" value ="変更"></td>
    </tr>
        
</table>

