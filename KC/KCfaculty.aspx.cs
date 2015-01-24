using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

//2013.22.29任俊伟修改

public partial class KC_KCFaculty : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            //初始页面默认显示材料科学与工程学院
            //Session["XYID"] = "2";
            //hdfSYYX.Value ="2";
            //hdfSYZY.Value = "-1";
            //lbzyname.Text = "材料科学与工程学院专业总览";
            //lblKCname.Text = "材料科学与工程学院课程总览"; 
            this.lblTotal.Text = "访问总量：" + Application["total"].ToString();
            this.lblOnline.Text = "当前在线人数：" + Application["online"].ToString();
            //lbzyname.Text = "点击院系查看专业";
            //lblKCname.Text = "点击院系(专业)查看课程";
            lblKCname.Text = "点击院系查看课程";
        }
    }
    protected void dltXY_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if(e.CommandName=="XY")
        {   
            char[] sp={'|'};
            string[] parals=e.CommandArgument.ToString().Split(sp);
            if (parals[0]!="")
            {
                  //Session["XYID"] = parals[0];
                  hdfXYID.Value = parals[0];//联动专业
                  QJBL.XYID = parals[0];//记录下学院ID，专业被点击时给隐藏控件传值
                  Session["SYYX"] = parals[0];
                  Session["SYZY"] = "-1";
                  //hdfSYYX.Value = parals[0];//联动课程
                  //hdfSYZY.Value = "-1";//院系下的所有课程，与专业无关，置-1
                  //lbzyname.Text = parals[1] + "专业总览";
                  lblKCname.Text = parals[1] + "课程总览";
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('系统出错，请联系管理员');", true);
            }
          
        }
    }
    //protected void dltZY_ItemCommand(object source, DataListCommandEventArgs e)
    //{
    //    if (e.CommandName == "ZY")
    //    {
    //        char[] sp = { '|' };
    //        string[] parals = e.CommandArgument.ToString().Split(sp);
    //        if (parals[0] != "")
    //        {

    //            hdfXYID.Value = QJBL.XYID;
    //            Session["SYYX"] = "-1";
    //            Session["SYZY"] = parals[0];
    //            //hdfSYYX.Value = "-1";//联动课程,专业下的所有课程，与院系无关，置-1
    //            //hdfSYZY.Value = parals[0];
    //            lblKCname.Text = parals[1] + "专业课程总览";
               
    //        }
    //        else
    //        {
    //            ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('系统出错，请联系管理员');", true);
    //        }

    //    }
    //}
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/KC/SearchResult.aspx?keyWords=" + txtSearch.Text);
    }
}