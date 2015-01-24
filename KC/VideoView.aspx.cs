using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MainDataSetTableAdapters;
using System.Data;

//2013.22.29-任俊伟更改

public partial class VideoView : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
           
            //得到视频的ID，点击量加1，获取相关信息并显示
            string id = Request.QueryString["ID"].ToString();
            TA_课程视频表TableAdapter adapter = new TA_课程视频表TableAdapter();
            DataTable dt = adapter.GetDataBy视频ID(id);
            lblTitle.Text = dt.Rows[0]["视频名称"].ToString();
            lbl_time.Text = Convert.ToDateTime(dt.Rows[0]["视频上传时间"]).ToString("yyyy/MM/dd");     
            //点击量加1显示并更新
            int djl = Convert.ToInt32(dt.Rows[0]["点击量"].ToString()) + 1;
            lblDJL.Text = djl.ToString();
            adapter.UpdateQuery点击量(djl, id);
            //视频路径
            //lblSrc.Text = dt.Rows[0]["视频路径"].ToString().Substring(2);
            //判断简介是否为空，为空则给出相关提示
            string intro = dt.Rows[0]["视频内容介绍"].ToString();
            if (intro == string.Empty)
            {
                lblIntro.Text = "暂无该视频的相关简介！";
            }
            else
            {
                lblIntro.Text = "视频简介";
                lblIntroContent.Text = intro;
            }
        }
    }


    protected void btn_close_Click(object sender, EventArgs e)
    {
        ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>window.opener=null;window.open('','_self');window.close();</script>");
    }

}