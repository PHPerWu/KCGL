using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web.ASPxGridLookup;
using MainDataSetTableAdapters;
using System.Data;
using DevExpress.Web.ASPxEditors;

public partial class SysManager_TA_UsersAndRoles : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void GridLookup_Init(object sender, EventArgs e)
    {

        (sender as ASPxGridLookup).GridView.Width = (sender as ASPxGridLookup).Width;
    }
    protected void gv_users_StartRowEditing(object sender, DevExpress.Web.Data.ASPxStartRowEditingEventArgs e)
    {

       

        TA_用户角色表TableAdapter adpter = new TA_用户角色表TableAdapter();      
        string userName = gv_users.GetRowValuesByKeyValue(e.EditingKeyValue, "USERNAME").ToString();
        DataTable table = adpter.GetRolesByName(userName);
        string roles = "";
        for (int i = 0; i < table.Rows.Count; i++)
        {
            roles += table.Rows[i]["ROLE"].ToString() + ", ";
        }
        Session["UserRoles"] = roles;
       
    }
  
    protected void GridLookup_DataBinding(object sender, EventArgs e)
    {
     
        (sender as ASPxGridLookup).Text = Session["UserRoles"].ToString();      
    }
    protected void gv_users_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
    {
        e.NewValues["所属学院名称"] = (gv_users.FindEditFormTemplateControl("cmb_学院") as ASPxComboBox).Text.ToString();

        
    }

    protected void gv_users_InitNewRow(object sender, DevExpress.Web.Data.ASPxDataInitNewRowEventArgs e)
    {       
         Session["UserRoles"] = "";
         e.NewValues["USERPWD"] = "12345";
       
    }

    protected void btn_save_Command(object sender, CommandEventArgs e)
    {
       
        string userName = (gv_users.FindEditFormTemplateControl("txt_username") as ASPxTextBox).Text;       
        List<object> list = (gv_users.FindEditFormTemplateControl("GridLookup") as ASPxGridLookup).GridView.GetSelectedFieldValues("ROLEID");
        gv_users.UpdateEdit();
        TA_用户角色表TableAdapter adpter = new TA_用户角色表TableAdapter();
        adpter.DeleteQuery(userName);
            foreach (decimal roleid in list)
            {
                adpter.InsertQuery(userName, roleid);
            }
        
    }
    protected void gv_users_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
    {
        string username = e.Values["USERNAME"].ToString();
        TA_用户角色表TableAdapter adpter = new TA_用户角色表TableAdapter();
        adpter.DeleteQuery(username);
        gv_users.DeleteRow(gv_users.FindVisibleIndexByKeyValue( e.Keys));
    }
    protected void btnNew_Click(object sender, EventArgs e)
    {
        gv_users.AddNewRow();
    }
}