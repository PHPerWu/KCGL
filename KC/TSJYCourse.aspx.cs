using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MainDataSetTableAdapters;

public partial class KC_TSJYCourse : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
           
        }
    }

    protected void btnInfo_Command(object sender, CommandEventArgs e)
    {
        //TA_课程信息表TableAdapter adapter = new TA_课程信息表TableAdapter();
        //var info = adapter.GetXXKCXXByKCDM(e.CommandArgument.ToString());
        MainDataSetTableAdapters.VI_KCINFOTableAdapter adapter = new VI_KCINFOTableAdapter();
        var info = adapter.GetKCInfoByKCDM(e.CommandArgument.ToString());
        if (info[0]["精品视频公开课"].ToString() == "1" || info[0]["精品资源共享课"].ToString() == "1")
        {
            Response.Redirect("~/KC/JPKCInfo.aspx?KCID=" + e.CommandArgument);
        }
        else
        {
            Response.Redirect("~/KC/PTKCInfo.aspx?KCID=" + e.CommandArgument);
        }
    }
    
}