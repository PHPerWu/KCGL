using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class KC_KCinfo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            this.lblTotal.Text = "访问总量：" + Application["total"].ToString();
            this.lblOnline.Text = "当前在线人数：" + Application["online"].ToString();
            if (Request.QueryString["KCID"] == null)
            {
                Response.Redirect("~/Main_index.aspx");
            }
            else 
            {
                //点击次数加1
                MainDataSetTableAdapters.TA_课程信息表TableAdapter dapter = new MainDataSetTableAdapters.TA_课程信息表TableAdapter();
                dapter.UpdateDJCS(Request.QueryString["KCID"]);
            }
        }
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/KC/SearchResult.aspx?keyWords=" + txtSearch.Text);
    }
}