using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SysManager_学院表 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void gv_XY_CustomErrorText(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCustomErrorTextEventArgs e)
    {
        if (e.Exception.ToString().Contains("PK_COLLEGE"))//捕获异常，主键不唯一
        {
            e.ErrorText = "重复的代码！";
        }
    }
    protected void btnNew_Click(object sender, EventArgs e)
    {
        gv_XY.AddNewRow();
    }
}