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
        TA_轮播图片表TableAdapter lunbo = new TA_轮播图片表TableAdapter();
        txtUpload1.Text = lunbo.GetData().Rows[0]["图片链接"].ToString();
        txtUpload2.Text = lunbo.GetData().Rows[1]["图片链接"].ToString();
        txtUpload3.Text = lunbo.GetData().Rows[2]["图片链接"].ToString();
        txtUpload4.Text = lunbo.GetData().Rows[3]["图片链接"].ToString();
        lunbo1.ImageUrl = "~/image/lunbo/"+lunbo.GetData().Rows[0]["图片名称"].ToString();
        lunbo2.ImageUrl = "~/image/lunbo/"+lunbo.GetData().Rows[1]["图片名称"].ToString();
        lunbo3.ImageUrl = "~/image/lunbo/"+lunbo.GetData().Rows[2]["图片名称"].ToString();
        lunbo4.ImageUrl = "~/image/lunbo/"+lunbo.GetData().Rows[3]["图片名称"].ToString();

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
        TA_轮播图片表TableAdapter Talunbo = new TA_轮播图片表TableAdapter();
       


        bool fileOK = false;
        string path = Server.MapPath("../image/lunbo/");
        if (upload1.HasFile)
        {
            String fileExtension = System.IO.Path.GetExtension(upload1.FileName).ToLower();
            String[] allowedExtensions = { ".gif", ".png", ".bmp", ".jpg" };
            for (int i = 0; i < allowedExtensions.Length; i++)
            {
                if (fileExtension == allowedExtensions[i])
                {
                    Talunbo.UpdateLunbo(upload1.FileName, time, userIP, txtUpload1.Text, "B13F812B433C44D693A280EE5E74F785");
                 
                    fileOK = true;
                }
            }
        }
        if (fileOK)
        {
            try
            {
                upload1.SaveAs(path + upload1.FileName);
                Response.Write("<script>alert('修改成功')</script>");

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
     

        //Response.Write("<script>alert('修改成功')</script>");
        string userIP = GetClientIP();
        DateTime dt = DateTime.Now;
        string time = dt.ToString();
        TA_轮播图片表TableAdapter Talunbo = new TA_轮播图片表TableAdapter();
        //string imagePath = "";

        //imagePath = upload2.FileName;
        //upload2.SaveAs(Server.MapPath(@"../teacherImage/" + upload2.FileName));

        //Response.Write("<script>alert('修改成功')</script>");


        bool fileOK = false;
        string path = Server.MapPath("../image/lunbo/");
        if (upload2.HasFile)
        {
            String fileExtension = System.IO.Path.GetExtension(upload2.FileName).ToLower();
            String[] allowedExtensions = { ".gif", ".png", ".bmp", ".jpg" };
            for (int i = 0; i < allowedExtensions.Length; i++)
            {
                if (fileExtension == allowedExtensions[i])
                {
                    Talunbo.UpdateLunbo(upload2.FileName, time, userIP, txtUpload2.Text, "1DB3CC8E5E9F4A05B70468D56F91B765");
                    // lunbo.UpdateLunbo("5656", time, userIP, txtUpload2.Text, "B0A69EABD16B2F5CB88BF65A0EC0202F");
                    fileOK = true;
                }
            }
        }
        if (fileOK)
        {
            try
            {
                upload2.SaveAs(path + upload2.FileName);
                Response.Write("<script>alert('修改成功')</script>");

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
        //string imagePath = "";
        //if (upload3.HasFile)
        //{
        //    imagePath = @"../teacherImage/" + upload3.FileName;
        //    upload3.SaveAs(Server.MapPath(@"../teacherImage/" + upload3.FileName));
        //    Response.Write("<script>alert('修改成功')</script>");
        //}

        //Response.Write("<script>alert('修改成功')</script>");
        string userIP = GetClientIP();
        DateTime dt = DateTime.Now;
        string time = dt.ToString();
        TA_轮播图片表TableAdapter Talunbo = new TA_轮播图片表TableAdapter();
        //string imagePath = "";

        //imagePath = upload3.FileName;
        //upload3.SaveAs(Server.MapPath(@"../teacherImage/" + upload3.FileName));

        //Response.Write("<script>alert('修改成功')</script>");


        bool fileOK = false;
        string path = Server.MapPath("../image/lunbo/");
        if (upload3.HasFile)
        {
            String fileExtension = System.IO.Path.GetExtension(upload3.FileName).ToLower();
            String[] allowedExtensions = { ".gif", ".png", ".bmp", ".jpg" };
            for (int i = 0; i < allowedExtensions.Length; i++)
            {
                if (fileExtension == allowedExtensions[i])
                {
                    Talunbo.UpdateLunbo(upload3.FileName, time, userIP, txtUpload3.Text, "1511D4BB078D425ABF053CFCF4D094C2");
                    // lunbo.UpdateLunbo("5656", time, userIP, txtUpload3.Text, "B0A69EABD16B3F5CB88BF65A0EC0303F");
                    fileOK = true;
                }
            }
        }
        if (fileOK)
        {
            try
            {
                upload3.SaveAs(path + upload3.FileName);
                Response.Write("<script>alert('修改成功')</script>");

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
    protected void btnUpload4_Click(object sender, EventArgs e)
    {
        //string imagePath = "";
        //if (upload4.HasFile)
        //{
        //    imagePath = @"../teacherImage/" + upload4.FileName;
        //    upload4.SaveAs(Server.MapPath(@"../teacherImage/" + upload4.FileName));
        //    Response.Write("<script>alert('修改成功')</script>");
        //}
        
        //Response.Write("<script>alert('修改成功')</script>");
        string userIP = GetClientIP();
        DateTime dt = DateTime.Now;
        string time = dt.ToString();
        TA_轮播图片表TableAdapter Talunbo = new TA_轮播图片表TableAdapter();
        //string imagePath = "";

        //imagePath = upload4.FileName;
        //upload4.SaveAs(Server.MapPath(@"../teacherImage/" + upload4.FileName));

        //Response.Write("<script>alert('修改成功')</script>");
       

        bool fileOK = false;
        string path = Server.MapPath("../image/lunbo/");
        if (upload4.HasFile)
        {
            String fileExtension = System.IO.Path.GetExtension(upload4.FileName).ToLower();
            String[] allowedExtensions = { ".gif", ".png", ".bmp", ".jpg" };
            for (int i = 0; i < allowedExtensions.Length; i++)
            {
                if (fileExtension == allowedExtensions[i])
                {
                    Talunbo.UpdateLunbo(upload4.FileName, time, userIP, txtUpload4.Text, "B0A69EABD16B4F5CB88BF65A0EC0403F");
                   // lunbo.UpdateLunbo("5656", time, userIP, txtUpload4.Text, "B0A69EABD16B4F5CB88BF65A0EC0403F");
                    fileOK = true;
                }
            }
        }
        if (fileOK)
        {
            try
            {
                upload4.SaveAs(path + upload4.FileName);
                Response.Write("<script>alert('修改成功')</script>");
               
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