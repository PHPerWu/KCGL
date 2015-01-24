using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MainDataSetTableAdapters;

public partial class Main_index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    protected void rptTSKC_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        //TA_课程信息表1TableAdapter adapter = new TA_课程信息表1TableAdapter();
        //var info = adapter.GetXXKCXXByKCDM(e.CommandArgument.ToString());
        //var info = adapter.GetDataByKCDM(e.CommandArgument.ToString());
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
    protected void rptJPSP_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        DMDataSetTableAdapters.DM_优质课程TableAdapter adapter = new DMDataSetTableAdapters.DM_优质课程TableAdapter();
        var info = adapter.GetDataBy优质课程代码(e.CommandArgument.ToString());
        Response.Redirect(info[0]["优质课程网址"].ToString());
    }
    protected void rptRMKC_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        //TA_课程信息表1TableAdapter adapter = new TA_课程信息表1TableAdapter();
        //var info = adapter.GetXXKCXXByKCDM(e.CommandArgument.ToString());
        //var info = adapter.GetDataByKCDM(e.CommandArgument.ToString());
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
    protected void rptJPKC_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        //TA_课程信息表1TableAdapter adapter = new TA_课程信息表1TableAdapter();
        //var info = adapter.GetXXKCXXByKCDM(e.CommandArgument.ToString());
        //var info = adapter.GetDataByKCDM(e.CommandArgument.ToString());
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