using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web.ASPxUploadControl;
using DevExpress.Web.ASPxGridView;
using DevExpress.Web.ASPxEditors;
using DevExpress.Web.ASPxHtmlEditor;
using ImageTableAdapters;
using System.Runtime.Remoting.Contexts;
using System.Data;
public partial class CollegeManager_TeacherFamous : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }

    public string get_ip()
    {
        string ip;
        if (Context.Request.ServerVariables["HTTP_VIA"] != null) // 服务器， using proxy
        {
           

        ip = Context.Request.ServerVariables["HTTP_X_FORWARDED_FOR"].ToString();  // Return real client IP.

        }

        else//如果没有使用代理服务器或者得不到客户端的ip  not using proxy or can't get the Client IP
        {             //得到服务端的地址    

             ip = Context.Request.ServerVariables["REMOTE_ADDR"].ToString(); //While it can't get the Client IP, it will return proxy IP.

        }
        return ip;
    }

    public static string GetClientIP()
    {             //获得IP地址            

        string hostname;

        System.Net.IPHostEntry localhost;

        hostname = System.Net.Dns.GetHostName();

        localhost = System.Net.Dns.GetHostEntry(hostname);

        string ip = localhost.AddressList[0].ToString();

        int i = 1;

        while (ip.Contains(":"))
        {

            if (i == localhost.AddressList.Length)
            {

                ip = "";

                break;

            }

            ip = localhost.AddressList[i].ToString();

            if (ip.Contains(":"))
            {

                i++;

            }

            else

                break;

        }

        return ip;

    }

   
    //保存
    protected void btn_Save_Command(object sender, CommandEventArgs e)
    {
        //Response.Write("<script>alert('修改成功')</script>");
        string userIP = GetClientIP();
        DateTime dt = DateTime.Now;
        string time = dt.ToString();
        try
        {

            TA_导航表TableAdapter adpter = new TA_导航表TableAdapter();
            
            ASPxTextBox txtID = gvNav.FindEditFormTemplateControl("txtID") as ASPxTextBox;
            ASPxTextBox txtRange = gvNav.FindEditFormTemplateControl("txtRange") as ASPxTextBox;
            ASPxTextBox txtName = gvNav.FindEditFormTemplateControl("txtName") as ASPxTextBox;
            ASPxTextBox txtUrl = gvNav.FindEditFormTemplateControl("txtUrl") as ASPxTextBox;
           

            //新增
            if (gvNav.IsNewRowEditing)
            {
                int id=0;
                int i = 0;
                for (; i >= 0; i++)
                {
                    DataTableReader dtn = new DataTableReader(adpter.CheckID(i));
                    if (!dtn.Read())
                    {
                        id = i;
                        break;
                    }
                }
                adpter.InsertNav(id, txtName.Text, txtUrl.Text, null, userIP, time, txtRange.Text, null, null, null, null);
                Response.Write("<script>alert('新增成功')</script>");
            }
            //修改 
            else
            {



                adpter.UpdateNav(txtRange.Text, txtName.Text, txtUrl.Text, null, userIP, time,Convert.ToInt32(txtID.Text));
                Response.Write("<script>alert('修改成功')</script>");
              
              
            }
            gvNav.CancelEdit();
            gvNav.DataBind();
            ClientScript.RegisterStartupScript(this.GetType(), "alert", String.Format("<script>alert('{0}');</script>", "保存成功!"));
        }
        catch (Exception ex)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "alert", String.Format("<script>alert('{0}');</script>", "保存失败，请重试!"));
        }
    }



    protected void btnDelete_Click(object sender, EventArgs e)
    {
        int j = 0;
        TA_导航表TableAdapter adpter = new TA_导航表TableAdapter();
        for (int i = 0; i < gvNav.VisibleRowCount; i++)
        {
            if (gvNav.Selection.IsRowSelected(i))
            {
                int id = Convert.ToInt16(gvNav.GetRowValues(i, "栏目ID"));
                DataTableReader dt = new DataTableReader(adpter.CheckID(id));
                if (dt.Read())
                   adpter.DeleteQuery(id);
                j++;
            }

        }
        if (j > 0)
        {
            Response.Write("<script>alert('删除成功');</script>;window.location.href='../Default.aspx';</script>");
            Response.Redirect("~/Index/NavManager.aspx");
        }
    }
}