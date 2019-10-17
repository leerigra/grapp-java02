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
        <div class="content-navi">
            <ul id="nav">
                <li><a href="#">MENU1</a></li>
                <li><a href="#">MENU2</a></li>
                <li><a href="#">MENU3</a></li>
            <li><a href="#">MENU4</a></li>
            </ul>
        </div>
        <div class="content-subhedder">
            <h4>口情報</h4>
            <jsp:include page="oppinfo.jsp"/>
        </div>

        <div class="content-subhedder">
            <h4>実行予定</h4>
h1に入れ子でボタンを配置して、h1にposition relativeを指定、ボタンにposition absoluteで位置指定すれば良いです。


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
