using System;
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
using ImageTableAdapters;

public partial class CollegeManager_TeacherFamous : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        TA_栏目图片表TableAdapter lunbo = new TA_栏目图片表TableAdapter();
        txtUpload1.Text = lunbo.GetDataOrder().Rows[0]["图片链接"].ToString();
        txtUpload2.Text = lunbo.GetDataOrder().Rows[1]["图片链接"].ToString();
        txtUpload3.Text = lunbo.GetDataOrder().Rows[2]["图片链接"].ToString();
        lunbo1.ImageUrl = "~/image/catImage/"+lunbo.GetDataOrder().Rows[0]["图片名称"].ToString();
        lunbo2.ImageUrl = "~/image/catImage/"+lunbo.GetDataOrder().Rows[1]["图片名称"].ToString();
        lunbo3.ImageUrl = "~/image/catImage/"+lunbo.GetDataOrder().Rows[2]["图片名称"].ToString();
        

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

   
    protected void btnUpload1_Click(object sender, EventArgs e)
    {
       
        string userIP = GetClientIP();
        DateTime dt = DateTime.Now;
        string time = dt.ToString();
        TA_栏目图片表TableAdapter Talunbo = new TA_栏目图片表TableAdapter();
       


        bool fileOK = false;
        string path = Server.MapPath("../image/catImage/");
        if (upload1.HasFile)
        {
            String fileExtension = System.IO.Path.GetExtension(upload1.FileName).ToLower();
            String[] allowedExtensions = { ".gif", ".png", ".bmp", ".jpg" };
            for (int i = 0; i < allowedExtensions.Length; i++)
            {
                if (fileExtension == allowedExtensions[i])
                {
                 
                    Talunbo.UpdateCatImage(upload1.FileName, time.ToString(), userIP, hide1.Text,1);
                 
                    fileOK = true;
                }
            }
        }
        if (fileOK)
        {
            try
            {
                upload1.SaveAs(path + upload1.FileName);
                //Response.Write("<script>alert('修改成功')</script>");
                ScriptManager.RegisterStartupScript(this, GetType(), "", "showTXT1(" + Talunbo.GetDataOrder().Rows[0]["图片链接"].ToString() + ");show(lunbo1,'" + "../image/catImage/" + Talunbo.GetDataOrder().Rows[0]["图片名称"].ToString() + "');", true);
                //ScriptManager.RegisterStartupScript(this, GetType(), "", "showTXT1("+txtUpload1.Text+");", true);
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('修改失败')</script>");
            }
        }
        else
        {
            Response.Write("<script>alert('只能上传.gif, .png, .bmp, .jpg 格式')</script>");
        }
    }
    protected void btnUpload2_Click(object sender, EventArgs e)
    {

        string userIP = GetClientIP();
        DateTime dt = DateTime.Now;
        string time = dt.ToString();
        TA_栏目图片表TableAdapter Talunbo = new TA_栏目图片表TableAdapter();



        bool fileOK = false;
        string path = Server.MapPath("../image/catImage/");
        if (upload2.HasFile)
        {
            String fileExtension = System.IO.Path.GetExtension(upload2.FileName).ToLower();
            String[] allowedExtensions = { ".gif", ".png", ".bmp", ".jpg" };
            for (int i = 0; i < allowedExtensions.Length; i++)
            {
                if (fileExtension == allowedExtensions[i])
                {
                    Talunbo.UpdateCatImage(upload2.FileName, time, userIP, hide2.Text, 2);

                    fileOK = true;
                }
            }
        }
        if (fileOK)
        {
            try
            {
                upload2.SaveAs(path + upload2.FileName);
                ScriptManager.RegisterStartupScript(this, GetType(), "", "showTXT2(" + Talunbo.GetDataOrder().Rows[1]["图片链接"].ToString() + ");show(lunbo2,'" + "../image/catImage/" + Talunbo.GetDataOrder().Rows[1]["图片名称"].ToString() + "');", true);
                //Response.Write("<script>alert('修改成功')</script>");
               // ScriptManager.RegisterStartupScript(this, GetType(), "", "showTXT2(txtUpload2.Text);", true);
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('修改失败')</script>");
            }
        }
        else
        {
            Response.Write("<script>alert('只能上传.gif, .png, .bmp, .jpg 格式')</script>");
        }
    }
    protected void btnUpload3_Click(object sender, EventArgs e)
    {

        string userIP = GetClientIP();
        DateTime dt = DateTime.Now;
        string time = dt.ToString();
        TA_栏目图片表TableAdapter Talunbo = new TA_栏目图片表TableAdapter();



        bool fileOK = false;
        string path = Server.MapPath("../image/catImage/");
        if (upload3.HasFile)
        {
            String fileExtension = System.IO.Path.GetExtension(upload3.FileName).ToLower();
            String[] allowedExtensions = { ".gif", ".png", ".bmp", ".jpg" };
            for (int i = 0; i < allowedExtensions.Length; i++)
            {
                if (fileExtension == allowedExtensions[i])
                {
                    Talunbo.UpdateCatImage(upload3.FileName, time, userIP, hide3.Text, 3);

                    fileOK = true;
                }
            }
        }
        if (fileOK)
        {
            try
            {
                upload3.SaveAs(path + upload3.FileName);
                //Response.Write("<script>alert('修改成功')</script>");
                ScriptManager.RegisterStartupScript(this, GetType(), "", "showTXT3(" + Talunbo.GetDataOrder().Rows[2]["图片链接"].ToString() + ");show(lunbo3,'" + "../image/catImage/" + Talunbo.GetDataOrder().Rows[2]["图片名称"].ToString() + "');", true);
               // ScriptManager.RegisterStartupScript(this, GetType(), "", "showTXT3(txtUpload3.Text);", true);
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('修改失败')</script>");
            }
        }
        else
        {
            Response.Write("<script>alert('只能上传.gif, .png, .bmp, .jpg 格式')</script>");
        }
    }



}