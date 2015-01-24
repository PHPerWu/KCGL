using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DM_课程性质表 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void gv_课程性质_InitNewRow(object sender, DevExpress.Web.Data.ASPxDataInitNewRowEventArgs e)
    {
        e.NewValues["启用标志"] = "true";//默认值为true
    }
    protected void gv_课程性质_CustomErrorText(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCustomErrorTextEventArgs e)
    {
        if (e.Exception.ToString().Contains("PK_DM_COURSE_PROPERTY"))//捕获异常，主键不唯一
        {
            e.ErrorText = "重复的代码！";
        }
    }
    protected void btnNew_Click(object sender, EventArgs e)
    {
        gv_课程性质.AddNewRow();
    }
}