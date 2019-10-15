<%@ page contentType="text/html; charset=utf-8" %>
<%@ page session="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<body>

<table id=oppBranchList>
    <tr id=oppBranchList>
        <th>実行／払込予定日</th>
        <th>実行／払込予定額（現通貨）</th>
        <th>実行／払込確度</th>
        <th>作成日時</th>
    </tr>
    
    <tr id=oppBranchList>
        <td><input type="date" name="plan_date1" value="2019-10-30"></td>
        <td><input type="number" name="plan_amount1" value="10000000"></td>
        <td><input type="text" name="plan_accuracy" value="A"></td>
        <td><input type="date" name="create_date1" value="2019-10-15"></td>
    </tr>

    <tr id=oppBranchList>
        <td><input type="date" name="plan_date2" value="2019-11-20"></td>
        <td><input type="number" name="plan_amount2" value="20000000"></td>
        <td><input type="text" name="plan_accuracy2" value="B"></td>
        <td><input type="date" name="create_date2" value="2019-10-15"></td>
    </tr>
    
    <tr id=oppBranchList>
        <td><input type="date" name="plan_date3" value="2019-12-10"></td>
        <td><input type="number" name="plan_amount3" value="30000000"></td>
        <td><input type="text" name="plan_accuracy3" value="C"></td>
        <td><input type="date" name="create_date3" value="2019-10-15"></td>
    </tr>
        
</table>
<br/>



</body>
</html>