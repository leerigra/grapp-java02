<div>
<form method="POST" action="finish.jsp">
    <p>申請対象レコードID：<input type="text" name="ojbID" value=${canvasRequest.context.environmentContext.record.Id}></p>
    <p>申請内容：<input type="text" name="description"></p>
    <p><input type="submit" value="送信する"></p>
  </form>
</div>
