<!DOCTYPE html>


<html>
<head>
    <link rel="stylesheet" type="text/css" href="/css/style.css" />
    <link rel="stylesheet" type="text/css" href="/default/default${ua.device.mobile ? '-mobile':''}.css "/>
    <link rel="stylesheet" type="text/css" href="/default/tabs${ua.device.mobile ? '-mobile':''}.css" />
  
    <script type="text/javascript" src="/scripts/json2.js"></script>
    <script type="text/javascript" src="/sdk/js/canvas-all.js"></script>
    <script type="text/javascript" src="/default/tabs.js"></script>
    <script type="text/javascript" src="/scripts/chatter-talk.js"></script>

    <script>
        function resetSize(newDimensions) {
        	var options = newDimensions ? newDimensions : {};
            console.log("resize.");
            Sfdc.canvas.client.resize(sr.client,  {
            	width : options.width?options.width:"600px", 
      			height : options.height?options.height:"600px"
			});
        }

        var sr = JSON.parse('${canvasRequestJson}');
        Sfdc.canvas(function() {
            var photoUri = sr.context.user.profileThumbnailUrl +  "?oauth_token=" + sr.client.oauthToken;
            Sfdc.canvas.byId('header').style.backgroundImage =  "url('"+(photoUri.indexOf("http")==0 ? "" :sr.client.instanceUrl) + photoUri+"')";
            resetSize();
            initTabs();
        });
    </script>

</head>

<body>
    <div class="content">
        <div class="content-header">
            <h2>
            <p class="right">
                Salesforce ログインユーザ名: <span id='username'>${canvasRequest.context.userContext.userName}</span><br/>
                操作対象レコードID: <span id='comp_id'>${canvasRequest.context.environmentContext.parameters.Id}</span>
            </p>
            </h2>
        </div>
        <div class="content-body">

        <div class="tab-box">
            <a href="javascript:;" onclick="resetSize()" class="tabLink activeLink" id="c1">Canvas1</a>
            <a href="javascript:;" onclick="resetSize()" class="tabLink " id="c2">Canvas2</a>
        </div>

        <div class="tabcontent paddingAll" id="c1-1">
            <h3>実行予定①</h3>
            <jsp:include page="oppbranchlist.jsp">
                <jsp:param name="recid" value="${canvasRequest.context.environmentContext.parameters.Id}" />
            </jsp:include>
            <div class="content-navi">
                <ul>
                    <li class="btnCancel"><a class="linkCancel" href="javascript:void(0)" onclick="btnCancel_Click()">キャンセル</a></li>
                    <li class="btnOK"><a class="linkOK" href="javascript:void(0)" onclick="btnOK_click()">保存</a></li>
                </ul>
            </div>
        </div>

        <div class="tabcontent paddingAll hide" id="c2-1">
            <h3>実行予定②</h3>
            <jsp:include page="oppbranchlist01.jsp">
                 <jsp:param name="recid" value="${canvasRequest.context.environmentContext.parameters.Id}" />
            </jsp:include>
            <div class="content-navi">
                <ul>
                    <li class="btnCancel"><a class="linkCancel" href="javascript:void(0)" onclick="btnCancel_Click()">キャンセル</a></li>
                    <li class="btnOK"><a class="linkOK" href="javascript:void(0)" onclick="btnOK_click()">保存</a></li>
                </ul>
            </div>
        </div>

        
 

            
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
