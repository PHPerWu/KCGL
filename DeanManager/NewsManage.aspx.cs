using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SYS_NewsManage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            gvNews.UpdateEdit();
            ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('保存成功');", true);
        }
        catch (Exception ex)
        {
            string strErrorTemp = ex.Message;
            if (ex.InnerException != null)
            {
                strErrorTemp += ex.InnerException.Message;
            }
            ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('保存失败\\r\\n\\r\\n错误：" + strErrorTemp.Replace("\r\n", "\\r\\n") + "');", true);

        }
        ScriptManager.RegisterStartupScript(this, GetType(), "", "cl_ldpalLoading.Hide();", true);
    }

    protected void btnPublish_Command(object sender, CommandEventArgs e)
    {
        try
        {
            MainDataSetTableAdapters.TA_新闻表TableAdapter ta = new MainDataSetTableAdapters.TA_新闻表TableAdapter();
            ta.UpdatePubNews(DateTime.Now,"0", DateTime.Now, e.CommandArgument.ToString());
            ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('发布成功');", true);
            gvNews.CancelEdit();
            gvNews.DataBind();
            ta.Dispose();
        }
        catch (Exception ex)
        {
            string strErrorTemp = ex.Message;
            if (ex.InnerException != null)
            {
                strErrorTemp += ex.InnerException.Message;
            }
            ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('发布失败\\r\\n\\r\\n错误：" + strErrorTemp.Replace("\r\n", "\\r\\n") + "');", true);

        }
        ScriptManager.RegisterStartupScript(this, GetType(), "", "cl_ldpalLoading.Hide();", true);
    }

    protected void gvNews_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
    {
        e.NewValues["最后更新时间"] = DateTime.Now;
    }

    protected void gvNews_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
    {
        e.NewValues["最后更新时间"] = DateTime.Now;
    }
}