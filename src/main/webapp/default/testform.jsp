<script>
      function checkText() {
           //入力ボックスの内容を表示する
          alert( "対象レコードID: " + document.testform.ojbID.value + "\n申請内容："　+ document.testform.description.value );
 
      }
  </script>

<div>
<form name="testform" action="/default/finish.jsp" method="post">
    <p>申請対象レコードID：<input type="text" name="ojbID" value=${canvasRequest.context.environmentContext.record.Id}${canvasRequest.context.environmentContext.parameters.Id}></p>
    <p>申請内容：<input type="text" name="description"></p>
    <p>申請ステータス：
    <select name="appl_status">
      <option value=0>申請中</option>
      <option value=1>申請済</option>
      <option value=9>申請エラー</option>
    </select>
　　</p>
    <p><input type="submit" value="送信する"</p>
  </form>
</div>
