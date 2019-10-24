/**
 * 行追加
 */
function insertRow(id) {
    // テーブル取得
    var table = document.getElementById(id);
    // 行を行末に追加
    var row = table.insertRow(-1);
    row.setAttribute("onclick","tableClick(this)");

    // セルの挿入

    var cell_id  = row.insertCell(-1);
    var cell_status  = row.insertCell(-1);

    var cell_plan_Date  = row.insertCell(-1);
    var cell_plan_amount  = row.insertCell(-1);
    var cell_plan_accuracy  = row.insertCell(-1);

    var cell_create_date  = row.insertCell(-1);
    var cell_checkbox  = row.insertCell(-1);

    var cell_lst_netting  = row.insertCell(-1);
    var cell_lst_deduction = row.insertCell(-1);
    var cell_lst_difference = row.insertCell(-1);

    var cell_lst_plan_Date_upd = row.insertCell(-1);
    var cell_lst_plan_amount_upd = row.insertCell(-1);
    var cell_lst_plan_accuracy_upd = row.insertCell(-1);

    var cell_lst_netting_upd = row.insertCell(-1);
    var cell_lst_deduction_upd = row.insertCell(-1);
    var cell_lst_difference_upd = row.insertCell(-1);


    // ボタン用 HTML
    var delButton = '<input type="button" value="行削除" onclick="deleteRow(this)" />';
    var delCheckbox = '<input type="checkbox" name="chkdel" onclick="checkDel(this);" />';
    var inNumber='<input type="text" size="18" class="right" onfocus="offComma(this)" onblur="toComma(this)" ';
    var inSelect='<select><option value=""></option><option value="A">A</option> <option value="B">B</option> <option value="C">C</option> </select>'
    var inDate='<input type="string" size="10" />';
   
    // 行数取得
    var row_len = table.rows.length;

cell_id.setAttribute("id","lst_id_" + row_len);    
cell_id.setAttribute("class","hidden");
cell_id.innerHTML = "";

cell_status.setAttribute("id","lst_status_" + row_len);  
cell_status.setAttribute("class","center");  
cell_status.innerHTML ="追加";

cell_plan_Date.setAttribute("id","lst_plan_Date_" + row_len);  
cell_plan_Date.setAttribute("class","left"); 
cell_plan_Date.innerHTML  = inDate;

cell_plan_amount.setAttribute("id","lst_plan_amount_" + row_len);  
cell_plan_amount.setAttribute("class","right");  
cell_plan_amount.innerHTML  = inNumber+ " id='lst_plan_amount_" + row_len + "' />";

cell_plan_accuracy.setAttribute("id","lst_plan_accuracy_" + row_len);    
cell_plan_accuracy.setAttribute("class","center");

cell_plan_accuracy.innerHTML  = inSelect;

cell_create_date.setAttribute("id","lst_create_date_" + row_len);   
cell_create_date.setAttribute("class","left");    
cell_create_date.innerHTML = "";

cell_checkbox.setAttribute("id","lst_btn_" + row_len); 
cell_checkbox.setAttribute("class","center"); 
cell_checkbox.innerHTML = delButton; 

cell_lst_netting.setAttribute("id","lst_netting_"+ row_len);
cell_lst_netting.setAttribute("class","hidden");
cell_lst_netting.innerHTML = inNumber + " id='lst_netting_" + row_len + "' />";


cell_lst_deduction.setAttribute("id","lst_deduction_"+ row_len);
cell_lst_deduction.setAttribute("class","hidden");
cell_lst_deduction.innerHTML = inNumber + " id='lst_deduction_" + row_len + "' />";

cell_lst_difference.setAttribute("id","lst_difference_"+ row_len); 
cell_lst_difference.setAttribute("class","hidden");
cell_lst_difference.innerHTML = inNumber + " id='lst_difference_" + row_len + "' />";

cell_lst_plan_Date_upd.setAttribute("id","lst_plan_Date_upd_"+ row_len); 
cell_lst_plan_Date_upd.setAttribute("class","hidden");
cell_lst_plan_Date_upd.innerHTML = inDate;

cell_lst_plan_amount_upd.setAttribute("id","lst_plan_amount_upd_"+ row_len); 
cell_lst_plan_amount_upd.setAttribute("class","hidden"); 
cell_lst_plan_amount_upd.innerHTML = inNumber + " id='lst_amount_upd_" + row_len + "' />";

cell_lst_plan_accuracy_upd.setAttribute("id","lst_plan_accuracy_upd_"+ row_len); 
cell_lst_plan_accuracy_upd.setAttribute("class","hidden");
cell_lst_plan_accuracy_upd.innerHTML  = inSelect;

cell_lst_netting_upd.setAttribute("id","lst_netting_upd_"+ row_len); 
cell_lst_netting_upd.setAttribute("class","hidden"); 
cell_lst_netting_upd.innerHTML = inNumber + " id='lst_netting_upd_" + row_len + "' />";

cell_lst_deduction_upd.setAttribute("id","lst_deduction_upd_"+ row_len); 
cell_lst_deduction_upd.setAttribute("class","hidden");
cell_lst_deduction_upd.innerHTML = inNumber + " id='lst_deduction_upd_" + row_len + "' />";
 
cell_lst_difference_upd.setAttribute("id","lst_difference_upd_"+ row_len);     
cell_lst_difference_upd.setAttribute("class","hidden");
cell_lst_differenc_upd.innerHTML = inNumber + " id='lst_difference_upd_" + row_len + "' />";


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


function nvl(obj){
  if (obj == null) {
    obj = "";
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

//テーブルの背景色初期化
function resetTr(id) {
    // テーブル取得
    var table = document.getElementById(id);
    // 行数
    var rowcnt = table.rows.length;
    alert("行数：" + rowcnt);
    for(var i = 1; i < rowcnt-1; i++) {
      var trid = "tr_" + i;
      alert(document.getElementById(trid).classList.contains("sel_row"));
      document.getElementById(trid).classList.remove("sel_row");

      alert("おわった");
     
    }
  }

