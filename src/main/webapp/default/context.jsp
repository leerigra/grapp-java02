<%--
Copyright (c) 2013, salesforce.com, inc.
All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided
that the following conditions are met:

Redistributions of source code must retain the above copyright notice, this list of conditions and the
following disclaimer.

Redistributions in binary form must reproduce the above copyright notice, this list of conditions and
the following disclaimer in the documentation and/or other materials provided with the distribution.

Neither the name of salesforce.com, inc. nor the names of its contributors may be used to endorse or
promote products derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED
WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED
TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
POSSIBILITY OF SUCH DAMAGE.
--%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<p>
これはHerokuのサンプルアプリケーションです
</p>
<p>
Salesforceから連携されたデータ:
</p>
<table border="0" width="100%">

    <tr>
      <td><b>Salesforceのログインユーザ名: </b></td>
      <td><span id='username'>${canvasRequest.context.userContext.userName}</span></td>
    </tr>
    <tr>
      <td><b>SalesforceのログインユーザID: </b></td>
      <td><span id='userId'>${canvasRequest.context.userContext.userId}</span></td>
    </tr>
    <c:if test="${!empty canvasRequest.context.environmentContext.record.Id}" >
      <tr>
        <td colspan="2">参照しているオブジェクト <b>${canvasRequest.context.environmentContext.record.attributes.type}
        <td colspan="2">参照しているオブジェクト <b>${canvasRequest.context.environmentContext.record.attributes.url}
      </tr>
      <tr>
        <td colspan="2">レコードID <b>${canvasRequest.context.environmentContext.record.Id}</b></td>
      </tr>
      <tr>
        <td colspan="2">Name <b>${canvasRequest.context.environmentContext.record.Name}</b></td>
      </tr>
      <tr>
        <td colspan="2">Canvas使用場所 <b>${canvasRequest.context.environmentContext.displayLocation}</b></td>
      </tr>
      <tr>
        <td><b>${canvasRequest.context.environmentContext.version.api}</b></td>
      </tr>
    </c:if>
    
</table>
