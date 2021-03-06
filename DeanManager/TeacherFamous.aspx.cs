﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web.ASPxUploadControl;
using DevExpress.Web.ASPxGridView;
using MainDataSetTableAdapters;
using DevExpress.Web.ASPxEditors;
using DevExpress.Web.ASPxHtmlEditor;

public partial class CollegeManager_TeacherFamous : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }



    //保存
    protected void btnSave_Command(object sender, CommandEventArgs e)
    {
        //string photo = "";
        //if (filePhoto.HasFile)
        //{
        //    byte[] fileBytePicture = new byte[filePhoto.PostedFile.ContentLength];//用图片的长度来初始化一个字节数组存储临时的图片文件   
        //    System.IO.Stream fileStream = filePhoto.PostedFile.InputStream;//建立文件流对象   
        //    fileStream.Read(fileBytePicture, 0, filePhoto.PostedFile.ContentLength);
        //    photo = ByteToString(fileBytePicture);
        //}
        //string err;
        //int result = UpdateItem(photo, out err);
        //if (result != 0)
        //{
        //    Response.Write("<script>alert('修改成功。');</script>");
        //}
        //else
        //{
        //    Response.Write("<script>alert('修改失败。');</script>");
        //}  


        try
        {

            TA_教师信息表TableAdapter adpter = new TA_教师信息表TableAdapter();
            ASPxUploadControl upload = gvFamousTeacher.FindEditFormTemplateControl("upload") as ASPxUploadControl;
            ASPxTextBox txbName = gvFamousTeacher.FindEditFormTemplateControl("txbName") as ASPxTextBox;
            ASPxTextBox startTime = gvFamousTeacher.FindEditFormTemplateControl("startTime") as ASPxTextBox;
            ASPxComboBox cmbWinning = gvFamousTeacher.FindEditFormTemplateControl("cmbWinning") as ASPxComboBox;
            ASPxComboBox cmbOrg = gvFamousTeacher.FindEditFormTemplateControl("cmbOrg") as ASPxComboBox;
            ASPxHtmlEditor htmleditor = gvFamousTeacher.FindEditFormTemplateControl("htmleditor") as ASPxHtmlEditor;

            //新增
            if (gvFamousTeacher.IsNewRowEditing)
            {
                string imagePath = "";
                if (upload.HasFile)  
                {
                    imagePath = @"../teacherImage/" + upload.FileName;
                    upload.SaveAs(Server.MapPath(@"../teacherImage/" + upload.FileName));
                }
                adpter.InsertTeacherInfo(txbName.Text, cmbOrg.Value.ToString(), imagePath, htmleditor.Html, cmbWinning.Value.ToString(), startTime.Text);
               
            }
            //修改 
            else
            {
                string imagePath = "";
                if (upload.HasFile)
                {
                    imagePath = @"../teacherImage/" + upload.FileName;
                    adpter.UpdateQueryBy教师ID(txbName.Text, cmbOrg.Value.ToString(), imagePath, htmleditor.Html, cmbWinning.Value.ToString(), startTime.Text, e.CommandArgument.ToString());
                    upload.SaveAs(Server.MapPath(@"../teacherImage/" + upload.FileName));
                }
                else
                {
                    imagePath = gvFamousTeacher.GetRowValuesByKeyValue(e.CommandArgument, "教师图片").ToString();
                    adpter.UpdateQueryBy教师ID(txbName.Text, cmbOrg.Value.ToString(), imagePath, htmleditor.Html, cmbWinning.Value.ToString(), startTime.Text, e.CommandArgument.ToString());
                }
              
            }
            gvFamousTeacher.CancelEdit();
            gvFamousTeacher.DataBind();
            ClientScript.RegisterStartupScript(this.GetType(), "alert", String.Format("<script>alert('{0}');</script>", "保存成功!"));
        }
        catch (Exception ex)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "alert", String.Format("<script>alert('{0}');</script>", "保存失败，请重试!"));
        }
    }
}