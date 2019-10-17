<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="/css/style.css" />
  
    <script type="text/javascript" src="/scripts/json2.js"></script>
    <script type="text/javascript" src="/sdk/js/canvas-all.js"></script>

    <title>Force.com Canvas Java Quick Start</title>
</head>

<body>
    <div id="content">
        <div class="content-header">
            <h2></h2>
            <h3>Canvasサンプルアプリケーション</h3>
            <p>Salesforce ログインユーザ名: <span id='username'>${canvasRequest.context.userContext.userName}</span></p>
            <p>操作対象レコードID: <span id='comp_id'>${canvasRequest.context.environmentContext.parameters.Id}</span></p>
        </div>

        <div class="content-subhedder">
            <h4>実行予定</h4>
            <jsp:include page="oppbranchlist.jsp"/>
        </div>
 
        <div id="footer">
            <div id="footerleft">
                <p>Powered By: <a title="Heroku" href="#" onclick="window.top.location.href='http://www.heroku.com'"><strong>Heroku</strong></a>
                </p>
            </div>
            <div id="footerright">
                <p>Salesforce: <a title="Safe Harbor" href="http://www.salesforce.com/company/investor/safe_harbor.jsp"><strong>SafeHarbor</strong></a>
                </p>
            </div>
        </div>
    </div>
</body>
</html>
