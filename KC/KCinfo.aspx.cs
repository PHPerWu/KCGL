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
   
}