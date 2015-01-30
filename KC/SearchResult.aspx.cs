using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MainDataSetTableAdapters;
using System.Data;

//2013.22.29-任俊伟更改

public partial class KC_SearchResult : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
           
        }

        //try
        //{
            //获取传过来的keyWords值，得到搜素的结果列表
            string keyWords = Request.QueryString["keyWords"].ToString();
            //VI_KCINFOTableAdapter ada = new VI_KCINFOTableAdapter();
            TA_课程信息表TableAdapter ada = new TA_课程信息表TableAdapter();
            DataTable dt = ada.GetDataByAllWebsiteSearch("%" + keyWords + "%", "%" + keyWords + "%", "%" + keyWords + "%");
            if (keyWords == string.Empty)   //搜索关键字为空值
            {
                ASPxGridView1.DataSource = ada.GetDataByAllCollege();
                ASPxGridView1.DataBind();
            }
            else
            {
                //try
                //{
                    if (dt.Rows.Count > 0)   //搜索到了相应的结果
                    {
                        ASPxGridView1.DataSource = dt;
                        ASPxGridView1.DataBind();
                    }
                    else
                    {
                        ASPxGridView1.SettingsText.EmptyDataRow = "抱歉，没有找到相关课程的结果！请重新输入关键字搜索！";
                    }
                //}
                //catch (Exception ex)
                //{
                //    Response.Redirect("Main_index.aspx");
                //}
            }
        //}
        //catch (Exception ex)
        //{
        //    Response.Redirect("Main_index.aspx");
        //}
    }


    protected void btnInfo_Command(object sender, CommandEventArgs e)
    {
        //TA_课程信息表TableAdapter adapter = new TA_课程信息表TableAdapter();
        //var info = adapter.GetXXKCXXByKCDM(e.CommandArgument.ToString());
        MainDataSetTableAdapters.VI_KCINFOTableAdapter adapter = new VI_KCINFOTableAdapter();
        string index = Convert.ToString(e.CommandArgument);
        var info = adapter.GetKCInfoByKCDM(e.CommandArgument.ToString());
        Response.Redirect(info[0]["精品课程网址"].ToString());
        //if (info[0]["精品视频公开课"].ToString() == "1" || info[0]["精品资源共享课"].ToString() == "1")
        //{
        //    Response.Redirect("~/KC/JPKCInfo.aspx?KCID=" + e.CommandArgument);
        //}
        //else
        //{
        //    Response.Redirect("~/KC/PTKCInfo.aspx?KCID=" + e.CommandArgument);
        //}
    }

}