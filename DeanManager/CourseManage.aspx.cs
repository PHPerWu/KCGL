using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using DevExpress.Web.ASPxCallbackPanel;
using DevExpress.Web.ASPxEditors;
using DevExpress.Web.ASPxUploadControl;
using System.IO;

public partial class DeanManager_CourseManage : System.Web.UI.Page
{
    string strComboBox1 = "——请选择——";
    string strComboBox2 = "----请选择，没有则不选----";
    string strComboBox3 = "----若没有，请选择此项----";

    protected void Page_Load(object sender, EventArgs e)
    {
        //Session["SelectCollegeID"] = null;
        if (!IsPostBack)
        {
            //Session["CollegeID"] = "1";
            //Session["CollegeName"] = "数学与计算机科学";
            //Session["UserID"] = "数学与计算机科学";
        }
    }

    /// <summary>
    /// 保存课程信息
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnSaveCourse_Click(object sender, EventArgs e)
    {
        //try
        //{
        // 保存前进行逻辑验证
        //if (!validateProgress(xgv))
        //{7777777777777777777
        //    recoverInfo(xgv);
        //    return;
        //}
        Session["FrontID"] = ((gvCourseInfo.FindEditFormTemplateControl("cbpFBCourse") as ASPxCallbackPanel).FindControl("cmbFrontCourse") as ASPxComboBox).Value;
        Session["BehindID"] = ((gvCourseInfo.FindEditFormTemplateControl("cbpFBCourse") as ASPxCallbackPanel).FindControl("cmbBehindCourse") as ASPxComboBox).Value;
        string strCourseID = (gvCourseInfo.FindEditFormTemplateControl("txtCourseID") as ASPxTextBox).Text;
        string strOpenCollegeID = (gvCourseInfo.FindEditFormTemplateControl("cmbOpenCollege") as ASPxComboBox).Value.ToString();
        ASPxUploadControl upImage = gvCourseInfo.FindEditFormTemplateControl("upImage") as ASPxUploadControl;
        gvCourseInfo.UpdateEdit();

        //保存课程图片          
        if (upImage.HasFile)
        {
            string imagePath = "";
            imagePath = @"~/image/courseImage/" + upImage.FileName;
            upImage.SaveAs(Server.MapPath(imagePath));
            MainDataSetTableAdapters.TA_课程信息表TableAdapter adpter = new MainDataSetTableAdapters.TA_课程信息表TableAdapter();
            adpter.Update课程图片By课程代码(imagePath, strCourseID);
        }
        string strMajor = "";
        if (hfdMajor["major"] is System.Object[])
        {
            int max = (hfdMajor["major"] as object[]).Length;
            for (int i = 0; i < max; i++)
            {
                if (i < max - 1)
                {
                    strMajor += (hfdMajor["major"] as object[]).GetValue(i).ToString() + ",";
                }
                else
                {
                    strMajor += (hfdMajor["major"] as object[]).GetValue(i).ToString();
                }
            }
        }
        MainDataSetTableAdapters.TA_院系课程关系表TableAdapter ta = new MainDataSetTableAdapters.TA_院系课程关系表TableAdapter();
        ta.P_INSERT_RELATION_COURSE(strCourseID, strOpenCollegeID, strMajor);
        ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('保存成功');", true);
        gvCourseInfo.DataBind();
        ta.Dispose();

        //}
        //catch (Exception ex)
        //{
        //    string strErrorTemp = ex.Message;
        //    if (ex.InnerException != null)
        //    {
        //        strErrorTemp += ex.InnerException.Message;
        //    }
        //    ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('无法保存，请联系系统管理员\\r\\n\\r\\n错误：" + strErrorTemp.Replace("\r\n", "\\r\\n") + "');", true);

        //}
        //ScriptManager.RegisterStartupScript(this, GetType(), "", "cl_ldpalLoading.Hide();", true);
    }

