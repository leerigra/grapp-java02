<%@ page import="java.sql.*, servlet.PostgresDB"
    contentType="text/html; charset=euc-jp" %>
    <%
    // 内容: データベースにアクセスする
    // 入力された引数を取得する
    String comment = request.getParameter("strsql");
 
    // MyDBAccess のインスタンスを生成する
    PostgresDB db = new PostgresDB();
 
    // データベースへのアクセス
    db.open();
 
    // データベース更新用のSQL文を作成
    String sql = "update member set comment='" + comment
            + "', attendance=" + attendance
            + " where member_id=" + member_id;
 
    // SQL文を実行
    db.execute(strsql);
 
    // データベースへのコネクションを閉じる
    db.close();
 
    // 元のページへリダイレクト
    response.sendRedirect("oppbranchlist.jsp");
%>