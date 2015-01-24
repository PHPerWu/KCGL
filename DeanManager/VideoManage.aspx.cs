using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web.ASPxGridView;
using DevExpress.Web.ASPxUploadControl;
using DevExpress.Web.ASPxEditors;
using DevExpress.Web.ASPxHtmlEditor;
using MainDataSetTableAdapters;
using Brettle.Web.NeatUpload;

public partial class VideoManage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    //保存行索引
    protected void gv_Video_DetailRowExpandedChanged(object sender, ASPxGridViewDetailRowEventArgs e)
    {
        Session["index"] = e.VisibleIndex;   //得到当前展开的这一行的索引   
        Session["课程代码"] = gv_JPKC.GetRowValues(Convert.ToInt32(Session["index"]), "课程代码");
    }

    protected void btnSave_Click(object sender, CommandEventArgs e)
    {
        try
        {
            ASPxGridView gv_Video = gv_JPKC.FindDetailRowTemplateControl(Convert.ToInt32(Session["index"]), "gv_Video") as ASPxGridView;
            string SPID = gv_Video.GetRowValues(Convert.ToInt32(e.CommandArgument), "视频ID").ToString();
            ASPxTextBox txtName = gv_Video.FindEditFormTemplateControl("txtName") as ASPxTextBox;
            ASPxHtmlEditor htmlVideoIntro = gv_Video.FindEditFormTemplateControl("htmlVideoIntro") as ASPxHtmlEditor;
            InputFile AttachFile = gv_Video.FindEditFormTemplateControl("AttachFile") as InputFile;
            InputFile AttachFilePic = gv_Video.FindEditFormTemplateControl("AttachFilePic") as InputFile;
            Label lblTip = gv_Video.FindEditFormTemplateControl("lblTip") as Label;
            MainDataSetTableAdapters.TA_课程视频表TableAdapter ada = new TA_课程视频表TableAdapter();
            if (gv_Video.IsNewRowEditing)
            {
                if (AttachFile.ContentLength <= 0)
                {
                    lblTip.Visible = true;
                    lblTip.Text = "请选择文件！";
                }
                else
                {
                    string FileName = AttachFile.FileName;//获取上传文件的全路径 
                    string ExtenName = System.IO.Path.GetExtension(FileName);//获取扩展名 
                    string name = DateTime.Now.ToString("yyyyMMddhhmmss");
                    string SaveFileName = System.IO.Path.Combine(Request.PhysicalApplicationPath + "/Video", name + ExtenName);//合并两个路径为上传到服务器上的全路径
                    //上传图片
                    string PicFileName = AttachFilePic.FileName;//获取上传图片文件的全路径 
                    string PicExtenName = System.IO.Path.GetExtension(PicFileName);//获取图片扩展名 
                    string SavePicFileName = System.IO.Path.Combine(Request.PhysicalApplicationPath + "/VideoImages", name + PicExtenName);//合并两个路径为上传到服务器上的全路径 
                    string picpath = null;
                    if (AttachFilePic.ContentLength > 0)   //如果上传图片的话，判断是否为支持的类型
                    {
                        if (PicExtenName == ".jpg" || PicExtenName == ".jpeg" || PicExtenName == ".gif" || PicExtenName == ".png")
                        {
                            try
                            {
                            AttachFilePic.MoveTo(SavePicFileName, Brettle.Web.NeatUpload.MoveToOptions.Overwrite);
                            picpath = "../VideoImages/" + name + PicExtenName;
                            Session["picPath"] = picpath;
                            }
                            catch (Exception ex)
                            {
                                ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('图片上传失败！');", true);
                            }
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('图片文件格式不支持！');", true);
                        }
                    }
                    else   //不上传图片的话，图片路径为默认路径
                    {
                        picpath = "../image/public/noup.jpg";
                        Session["picPath"] = picpath;
                    }
                    if (ExtenName == ".mp4" || ExtenName == ".f4v" || ExtenName == ".flv")
                    {
                        try
                        {
                        Session["path"] = "../Video/" + name + ExtenName;
                        AttachFile.MoveTo(SaveFileName, Brettle.Web.NeatUpload.MoveToOptions.Overwrite);
                        gv_Video.UpdateEdit();
                        gv_Video.CancelEdit();
                        gv_Video.DataBind();
                        txtName.Text = "";
                        htmlVideoIntro.Html = "";
                        ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('视频文件上传成功！');", true);
                        }
                        catch (Exception ex)
                        {
                            ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('视频文件上传失败！');", true);
                        }
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('视频文件新增失败！视频文件格式不支持！');", true);
                    }

                }
            }
            else
            {
                try
                {
                    //修改图片
                    string name = DateTime.Now.ToString("yyyyMMddhhmmss");
                    string PicFileName = AttachFilePic.FileName;//获取上传图片文件的全路径 
                    string PicExtenName = System.IO.Path.GetExtension(PicFileName);//获取图片扩展名 
                    string SavePicFileName = System.IO.Path.Combine(Request.PhysicalApplicationPath + "/VideoImages", name + PicExtenName);//合并两个路径为上传到服务器上的全路径 
                    string picpath = null;
                    if (AttachFilePic.ContentLength > 0)   //如果修改图片的话，判断是否为支持的类型
                    {
                        if (PicExtenName == ".jpg" || PicExtenName == ".jpeg" || PicExtenName == ".gif" || PicExtenName == ".png")
                        {
                            try
                            {
                                AttachFilePic.MoveTo(SavePicFileName, Brettle.Web.NeatUpload.MoveToOptions.Overwrite);
                                picpath = "../VideoImages/" + name + PicExtenName;
                                //Session["picPath"] = picpath;
                            }
                            catch (Exception ex)
                            {
                                ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('图片上传失败！');", true);
                            }
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('图片文件格式不支持！');", true);
                        }
                    }
                    else   //不上传图片的话，图片路径为默认路径
                    {
                        picpath = "../image/public/noup.jpg";
                        //Session["picPath"] = picpath;
                    }
                    //更新数据库中的数据
                    ada.UpdateQuery课程视频(txtName.Text, htmlVideoIntro.Html, picpath, SPID);
                    gv_Video.CancelEdit();
                    ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('视频信息修改成功！');", true);
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('视频信息修改失败！');", true);
                }
            }
        }
        catch (Exception ex)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('上传过程中出错，请联系管理员！');", true);
        }
    }
    protected void gv_Video_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
    {
        e.NewValues["视频路径"] = Session["path"];
        e.NewValues["视频上传时间"] =System.DateTime.Now;
        e.NewValues["课程ID"] = Session["课程代码"];
        e.NewValues["图片路径"] = Session["picPath"];
    }
    protected void gv_Video_HtmlEditFormCreated(object sender, ASPxGridViewEditFormEventArgs e)
    {
        ASPxGridView gv_Video = gv_JPKC.FindDetailRowTemplateControl(Convert.ToInt32(Session["index"]), "gv_Video") as ASPxGridView;
        InputFile AttachFile = gv_Video.FindEditFormTemplateControl("AttachFile") as InputFile;
        //InputFile AttachFilePic = gv_Video.FindEditFormTemplateControl("AttachFilePic") as InputFile;
        if(!gv_Video.IsNewRowEditing)
        {
            AttachFile.Enabled = false;
            //AttachFilePic.Enabled = false;
        }
    }
}