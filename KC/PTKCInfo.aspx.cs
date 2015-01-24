using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web.ASPxEditors;

public partial class KC_PTKCInfo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
           
            if (Request.QueryString["KCID"] == null)
            {
                Response.Redirect("~/Main_index.aspx");

            }
            else
            {
                //点击次数加1
                MainDataSetTableAdapters.TA_课程信息表TableAdapter dapter = new MainDataSetTableAdapters.TA_课程信息表TableAdapter();
                MainDataSetTableAdapters.VI_KCINFOTableAdapter viAdapter = new MainDataSetTableAdapters.VI_KCINFOTableAdapter();
                dapter.UpdateDJCS(Request.QueryString["KCID"]);
                lblkcid.Text = Request.QueryString["KCID"].ToString();
                var table = dapter.GetPJCount(Request.QueryString["KCID"].ToString());
                lblyes.Text = table[0]["喜欢"].ToString();
                lblno.Text = table[0]["不喜欢"].ToString();
                lblyiban.Text = table[0]["一般喜欢"].ToString();
                int m = lblyiban.Text.ToString().Length;
                //    MainDataSetTableAdapters.TA_课程附件表TableAdapter ada = new MainDataSetTableAdapters.TA_课程附件表TableAdapter();
                //    ASPxHyperLink hlKcWeb = Repeater1.FindControl("hlKcWeb") as ASPxHyperLink;
                //    ASPxHyperLink hlJXDG = Repeater1.FindControl("hlJXDG") as ASPxHyperLink;
                //    if (viAdapter.GetKCInfoByKCDM(Request.QueryString["KCID"]).Rows[0]["精品课程网址"] != string.Empty)
                //    {
                //        hlKcWeb.Text="点击进入";
                //        hlKcWeb.Cursor="Pointer";
                //        hlKcWeb.NavigateUrl = viAdapter.GetKCInfoByKCDM(Request.QueryString["KCID"]).Rows[0]["精品课程网址"].ToString();
                //    }
                //    else
                //    {
                //        hlKcWeb.Text="暂无";
                //        hlKcWeb.Enabled=false;
                //    }
                //    if(ada.GetDataJXDG(Request.QueryString["KCID"]).Rows.Count>0)
                //    {
                //        hlJXDG.Text = "点击查看教学大纲";
                //        hlJXDG.Cursor = "Pointer";
                //        hlJXDG.NavigateUrl = "../DeanManager/教学大纲/" + ada.GetDataJXDG(Request.QueryString["KCID"]).Rows[0]["附件路径"];
                //    }
                //    else
                //    {
                //        hlJXDG.Text = "暂无教学大纲";
                //        hlJXDG.Enabled = false;
                //    }
            }
        }
    }
    

    protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        MainDataSetTableAdapters.TA_课程附件表TableAdapter ada = new MainDataSetTableAdapters.TA_课程附件表TableAdapter();
        MainDataSetTableAdapters.VI_KCINFOTableAdapter viAdapter = new MainDataSetTableAdapters.VI_KCINFOTableAdapter();
        for (int i = 0; i < Repeater1.Items.Count; i++)
        {
            ASPxHyperLink hlKcWeb = Repeater1.Items[i].FindControl("hlKcWeb") as ASPxHyperLink;
            ASPxHyperLink hlJXDG = Repeater1.Items[i].FindControl("hlJXDG") as ASPxHyperLink;
            if (viAdapter.GetKCInfoByKCDM(Request.QueryString["KCID"]).Rows[0]["精品课程网址"].ToString() != string.Empty)
            {
                hlKcWeb.Text = "点击进入";
                //hlKcWeb.Cursor = "Pointer";
                hlKcWeb.NavigateUrl = viAdapter.GetKCInfoByKCDM(Request.QueryString["KCID"]).Rows[0]["精品课程网址"].ToString();
            }
            else
            {
                hlKcWeb.Text = "暂无课程网址";
                hlKcWeb.Enabled = false;
            }
            if (ada.GetDataJXDG(Request.QueryString["KCID"]).Rows.Count > 0)
            {
                hlJXDG.Text = "点击查看教学大纲";
                //hlJXDG.Cursor = "Pointer";
                hlJXDG.NavigateUrl = "../教学大纲/" + ada.GetDataJXDG(Request.QueryString["KCID"]).Rows[0]["附件名称"];
            }
            else
            {
                hlJXDG.Text = "暂无教学大纲";
                hlJXDG.Enabled = false;
            }
        }
    }
}