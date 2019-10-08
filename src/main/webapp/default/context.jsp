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

<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script>
  Sfdc.canvas(function () {
    chatterTalk.init(sr, "chatter-submit", "speech-input-field", function (data) {
      Sfdc.canvas.byId('status').innerHTML = data.statusText;
      Sfdc.canvas.byId("speech-input-field").value = "";
    });
  });
</script>

<p><span id='title'>Heroku SampleApplication</span></p>
<p><span id='subtitle'>Salesforceからの送信データ</span></p>
<div id="sfdc_context">
  <table border="0" width="100%">
    <tr>
      <td><b>Salesforce Login User Name: </b></td>
      <td><span id='username'>${canvasRequest.context.userContext.userName}</span></td>
    </tr>
    <tr>
      <td><b>Salesforce Login UserID: </b></td>
      <td><span id='userId'>${canvasRequest.context.userContext.userId}</span></td>
    </tr>

    <c:if test="${!empty canvasRequest.context.environmentContext.record.Id}">
      <tr>
        <td><b>Object: </b></td>
        <td><span id='type'>${canvasRequest.context.environmentContext.record.attributes.type}</span></td>
      </tr>
      <tr>
        <td><b>Record ID: </b></td>
        <td><span id='Id'>${canvasRequest.context.environmentContext.record.Id}</span></td>
      </tr>
      <tr>
        <td><b>Name: </b></td>
        <td><span id='Name'>${canvasRequest.context.environmentContext.record.Name}</span></td>
      </tr>
      <tr>
        <td><b>Canvasの場所: </b></td>
        <td><span id='displayLocation'>${canvasRequest.context.environmentContext.displayLocation}</span></td>
      </tr>
    </c:if>
  </table>
</div>
<br>
<p><span id='subtitle'>Chatter Post</span></p>
<div id="canvas-chatter">
  <table width="100%">
    <tr>
      <td width="20%"><b>Post to Chatter:&nbsp</b></td>
      <td width="50%"><input id="speech-input-field" type="text" x-webkit-speech /></td>
      <td width="5%"><button id="chatter-submit" type="Post" /></td>
      <td width="10%"><span id="status" style="color:green"></span></td>
    </tr>
  </table>
</div>