using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // ASPxSplitter1.GetPaneByName("ContentUrlPane").ContentUrl必须赋初始值，否则无法使用ASPxSplitter的页面框架(iframe)的功能
        if (ASPxTreeView1.SelectedNode == null)
        {
            ASPxSplitter1.GetPaneByName("ContentUrlPane").ContentUrl = ResolveUrl("./Welcome.aspx");
        }

        // 可选，个性化设置ASPxTreeView的风格，根据每个不同的应用系统可能不同
        if (!IsPostBack)
        {
            if (HttpContext.Current.User.Identity.IsAuthenticated)
            {
                string strID = Page.User.Identity.Name;

                MainDataSetTableAdapters.TA_用户表TableAdapter ta = new MainDataSetTableAdapters.TA_用户表TableAdapter();                
                MainDataSet.TA_用户表DataTable dt = ta.GetDataByUseID(strID);

                if (dt.Rows.Count == 1)
                {
                    Session["CollegeID"] = dt[0]["所属学院ID"];
                    Session["CollegeName"] = dt[0]["所属学院名称"];
                    Session["UserID"] = strID;
                    (LoginView1.FindControl("LoginName1") as LoginName).FormatString = "欢迎 " + Session["CollegeName"] + " {0}";
                }
            }
            //ASPxTreeView1.DataBind();
            //ASPxTreeView1.ExpandToDepth(0);
            ASPxTreeView1.ExpandAll();
        }
    }

    protected void HeadLoginStatus_LoggingOut(object sender, LoginCancelEventArgs e)
    {
        Session.Abandon();
    }

    protected void btn_Save_Command(object sender, CommandEventArgs e)
    {
        try
        {
            // Change the password.
            string strOldPassword = txt_OldPassword.Text;
            string strNewPassword = txt_Password.Text;
            TempUserProvider temp = new TempUserProvider();
            if (temp.ChangePassword(HttpContext.Current.User.Identity.Name, strOldPassword, strNewPassword))
            {
                lblResult.Text = "修改用户密码成功！\n";
            }
            else
            {
                lblResult.Text = "修改用户密码失败！" + "\n";
            }

        }
        catch (Exception excep)
        {
            lblResult.Text = "修改用户密码失败！" + excep.Message + "\n";

        }
    }
}