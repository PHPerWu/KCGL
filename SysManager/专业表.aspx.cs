using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web.ASPxGridView;
using DevExpress.Web.ASPxUploadControl;
using DevExpress.Web.ASPxEditors;
using MainDataSetTableAdapters;

public partial class DM_教学方式表 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
   
    
    protected void gv_ZY_CustomErrorText(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCustomErrorTextEventArgs e)
    {
        if (e.Exception.ToString().Contains("PK_SPECIALTY"))//捕获异常，主键不唯一
        {
            e.ErrorText = "重复的代码！";
        }
    }

    //为专业ID赋值
    protected void gvPYFA_BeforePerformDataSelect(object sender, EventArgs e)
    {
        Session["专业ID"] = (sender as ASPxGridView).GetMasterRowKeyValue();
    }

    //新增给专业ID赋值
    protected void gvPYFA_InitNewRow(object sender, DevExpress.Web.Data.ASPxDataInitNewRowEventArgs e)
    {
        e.NewValues["专业ID"] = Session["专业ID"].ToString();
    }

    //点击附件保存
    protected void btnSaveFile_Command(object sender, CommandEventArgs e)
    {
        TA_培养方案附件TableAdapter adpter = new TA_培养方案附件TableAdapter();
        ASPxGridView gvPYFA = (gv_ZY.FindDetailRowTemplateControl(Convert.ToInt32(Session["index"]), "gvPYFA") as ASPxGridView);
      ASPxUploadControl upload=(gv_ZY.FindDetailRowTemplateControl(Convert.ToInt32(Session["index"]), "gvPYFA") as ASPxGridView).FindEditFormTemplateControl("upload") as ASPxUploadControl;
      ASPxTextBox txbName = (gv_ZY.FindDetailRowTemplateControl(Convert.ToInt32(Session["index"]), "gvPYFA") as ASPxGridView).FindEditFormTemplateControl("txbName") as ASPxTextBox;

      //新增
      if (gvPYFA.IsNewRowEditing)
      {
          string imagePath = "";
          if (upload.PostedFile.ContentLength != 0)
          {
              imagePath = "../SysManager/Files/" + upload.FileName;
          }
          upload.SaveAs(Server.MapPath(@"../SysManager/Files/" + upload.FileName)); 
          adpter.Insert(txbName.Text, imagePath, upload.PostedFile.ContentType, Session["专业ID"].ToString()); 
      }
      //修改 
      else
      {
          string imagePath = "";
          if (upload.PostedFile.ContentLength != 0)
          {
              imagePath = "../SysManager/Files/" + upload.FileName;
              upload.SaveAs(Server.MapPath("../SysManager/Files/" + upload.FileName));
              adpter.Update(txbName.Text, imagePath, upload.PostedFile.ContentType, Session["专业ID"].ToString(),e.CommandArgument.ToString());             
          }
          else
          {
              imagePath = gvPYFA.GetRowValuesByKeyValue(e.CommandArgument, "附件路径").ToString();
              string ContentType = gvPYFA.GetRowValuesByKeyValue(e.CommandArgument, "附件类型").ToString();
              adpter.Update(txbName.Text, imagePath, ContentType, Session["专业ID"].ToString(), e.CommandArgument.ToString());
          }

      }
      gvPYFA.CancelEdit();
      gvPYFA.DataBind();
      ClientScript.RegisterStartupScript(this.GetType(), "alert", String.Format("<script>alert('{0}');</script>", "保存成功!"));
    }

    //保存行索引
    protected void gv_ZY_DetailRowExpandedChanged(object sender, ASPxGridViewDetailRowEventArgs e)
    {
        Session["index"] = e.VisibleIndex;
    }
    protected void btnNew_Click(object sender, EventArgs e)
    {
        gv_ZY.AddNewRow();
    }
}