
<%-- (1)exceptionオブジェクトを使用するためisErrorPage属性を指定しています。 --%>
<%@ page contentType="text/html; charset=windows-31j"
    isErrorPage="true"%>

<html>
<body>

<%
    out.println("例外処理JSPプログラム");
    out.println("<BR><BR>");

    //(2)スローされた例外の簡潔な情報を
    //   toStringメソッドを使用して表示します。
    out.println(exception.toString());
%>

</body>
</html>