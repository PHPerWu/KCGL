using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Validate : System.Web.UI.Page
{
    private string courseID
    {
        get { return Request.QueryString["CourseNewID"].ToString(); }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            MainDataSetTableAdapters.TA_课程信息表TableAdapter ta = new MainDataSetTableAdapters.TA_课程信息表TableAdapter();
            int result = Convert.ToInt32(ta.ScalarQueryCourseID(courseID, Session["CourseID"].ToString()));
            if (result < 1)
            {
                //还记得脚本中的if(sta.indexOf("regok")!=-1)这句吗,regok就是这里的啦..
                Response.Write("regok");
            }
            else
            {
                Response.Write("error");
            }
        }
    }
}