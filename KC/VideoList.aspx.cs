using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MainDataSetTableAdapters;

//2013.22.29-任俊伟更改

public partial class VideoList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            this.lblTotal.Text = "访问总量：" + Application["total"].ToString();
            this.lblOnline.Text = "当前在线人数：" + Application["online"].ToString();
            //获取传过来的值，传值给HiddenField，得到不同的视频列表
            string KCID = Request.QueryString["KCID"].ToString();
            hfdKCID.Value = KCID;
            //显示不同的标题
            VI_KCINFOTableAdapter ada = new VI_KCINFOTableAdapter();
            lblTitle.Text = ada.GetKCInfoByKCDM(KCID).Rows[0]["课程名称"].ToString() + "—视频列表";
        }
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/KC/SearchResult.aspx?keyWords=" + txtSearch.Text);
    }
}