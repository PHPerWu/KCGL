using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MainDataSetTableAdapters;

public partial class placeholder : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        TA_课程信息表TableAdapter ta = new TA_课程信息表TableAdapter();
        string str=ta.GetDataHotKC().Rows[0]["课程名称"].ToString();
        Response.Write(str);
    }
}