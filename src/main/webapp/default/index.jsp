<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="/default/style.css" />
  
    <script type="text/javascript" src="/scripts/json2.js"></script>
    <script type="text/javascript" src="/sdk/js/canvas-all.js"></script>

    <title>Force.com Canvas Java Quick Start</title>
</head>

<body>
    <div id="content">
        <div id="content-header">
             <h2>xx</h2>
             <h3>Canvasサンプルアプリケーション</h3>
        </div>

        <div id="content-body">
            <h4>実行予定</h4>
            <jsp:include page="oppbranchlist.jsp"/>
            <h4>Salesforceからの送信データ</h4>
            <jsp:include page="context.jsp"/>
        </div>
 
        
        <div id="footercont">
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
