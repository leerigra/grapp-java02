<%@ page import="java.sql.*, postgres.PostgresDB"
    contentType="text/html; charset=utf-8" errorPage="/default/exException.jsp"%>

    <%
    // 内容: データベースにアクセスする
    // 入力された引数を取得する

  
    String in_strsql = request.getParameter("strsql");
    <script type="text/javascript">
        alert("SQL:"  + in_strsql);
    </script>
   // MyDBAccess のインスタンスを生成する
    PostgresDB db = new PostgresDB();
    %>
    <script type="text/javascript">
        alert("DBインスタンス");
        </script>
    
    <%
    // データベースへのアクセス
    db.open();
   %>
    <script type="text/javascript">
    alert("つながった");
    </script>

   <%
    // SQL文を実行
    db.execute(in_strsql);
 　%>
    // データベースへのコネクションを閉じる
    db.close();
 
    // 元のページへリダイレクト
    //response.sendRedirect("oppbranchlist.jsp");
%>
<html>
    <body>
        <p>できあがり！</p>
        <p>sqlは：<%=strsql%></p>
    </body>
</html>