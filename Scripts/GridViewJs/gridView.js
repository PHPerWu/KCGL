function addInfo(gv, e) {
    gv.AddNewRow();
    e.processOnServer = false;
}

function deleteConfirm(load, e) {
    if (confirm("删除此条信息，将连带删除其拥有的所有子信息，确认删除吗？")) {
        load.Show();
        e.processOnServer = true;
    }
    else {
        e.processOnServer = false;
    }
}

function auditConfirm(load, e) {
    if (confirm("送审后将不能修改该数据，确认送审吗？")) {
        load.Show();
        e.processOnServer = true;
    }
    else {
        e.processOnServer = false;
    }
}

function cancelEditInfo(gv, e) {
    gv.CancelEdit();
    e.processOnServer = false;
}

function showLoading(load) {
    load.Show();
}

//function OnProgressChanged(cmbProgress,cmbTBQS) {
//    cmbTBQS.PerformCallback(cmbProgress.GetValue().toString());
//}

function PassConfirm(load, e, str) {
    if (confirm(str)) {
        load.Show();
        e.processOnServer = true;
    }
    else {
        e.processOnServer = false;
    }
}

function NotPassConfirm(load, str, txt_Name, txt_Phone, Memo, e) {
    if (txt_Name.isValid && txt_Phone.isValid && Memo.isValid) {
        if (confirm(str)) {
            e.processOnServer = true;
            load.Show();
        }
        else {
            e.processOnServer = false;
        }
    }
}