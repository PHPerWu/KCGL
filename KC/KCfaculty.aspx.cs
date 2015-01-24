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
  
   
}