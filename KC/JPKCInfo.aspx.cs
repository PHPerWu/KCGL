using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web.ASPxEditors;

public partial class KC_JPKCInfo : System.Web.UI.Page
{
    protected string PageTitle;
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
                PageTitle = "英语畅谈中国"; 
                //点击次数加1
                MainDataSetTableAdapters.TA_课程信息表TableAdapter dapter = new MainDataSetTableAdapters.TA_课程信息表TableAdapter();
                dapter.UpdateDJCS(Request.QueryString["KCID"]);
                lblkcid.Text = Request.QueryString["KCID"].ToString();
                var table = dapter.GetPJCount(Request.QueryString["KCID"].ToString());
                lblyes.Text = table[0]["喜欢"].ToString();
                lblno.Text = table[0]["不喜欢"].ToString();
                lblyiban.Text = table[0]["一般喜欢"].ToString();
                MainDataSetTableAdapters.TA_课程附件表TableAdapter ada = new MainDataSetTableAdapters.TA_课程附件表TableAdapter();
                if (ada.GetDataJXDG(Request.QueryString["KCID"]).Rows.Count==0)
                {
                    lblhref.Text = "";
                }
                else
                {
                    string href = ada.GetDataJXDG(Request.QueryString["KCID"]).Rows[0]["附件路径"].ToString();
                    lblhref.Text = href;
                }    
            }
        }
    }
   
    protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        MainDataSetTableAdapters.TA_课程附件表TableAdapter ada = new MainDataSetTableAdapters.TA_课程附件表TableAdapter();
        for (int i = 0; i < Repeater1.Items.Count; i++)
        {
            ASPxHyperLink hlJXDG = Repeater1.Items[i].FindControl("hlJXDG") as ASPxHyperLink;
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