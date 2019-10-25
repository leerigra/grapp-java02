<%@ page import="java.sql.*, postgres.PostgresDB"
    contentType="text/html; charset=utf-8" errorPage="default/exException.jsp"%>

    <%
    // 内容: データベースにアクセスする
    // 入力された引数を取得する

  
    String comment = request.getParameter("strsql");
 
    // MyDBAccess のインスタンスを生成する
    PostgresDB db = new PostgresDB();
 
    // データベースへのアクセス
    db.open();
   
    // SQL文を実行
    db.execute(strsql);
 
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