<%@ page contentType="text/html; charset=Shift_JIS"
         import="java.sql.*,java.text.*" %>

<%
Class.forName("org.postgresql.Driver");
String url = "jdbc:postgresql://ec2-107-22-160-185.compute-1.amazonaws.com:5432/deck0jp8rljjoa";
String user = "uxsvvqdujoyrti";
String password = "2d989239c38338117217f11fbd0bfc7cca8d1a671c3f395a833e0eab7932050c";
String oppbranchid = request.getParameter("oppbranchid");
String strsql = "SELECT * FROM oppbranch where oppbranchid='" + oppbranchid + "'";

Connection db=DriverManager.getConnection(url, user, password);
db.setReadOnly(true);
Statement objSql=db.createStatement();
ResultSet rs=objSql.executeQuery(strsql);
rs.next();
DecimalFormat objFmt=new DecimalFormat("#,###");
SimpleDateFormat objDtFmt=new SimpleDateFormat("yyyy/MM/dd HH:mm");
%>
 
<script type="text/javascript" src="/scripts/util.js"></script>
 
<div class="content-data">

    <p>oppbranchid:<%= oppbranchid %></p>

    <table class="oppBrDetailTable" id="BranchDetailDB">
        <tr>
            <th>&nbsp;</th>
            <th>変更前</th>
            <th>変更後</th>
        </tr>
        <tr>
            <th class="colth">実行／払込予定日:</th>
            <td class="left"><%= objDtFmt.format(rs.getDate("plan_Date")) %> ></td>
            <td class="left"><input type="text" size="10" value=<%= objDtFmt.format(rs.getDate("plan_Date")) %> ></input></td>
        </tr>
        <tr>
            <th class="colth">実行払込予定額(現通貨):</th>
            <td class="right"><%= objFmt.format(rs.getLong("plan_amount")) %></td>
            <td class="right"><input type="text" size="18" class="right" value=<%= objFmt.format(rs.getLong("plan_amount")) %> onfocus="offComma(this)" onblur="toComma(this)" /></td>
        </tr>
        <tr>
            <th class="colth">実行／払込確度:</th>
            <td class="center"><%= rs.getString("plan_accuracy") %></td>
            <td class="center">
                <select name="plan_accuracy">
                    <option value=""></option>
                    <option value="A" <% if ("A".equals(rs.getString("plan_accuracy"))) { %>selected<% } %>>A</option>
                    <option value="B" <% if ("B".equals(rs.getString("plan_accuracy"))) { %>selected<% } %>>B</option>
                    <option value="C" <% if ("C".equals(rs.getString("plan_accuracy"))) { %>selected<% } %>>C</option>
                </select> 
            </td>
        </tr>
        <tr>
            <th class="colth">ネッティング額（現通貨）:</th>
            <td class="right"><%= objFmt.format(rs.getLong("plan_amount")) %></td>
            <td class="right"><input type="text" size="18" class="right" value=<%=objFmt.format(rs.getLong("plan_amount"))%> onfocus="offComma(this)" onblur="toComma(this)" /></td>
        </tr>
        <tr>
            <th class="colth">実行日控除額（現通貨）:</th>
            <td class="right"><%= objFmt.format(rs.getLong("plan_amount")) %></td>
            <td class="right"><input type="text" size="18" class="right" value=<%=objFmt.format(rs.getLong("plan_amount"))%> onfocus="offComma(this)" onblur="toComma(this)" /></td>
        </tr>
        <tr>
            <th class="colth">差額（現通貨）:</th>
            <td class="right"><%= objFmt.format(rs.getLong("plan_amount")) %></td>
            <td class="right"><input type="text" size="18" class="right" value=<%=objFmt.format(rs.getLong("plan_amount"))%> onfocus="offComma(this)" onblur="toComma(this)" /></td>
        </tr>

    </table>
    <div class="comment-data">
    備考：備考

    資金課担当者：　資金化　担当
　  承認／差戻コメント：　承認のコメント？
    </div>
<%
rs.close();
objSql.close();
db.close();
%>

</div>
