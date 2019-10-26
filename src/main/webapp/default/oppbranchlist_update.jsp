<%@ page import="java.sql.*, postgres.PostgresDB"
    contentType="text/html; charset=utf-8" errorPage="/default/exException.jsp"%>

    <%
    // 内容: データベースにアクセスする
    // 入力された引数を取得する
    String in_oppid = request.getParameter("sel_oppid");
    String in_strsql = request.getParameter("sendsql");
    if(in_strsql != null) {
 
        // MyDBAccess のインスタンスを生成する
        PostgresDB db = new PostgresDB();
 
        // データベースへのアクセス
        db.open();
    
        // SQL文を実行
        db.execute(in_strsql);
 
        // データベースへのコネクションを閉じる
        db.close();

        // 元のページへリダイレクト
        response.sendRedirect("index.jsp");
        
    }
%>
<html>
    <body>
        <p>エラーかも！</p>
        <p>sqlは：<%=in_strsql%></p>
    </body>
</html>