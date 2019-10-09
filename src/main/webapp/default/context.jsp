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
POSSIBILITY OF SUCH DAMAGE. edit!
--%>

<div id="sfdc_context">
  <table border="0" width="100%">
    <tr>
      <td><b>Salesforce ログインユーザ名: </b></td>
      <td><span id='username'>${canvasRequest.context.userContext.userName}</span></td>
    </tr>
    <tr>
      <td><b>Salesforce ログインユーザID: </b></td>
      <td><span id='userId'>${canvasRequest.context.userContext.userId}</span></td>
    </tr>
    
    <c:if test="${!empty canvasRequest.context.environmentContext.record.Id}">
      <tr>
        <td><b>Salesforceオブジェクト: </b></td>
        <td><span id='type'>${canvasRequest.context.environmentContext.record.attributes.type}</span></td>
      </tr>
      <tr>
        <td><b>レコードID: </b></td>
        <td><span id='Id'>${canvasRequest.context.environmentContext.record.Id}</span></td>
      </tr>

      <tr>
        <td><b>Name?: </b></td>
        <td><span id='Name'>${canvasRequest.context.environmentContext.record.get("Name")}</span></td>
      </tr>
      
    </c:if>
  </table>
</div>
