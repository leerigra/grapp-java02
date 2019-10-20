/**
 * 行追加
 */
function insertRow(id) {
    // テーブル取得
    var table = document.getElementById(id);
    // 行を行末に追加
    var row = table.insertRow(-1);
    // セルの挿入
    var cell1 = row.insertCell(-1);
    var cell2 = row.insertCell(-1);
    var cell3 = row.insertCell(-1);
    var cell4 = row.insertCell(-1);
    var cell5 = row.insertCell(-1);
    var cell6 = row.insertCell(-1);
    var cell7 = row.insertCell(-1);
    
    

    // ボタン用 HTML
    var delButton = '<input type="button" value="行削除" onclick="deleteRow(this)" />';
    var inNumber='<input type="text" size="18" class="right" onfocus="offComma(this)" onblur="toComma(this)" />';
    var inSelect='<select><option value=""></option><option value="A">A</option> <option value="B">B</option> <option value="C">C</option> </select>'
    var inDate='<input type="string" size="10" />';
    // 行数取得
    var row_len = table.rows.length;
 
    // セルの内容入力
    cell1.innerHTML = "&nbsp;";
    cell2.innerHTML = "追加";
    cell3.innerHTML = inDate;
    cell4.innerHTML = inNumber;
    cell5.innerHTML = inSelect;
    cell6.innerHTML = "&nbsp;";
    cell7.innerHTML = delButton;

    cell1.setAttribute("class","hidden");
    cell2.setAttribute("class","center");
    cell3.setAttribute("class","left");
    cell4.setAttribute("class","right");
    cell5.setAttribute("class","center");
    cell6.setAttribute("class","left");
    cell7.setAttribute("class","center");
   

}

/**
 * 行削除
 */
function upddelRow(obj) {
    // 削除ボタンを押下された行を取得
    tr = obj.parentNode.parentNode;
    alert("消す？" + tr.cell2.innerHTML);
    if (tr.cell2.innerHTML==="削除") {
      tr.removeClass("delete_row");
    }else{
      // 論理削除的にグレーアウト
      tr.setAttribute("class","delete_row");
      tr.cell2.innerHTML="削除";
    }
}


/**
 * 行削除
 */
function deleteRow(obj) {
    // 削除ボタンを押下された行を取得
    tr = obj.parentNode.parentNode;
    // trのインデックスを取得して行を削除する
    tr.parentNode.deleteRow(tr.sectionRowIndex);
}

/**************************
 * カンマ編集を行うFunction
 **************************/
function toComma(obj){
  if((obj.value).trim().length != 0 && !isNaN(obj.value)){
    obj.value = Number(obj.value).toLocaleString();
  }
}

/**************************
 * カンマ編集を解除するFunction
 **************************/
function offComma(obj){
  var reg = new RegExp(",", "g");
  var chgVal = obj.value.replace(reg, "");
  if(!isNaN(chgVal)){
    obj.value = chgVal;  //値セット
    obj.select();        //全選択
  }
}


function selTableRow(pos)
	{
    var posId="tr_"+ pos

		document.getElementById(posId).style.backgroundColor="red";
		document.getElementById("tr2").style.backgroundColor="white";
		
	}

function btnCancel_Click()
{
  var result = window.confirm("入力内容を破棄してよろしいですか？");

  if( result ) {
      console.log('OKがクリックされました');
      location.reload();
      }
    else {
        console.log('キャンセルがクリックされました');
    }
}
function btnOK_click()
{
  var result = window.confirm("保存してよろしいですか？");

  if( result ) {
      console.log('OKがクリックされました');
      }
    else {
        console.log('キャンセルがクリックされました');
    }
}