<%@ page import="java.sql.*, javax.swing.JOptionPane, postgres.PostgresDB"
    contentType="text/html; charset=utf-8" %>
    <script type="text/javascript">
    alert("よばれた！");
    </script>
    <%
    // 内容: データベースにアクセスする
    // 入力された引数を取得する

    JOptionPane.showMessageDialog(null, "きたよ！");

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
    response.sendRedirect("oppbranchlist.jsp");
%>
