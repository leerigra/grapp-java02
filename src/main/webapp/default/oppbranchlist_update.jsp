<%@ page import="java.sql.*, postgres.PostgresDB"
    contentType="text/html; charset=euc-jp" %>
    <script type="text/javascript">
    alert("よばれた！");
    </script>
    <%
    // 内容: データベースにアクセスする
    // 入力された引数を取得する
    String comment = request.getParameter("strsql");
 
    // MyDBAccess のインスタンスを生成する
    PostgresDB db = new PostgresDB();
 
    // データベースへのアクセス
    db.open();
    %>

    <script type="text/javascript">
        alert("このSQL実行！！" + strsql);
    </script>
    <%
 
    // SQL文を実行
    db.execute(strsql);
 
    // データベースへのコネクションを閉じる
    db.close();
 
    // 元のページへリダイレクト
    response.sendRedirect("oppbranchlist.jsp");
%>
<script type="text/javascript">
alert("できた！");
</script>