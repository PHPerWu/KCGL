using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ViewNews : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            this.lblTotal.Text = "访问总量：" + Application["total"].ToString();
            this.lblOnline.Text = "当前在线人数：" + Application["online"].ToString();
            if (Request.QueryString["NewsID"] == null)
            {
                Response.Redirect("~/Main_index.aspx");
            }

            MainDataSetTableAdapters.TA_新闻表TableAdapter ta = new MainDataSetTableAdapters.TA_新闻表TableAdapter();
            ta.UpdateViewCount(Request.QueryString["NewsID"]);

            rptNews.DataBind();
        }
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/KC/SearchResult.aspx?keyWords=" + txtSearch.Text);
    }
}