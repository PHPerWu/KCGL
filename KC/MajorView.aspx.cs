using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web.ASPxGridView;

public partial class KC_MajorView : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            
            //202.114.144.0 --- 202.114.159.255 [湖北大学IP地址段] 
            string requestIP = GetUserIP();
            string[] strIP = requestIP.Split('.');
            if (strIP[0] == "202" && strIP[1] == "114")
            {
                if (Int32.Parse(strIP[2]) < 144 || Int32.Parse(strIP[2]) > 159)
                {
                    gv_ZY.SettingsDetail.ShowDetailRow = false;
                    gv_ZY.Columns["培养方案"].Visible = false;
                }
            }
            //if (strIP[0] == "127")
            //{
            //    gv_ZY.SettingsDetail.ShowDetailRow = false;
            //    gv_ZY.Columns["培养方案"].Visible = false;
            //}
            //传majortype值过来，1表示“品牌(特色)专业”，2表示“战略支柱产业专业”，3表示“综合改革试点专业”
            //try
            //{
                int type = Convert.ToInt32(Request.QueryString["majortype"].ToString());
                switch (type)
                {
                    //表示是"品牌(特色)专业"
                    case 1:
                        gv_ZY.DataSourceID = "ods_品牌特色专业";
                        gv_ZY.DataBind();
                        break;
                    //表示是"战略支柱产业专业"
                    case 2:
                        gv_ZY.DataSourceID = "ods_战略支柱产业专业";
                        gv_ZY.DataBind();
                        break;
                    //表示是"综合改革试点专业"
                    case 3:
                        gv_ZY.DataSourceID = "ods_综合改革试点专业";
                        gv_ZY.DataBind();
                        break;
                    //表示没有分类
                    case 4:
                        gv_ZY.DataSourceID = "ObjectDataSource1";
                        gv_ZY.DataBind();
                        break;
                }
            //}
            //catch (Exception ex)
            //{
            //    ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('专业相关信息读取失败，请联系管理员!');", true);
            //}

        }

    }

    public string GetUserIP()
    {
        string userIP;
        if (Request.ServerVariables["HTTP_VIA"] == null)
        {
            userIP = Request.UserHostAddress;//HttpContext.Current.Request.UserHostAddress;
        }
        else
        {
            userIP = Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
        }
        return userIP;
    }

    //为专业ID赋值
    protected void gvPYFA_BeforePerformDataSelect(object sender, EventArgs e)
    {
        Session["专业ID"] = (sender as ASPxGridView).GetMasterRowKeyValue();
        
    }

   
    protected void btn_XQ_Command(object sender, CommandEventArgs e)
    {
        gv_ZY.DetailRows.ExpandRow(Convert.ToInt32(e.CommandArgument));
    }
    protected void btn_Up_Command(object sender, CommandEventArgs e)
    {
        gv_ZY.DetailRows.CollapseRow(Convert.ToInt32(e.CommandArgument));
    }

}