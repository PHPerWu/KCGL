using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MainDataSetTableAdapters;

public partial class KC_TeacherFamous : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //2013.22.30--任俊伟修改
        
            string str = Request.QueryString["str"].ToString();
            var info = str.Split('|');
            Session["TeacherID"] = info[0];
        }
    }

    protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        //2013.22.30--任俊伟修改
        //获取相关信息并显示
        DM_获奖级别TableAdapter adaWin = new DM_获奖级别TableAdapter();
        TA_学院信息表TableAdapter adaColl = new TA_学院信息表TableAdapter();
        string str = Request.QueryString["str"].ToString();
        var info = str.Split('|');
        for (int i = 0; i < Repeater1.Items.Count; i++)
        {
            (Repeater1.Items[i].FindControl("lblSchool") as Label).Text = adaColl.GetData学院名称ByID(info[1]).Rows[0]["学院名称"].ToString();
            (Repeater1.Items[i].FindControl("lblWinning") as Label).Text = adaWin.GetDataByID(info[2]).Rows[0]["代码含义"].ToString();
        }
    }

}