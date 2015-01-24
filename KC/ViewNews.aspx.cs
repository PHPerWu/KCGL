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
           
            if (Request.QueryString["NewsID"] == null)
            {
                Response.Redirect("~/Main_index.aspx");
            }

            MainDataSetTableAdapters.TA_新闻表TableAdapter ta = new MainDataSetTableAdapters.TA_新闻表TableAdapter();
            ta.UpdateViewCount(Request.QueryString["NewsID"]);

            rptNews.DataBind();
        }
    }
   
}