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
            <h2>
            <p class="right">
                Salesforce ログインユーザ名: <span id='username'>${canvasRequest.context.userContext.userName}</span><br/>
                操作対象レコードID: <span id='comp_id'>${canvasRequest.context.environmentContext.parameters.Id}</span>
            </p>
            </h2>
        </div>
        <br/>
        <div class="content-header">
            <h3>枝口リスト</h3>
            <div class="content-navi">
                <ul id="nav">
                    <li><a href="#">キャンセル</a></li>
                    <li><a href="#">保存</a></li>
                    <li><a href="#">行削除</a></li>
                    <li><a href="#">行追加</a></li>
                </ul>
            </div>
            <jsp:include page="oppbranchlist.jsp"/>
        </div>
        <br/>
        <div class="content-footer">
            <div class="footerleft">
                <p>Powered By: <a title="Heroku" href="#" onclick="window.top.location.href='http://www.heroku.com'"><strong>Heroku</strong></a>
                </p>
            </div>
            <div class="footerright">
                <p>Salesforce: <a title="Safe Harbor" href="http://www.salesforce.com/company/investor/safe_harbor.jsp"><strong>SafeHarbor</strong></a>
                </p>
            </div>
        </div>
    </div>
</body>
</html>
