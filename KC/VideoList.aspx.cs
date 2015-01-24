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
            
            string KCID = Request.QueryString["KCID"].ToString();
            hfdKCID.Value = KCID;
            //显示不同的标题
            VI_KCINFOTableAdapter ada = new VI_KCINFOTableAdapter();
            lblTitle.Text = ada.GetKCInfoByKCDM(KCID).Rows[0]["课程名称"].ToString() + "—视频列表";
        }
    }
  
}