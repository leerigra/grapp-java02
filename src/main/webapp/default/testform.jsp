<script>
      function checkText() {
 
          //入力ボックスの内容を表示する
          alert( "対象レコードID: " + document.testform.ojbID + "\n申請内容："　+ document.testform.description );
 
      }
  </script>

<div>
<form name="testform" onsubmit="checkText()">
    <p>申請対象レコードID：<input type="text" name="ojbID" value=${canvasRequest.context.environmentContext.record.Id}>+${canvasRequest.context.environmentContext.parameters.Id}</p>
    <p>申請内容：<input type="text" name="description"></p>
    <p><input type="submit" value="送信する"></p>
  </form>
</div>