    protected void cbplCollege_Callback(object sender, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
    {
        string strTemp = e.Parameter;
        bool bTemp = false;
        if (strTemp.Contains("#$"))
        {
            strTemp = strTemp.Replace("#$", "");
            bTemp = true;
        }
        Session["SelectCollegeID"] = "'" + strTemp.Replace(",", "','") + "'";
        ASPxCheckBoxList ckblTemp = (sender as ASPxCallbackPanel).FindControl("ckbSelectMajor") as ASPxCheckBoxList;
        ckblTemp.DataBind();
        Session["SelectCollegeID"] = null;

        ASPxCheckBox ckbTemp = (sender as ASPxCallbackPanel).FindControl("ckbForMajor") as ASPxCheckBox;
        //ASPxCheckBoxList ckblTemp2 = (sender as ASPxCallbackPanel).FindControl("ckbSelectCollege") as ASPxCheckBoxList;
        //ASPxCheckBox ckbTemp2 = (sender as ASPxCallbackPanel).FindControl("ckbForCollege") as ASPxCheckBox;
        if (bTemp)
        {
            ckblTemp.SelectAll();
            //ckblTemp.ReadOnly = true;
            //ckblTemp2.ReadOnly = true;
            //ckbTemp.ReadOnly = true;
            //ckbTemp2.ReadOnly = true;

        }
        else
        {
            //ckblTemp.ReadOnly = false;
            //ckblTemp2.ReadOnly = false;
            //ckbTemp.ReadOnly = false;
            //ckbTemp2.ReadOnly = false;

            if (ckblTemp.Items.Count != 0 && ckblTemp.Items.Count == ckblTemp.SelectedItems.Count)
            {
                ckbTemp.Checked = true;
            }
            else
            {
                ckbTemp.Checked = false;
            }
        }
    }

    protected void gvCourseInfo_InitNewRow(object sender, DevExpress.Web.Data.ASPxDataInitNewRowEventArgs e)
    {
        Session["CourseID"] = "0";
        Session["CollegeID"] = "0";
        Session["FrontID"] = "";
        Session["BehindID"] = "";

        (gvCourseInfo.FindEditFormTemplateControl("txtTotalCredit") as ASPxTextBox).Text = "0";
        (gvCourseInfo.FindEditFormTemplateControl("speTeachCredit") as ASPxSpinEdit).Text = "0";
        (gvCourseInfo.FindEditFormTemplateControl("speTestCredit") as ASPxSpinEdit).Text = "0";
        (gvCourseInfo.FindEditFormTemplateControl("spePracticeCredit") as ASPxSpinEdit).Text = "0";
        (gvCourseInfo.FindEditFormTemplateControl("speCredit") as ASPxSpinEdit).Text = "0";

        (gvCourseInfo.FindEditFormTemplateControl("cmbOpenCollege") as ASPxComboBox).Items.Insert(0, new ListEditItem(strComboBox1, ""));
        (gvCourseInfo.FindEditFormTemplateControl("cmbOpenTerm") as ASPxComboBox).Items.Insert(0, new ListEditItem(strComboBox1, ""));
        (gvCourseInfo.FindEditFormTemplateControl("cmbCourseProperty") as ASPxComboBox).Items.Insert(0, new ListEditItem(strComboBox1, ""));
        (gvCourseInfo.FindEditFormTemplateControl("cmbTestType") as ASPxComboBox).Items.Insert(0, new ListEditItem(strComboBox1, ""));
        (gvCourseInfo.FindEditFormTemplateControl("cmbCourseLevel") as ASPxComboBox).Items.Insert(0, new ListEditItem(strComboBox1, ""));
        (gvCourseInfo.FindEditFormTemplateControl("cmbCourseType") as ASPxComboBox).Items.Insert(0, new ListEditItem(strComboBox1, ""));
        (gvCourseInfo.FindEditFormTemplateControl("cmbTeachType") as ASPxComboBox).Items.Insert(0, new ListEditItem(strComboBox1, ""));
        (gvCourseInfo.FindEditFormTemplateControl("cmbCourseOO") as ASPxComboBox).Items.Insert(0, new ListEditItem(strComboBox1, ""));
    }

    protected void gvCourseInfo_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
    {
        e.NewValues["先修课程"] = Convert.ToString(Session["FrontID"]);
        e.NewValues["后续课程"] = Convert.ToString(Session["BehindID"]);
        if (Convert.ToString(e.NewValues["精品视频公开课"]) != "1" && Convert.ToString(e.NewValues["精品资源共享课"]) != "1")
        {
            e.NewValues["精品课程网址"] = "";
        }
    }

    protected void gvCourseInfo_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
    {
        e.NewValues["先修课程"] = Convert.ToString(Session["FrontID"]);
        e.NewValues["后续课程"] = Convert.ToString(Session["BehindID"]);
        e.NewValues["创建时间"] = DateTime.Now;
        e.NewValues["创建人"] = Session["UserID"];

        if (Convert.ToString(e.NewValues["精品视频公开课"]) != "1" && Convert.ToString(e.NewValues["精品资源共享课"]) != "1")
        {
            e.NewValues["精品课程网址"] = "";
        }
    }

    protected void gvCourseInfo_StartRowEditing(object sender, DevExpress.Web.Data.ASPxStartRowEditingEventArgs e)
    {
        Session["CourseID"] = e.EditingKeyValue;
        Session["CollegeID"] = gvCourseInfo.GetRowValuesByKeyValue(e.EditingKeyValue, "开课学院");
        Session["FrontID"] = gvCourseInfo.GetRowValuesByKeyValue(e.EditingKeyValue, "先修课程");
        Session["BehindID"] = gvCourseInfo.GetRowValuesByKeyValue(e.EditingKeyValue, "后续课程");

        MainDataSetTableAdapters.TA_院系课程关系表TableAdapter ta = new MainDataSetTableAdapters.TA_院系课程关系表TableAdapter();
        MainDataSet.TA_院系课程关系表DataTable dt = new MainDataSet.TA_院系课程关系表DataTable();
        dt = ta.GetDataByCourseID(e.EditingKeyValue.ToString());
        ta.Dispose();
        if (dt.Rows.Count == 0)
        {
            Session["SelectCollegeID"] = null;
            Session["SelectMajorID"] = null;
        }
        else
        {
            string strCollege = " " + dt[0]["适用学院"] + " ", strMajor = dt[0]["适用专业"] + ",";
            for (int i = 1; i < dt.Rows.Count; i++)
            {
                strMajor += dt[i]["适用专业"] + ",";
                if (!strCollege.Contains(" " + dt[i]["适用学院"] + " "))
                {
                    strCollege += dt[i]["适用学院"] + " ";
                }
            }
            Session["SelectCollegeID"] = "'" + strCollege.Trim().Replace(" ", "','") + "'";
            Session["SelectMajorID"] = strMajor.Remove(strMajor.LastIndexOf(","));
        }
    }

    protected void cmbFrontCourse_DataBound(object sender, EventArgs e)
    {
        ASPxComboBox cmbTemp = sender as ASPxComboBox;
        cmbTemp.Items.Insert(0, new ListEditItem(strComboBox3, ""));
        cmbTemp.SelectedItem = cmbTemp.Items.FindByValue(Session["FrontID"]);
    }

    protected void cmbBehindCourse_DataBound(object sender, EventArgs e)
    {
        ASPxComboBox cmbTemp = sender as ASPxComboBox;
        cmbTemp.Items.Insert(0, new ListEditItem(strComboBox3, ""));
        cmbTemp.SelectedItem = cmbTemp.Items.FindByValue(Session["BehindID"]);
    }

    protected void ckbSelectCollege_DataBound(object sender, EventArgs e)
    {
        if (Session["SelectCollegeID"] != null)
        {
            string[] strArry = Session["SelectCollegeID"].ToString().Replace("'", "").Split(',');
            //Session["SelectCollegeID"] = null;

            ASPxCheckBoxList ckblCollege = sender as ASPxCheckBoxList;
            for (int i = 0; i < strArry.Length; i++)
            {
                ckblCollege.Items.FindByValue(strArry[i]).Selected = true;
            }

            if (ckblCollege.Items.Count == ckblCollege.SelectedIndices.Count)
            {
                ((gvCourseInfo.FindEditFormTemplateControl("cbplCollege") as ASPxCallbackPanel).FindControl("ckbForCollege") as ASPxCheckBox).Checked = true;
            }
        }
    }

    protected void ckbSelectMajor_DataBound(object sender, EventArgs e)
    {
        if (Session["SelectMajorID"] != null)
        {
            string[] strArry = Session["SelectMajorID"].ToString().Split(',');
            Session["SelectMajorID"] = null;
            Session["SelectCollegeID"] = null;

            ASPxCheckBoxList ckblMajor = sender as ASPxCheckBoxList;
            for (int i = 0; i < strArry.Length; i++)
            {
                ckblMajor.Items.FindByValue(strArry[i]).Selected = true;
            }

            if (ckblMajor.Items.Count == ckblMajor.SelectedIndices.Count)
            {
                ((gvCourseInfo.FindEditFormTemplateControl("cbplCollege") as ASPxCallbackPanel).FindControl("ckbForMajor") as ASPxCheckBox).Checked = true;
            }
            else
            {
                ((gvCourseInfo.FindEditFormTemplateControl("cbplCollege") as ASPxCallbackPanel).FindControl("ckbForMajor") as ASPxCheckBox).Checked = false;
            }
        }
    }

    protected void cbpFBCourse_Callback(object sender, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
    {
        Session["CollegeID"] = e.Parameter;
        ((sender as ASPxCallbackPanel).FindControl("cmbFrontCourse") as ASPxComboBox).DataBind();
        ((sender as ASPxCallbackPanel).FindControl("cmbBehindCourse") as ASPxComboBox).DataBind();
    }

    protected void gv_Export_RenderBrick(object sender, DevExpress.Web.ASPxGridView.Export.ASPxGridViewExportRenderingEventArgs e)
    {
        if (e.RowType == DevExpress.Web.ASPxGridView.GridViewRowType.Title)
        {
            e.BrickStyle.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleCenter;
        }
        if (e.RowType == DevExpress.Web.ASPxGridView.GridViewRowType.Header)
        {
            e.BrickStyle.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleCenter;
        }
        if (e.RowType == DevExpress.Web.ASPxGridView.GridViewRowType.Data)
        {
            e.BrickStyle.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleLeft;
        }
    }
    protected void btnExport_Click(object sender, EventArgs e)
    {
        gv_Export.PageFooter.Right = "导出时间：" + DateTime.Now.ToLongDateString();
        gv_Export.FileName = "课程信息管理";
        gvCourseInfo.Columns[0].Visible = false;
        gvCourseInfo.Columns[1].Visible = false;
        gv_Export.WriteXlsToResponse();
        gvCourseInfo.Columns[0].Visible = true;
        gvCourseInfo.Columns[1].Visible = true;
    }

    //时间：2013.22.31
    //修改人：任俊伟
    //备注：实现上传教学大纲以及教学计划
    //protected void btnFileManage_Command(object sender, CommandEventArgs e)
    //{
    //    string kcid = Convert.ToString(e.CommandArgument);
    //    lblFile.Text = kcid;
    //}

    //protected void btnUp_Click(object sender, EventArgs e)
    //{
    //    ASPxUploadControl uploadFile = popupFile.FindControl("uploadFile") as ASPxUploadControl;
    //    ASPxComboBox cmbFileType = popupFile.FindControl("cmbFileType") as ASPxComboBox;
    //    MainDataSetTableAdapters.TA_课程附件表TableAdapter adapter = new MainDataSetTableAdapters.TA_课程附件表TableAdapter();
    //    //先判断是否有文件
    //    //if (uploadFile.HasFile)
    //    //{
    //        string FileName = uploadFile.FileName; //得到文件名
    //        string name = FileName.Substring(0, FileName.Length - 4);
    //        string exe = FileName.Substring(FileName.Length - 3, 3);    //得到后缀，判断是否为pdf格式的
    //        if (exe == "pdf")
    //        {
    //            //文件格式符合，保存并将路径和文件名保存到数据库相应的表中
    //            string kcid = lblFile.Text.ToString();
    //            string type = cmbFileType.SelectedItem.Text.ToString();
    //            string path = "";
    //            if (type == "教学大纲")   //判断选择的文件类型，类型不同，路径不同
    //            {
    //                path = "~/DeanManager/教学大纲/" + FileName;
    //            }
    //            else
    //            {
    //                path = "~/DeanManager/教学计划/" + FileName;
    //            }
    //            //try
    //            //{
    //                if (!File.Exists(Server.MapPath(path)))
    //                {
    //                    uploadFile.SaveAs(Server.MapPath(path));    //保存到服务器中
    //                    adapter.InsertQuery课程附件(name, path, type, kcid);  //保存到数据库中
    //                    lblError.Text = "";
    //                    ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('文件上传成功！');", true);
    //                }
    //                else
    //                {
    //                    lblError.Text = "文件已存在，请重命名后再上传！";
    //                }
    //            //}
    //            //catch (Exception ex)
    //            //{
    //            //    ScriptManager.RegisterStartupScript(this, GetType(), "alert('文件上传失败');", "", true);
    //            //}
    //        }
    //        else   //文件格式不符
    //        {
    //            lblError.Text = "文件格式不符，请确认您上传的为pdf格式！";
    //        }
    //    //}
    //    //else
    //    //{
    //    //    lblError.Text = "请先选择文件再上传！";
    //    //}
    //}
    //protected void cmbFileType_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    lblType.Text = cmbFileType.SelectedItem.Text;
    //}
    protected void uploadFile_FileUploadComplete(object sender, FileUploadCompleteEventArgs e)
    {
        try
        {
            MainDataSetTableAdapters.TA_课程附件表TableAdapter adapter = new MainDataSetTableAdapters.TA_课程附件表TableAdapter();
            UploadedFile uploadedFile = e.UploadedFile;
            string fileName = uploadedFile.FileName;
            //string name = fileName.Substring(0, fileName.Length - 4);
            string ExtenName = System.IO.Path.GetExtension(fileName);//获取扩展名 
            string name = DateTime.Now.ToString("yyyyMMddhhmmss");
            string kcid = Session["kcid"].ToString();
            string type = Session["FileType"].ToString();
            string path = string.Empty;
            string SaveFileName = string.Empty;
            if (type == "教学大纲")   //判断选择的文件类型，类型不同，路径不同
            {
                path = "../教学大纲/" + name + ExtenName;
                SaveFileName = System.IO.Path.Combine(Request.PhysicalApplicationPath + "/教学大纲/", name + ExtenName); ;//合并两个路径为上传到服务器上的全路径 
            }
            else
            {
                path = "../教学计划/" + name + ExtenName;
                SaveFileName = System.IO.Path.Combine(Request.PhysicalApplicationPath + "/教学计划/", name + ExtenName);//合并两个路径为上传到服务器上的全路径 
            }
            uploadFile.SaveAs(SaveFileName);    //保存到服务器中
            adapter.InsertQuery课程附件(name + ExtenName, path, type, kcid);  //保存到数据库中
            lblError.Text = "";
            ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('文件上传成功！');", true);
            e.CallbackData = "success";
        }
        catch (Exception ex)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "alert('文件上传失败');", "", true);
            e.CallbackData = "fail";
        }
    }

    protected void fileCallBack_Callback(object source, DevExpress.Web.ASPxCallback.CallbackEventArgs e)
    {
        Session["FileType"] = cmbFileType.SelectedItem.Text;
        //Session["kcid"] = gvCourseInfo.GetRowValues(Convert.ToInt32(lblFile.Text),"课程代码").ToString();
    }
    //protected void kcidCallBack_Callback(object source, DevExpress.Web.ASPxCallback.CallbackEventArgs e)
    //{
        
    //    //Session["kcid"] = gvCourseInfo.GetRowValues(Convert.ToInt32(lblFile.Text), "课程代码").ToString();
    //}
    protected void gvCourseInfo_CustomButtonCallback(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCustomButtonCallbackEventArgs e)
    {
        Session["kcid"] = gvCourseInfo.GetRowValues(e.VisibleIndex, "课程代码").ToString();
    }
}