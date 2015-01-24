﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MainDataSetTableAdapters;

public partial class KC_MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!Page.IsPostBack)//added by zengcheng
        {
            if (HttpContext.Current.User.Identity.IsAuthenticated)
            {
            }
            //added by renjunwei
            this.lblTotal.Text = "访问总量：" + Application["total"].ToString();
            this.lblOnline.Text = "当前在线人数：" + Application["online"].ToString();
        }
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/KC/SearchResult.aspx?keyWords=" + txtSearch.Text);
    }


}
