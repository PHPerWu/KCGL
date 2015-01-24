<%@ WebHandler Language="C#" Class="pjcl" %>

using System;
using System.Web;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public class pjcl : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        string kcid = HttpContext.Current.Request.QueryString["kcid"].ToString();
        string type = HttpContext.Current.Request.QueryString["type"].ToString();

        string ip=HttpContext.Current.Request.UserHostAddress;

        if (type != null && kcid != null)
        {
            //操作数据库，评价次数加1
            MainDataSetTableAdapters.TA_投票记录TableAdapter daptertp = new MainDataSetTableAdapters.TA_投票记录TableAdapter();
            MainDataSetTableAdapters.TA_课程信息表TableAdapter dapterkc = new MainDataSetTableAdapters.TA_课程信息表TableAdapter();
            System.Data.DataTable table = daptertp.GetCount(ip, kcid);
            
            //该ip没有给这门课投过票
            if (table.Rows.Count==0)
            {
                //
                daptertp.InsertQuery(kcid, ip);
                switch (type)
                {
                    case "yes":
                        //
                        dapterkc.Update喜欢(kcid);
                        break;
                    case "no":
                        //
                        dapterkc.Update不喜欢(kcid);
                        break;
                    case "yiban":
                        //
                        dapterkc.Update一般喜欢(kcid);
                        break;
                }
                context.Response.Write("ok");
            }
            else
            {
                context.Response.Write("no");
            }

        }
        else 
        {
            context.Response.Write("fail");
        }
        
        
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}