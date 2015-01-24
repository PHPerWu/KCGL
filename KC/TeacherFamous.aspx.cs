using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MainDataSetTableAdapters;
using DevExpress.Web.ASPxEditors;
using DevExpress.Web.ASPxGridView;

public partial class KC_TeacherFamous : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            this.lblTotal.Text = "访问总量：" + Application["total"].ToString();
            this.lblOnline.Text = "当前在线人数：" + Application["online"].ToString();
       

        //传tchtype值过来，1表示“教学名师”，2表示“教学质量优秀奖教师”，3表示“教学技能大赛获奖教师”
            try
            {
                int tchtype = Convert.ToInt32(Request.QueryString["tchtype"].ToString());
                switch (tchtype)
                {
                    //表示是"教学名师"
                    case 1:
                        gvFamousTeacher.DataSourceID = "ods_教学名师";
                        gvFamousTeacher.DataBind();
                        break;
                    //表示是"教学质量优秀奖教师"
                    case 2:
                        gvFamousTeacher.DataSourceID = "ods_教学质量优秀奖教师";
                        gvFamousTeacher.DataBind();
                        break;
                    //表示是"教学技能大赛获奖教师"
                    case 3:
                        gvFamousTeacher.DataSourceID = "ods_教学技能大赛获奖教师";
                        gvFamousTeacher.DataBind();
                        break;
                    // 表示是"优秀教师"
                    case 4:
                        gvFamousTeacher.DataSourceID = "ods_teacher";
                        gvFamousTeacher.DataBind();
                        break;

                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('教师相关信息读取失败，请联系管理员!');", true);
            }
        }

    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        gvFamousTeacher.CancelEdit();
        gvFamousTeacher.DataBind();
    }
    protected void btnImage_Command(object sender, CommandEventArgs e)
    {
        string[] a = e.CommandArgument.ToString().Split('|');
        TA_教师信息表TableAdapter adapter = new TA_教师信息表TableAdapter();
        adapter.Update点击量(a[0]);
        string str = Convert.ToString(e.CommandArgument);
        Response.Redirect("~/KC/TeacherFamousInfo.aspx?str=" + str);
        //gvFamousTeacher.StartEdit(Convert.ToInt32(a[1]));
    }
    protected void btnInfo_Command(object sender, CommandEventArgs e)
    {
        string str = Convert.ToString(e.CommandArgument);
        string[] a = e.CommandArgument.ToString().Split('|');
        TA_教师信息表TableAdapter adapter = new TA_教师信息表TableAdapter();
        adapter.Update点击量(a[0]);
        Response.Redirect("~/KC/TeacherFamousInfo.aspx?str="+str);
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/KC/SearchResult.aspx?keyWords=" + txtSearch.Text);
    }
}