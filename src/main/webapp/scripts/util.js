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
    var delCheckbox = '<input type="checkbox" name="chkdel" onclick="checkDel(this);" />';
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
    cell7.innerHTML = delCheckbox;

    cell1.setAttribute("class","hidden");
    cell2.setAttribute("class","center");
    cell3.setAttribute("class","left" );
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
    //if (tr.cell2.innerHTML === "削除") {
    //  tr.removeClass("delete_row");
    //} else {
      // 論理削除的にグレーアウト
      tr.setAttribute("class","delete_row");
      tr.cell2.innerHTML = "削除";

      //}
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


function checkDel(obj) {
  // 削除チェックボックスがクリックされた行を取得
  tr = obj.parentNode.parentNode;
  table = tr.parentNode;
　rowidx = tr.sectionRowIndex;

  if (obj.checked==true){
    
    // 論理削除的にグレーアウト
    tr.setAttribute("class","delete_row");
    table.rows[rowidx].cells[1].innerHTML="削除";
  
  }else{
  
    tr.removeAttribute("class","delete_row");
    
    if (table.rows[rowidx].cells[0].innerHTML==""){
      table.rows[rowidx].cells[1].innerHTML="追加";
    } else {
    table.rows[rowidx].cells[1].innerHTML="";
    }
  }
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


function tableClick(obj){

  // 削除チェックボックスがクリックされた行を取得
  tr = obj.parentNode.parentNode;
  table = tr.parentNode;
  rowidx = tr.sectionRowIndex;
 
  //選択された行の値を全部セット 

  sel_recid = table.rows[rowidx].cells[0].innerHTML;
  sel_plan_Date_b= table.rows[rowidx].cells[2].innerHTML;
  sel_plan_Date_a = table.rows[rowidx].cells[2].innerHTML;
  sel_plan_amount_b = table.rows[rowidx].cells[3].innerHTML;
  sel_plan_amount_a = table.rows[rowidx].cells[3].innerHTML;
  sel_plan_accuracy_b = table.rows[rowidx].cells[4].innerHTML;
  sel_plan_accuracy_a = table.rows[rowidx].cells[4].innerHTML;
  
}

function reloadDetail(detailid){
  document.getElementById('iframe_id')[0].contentDocument.location.reload(true);
}