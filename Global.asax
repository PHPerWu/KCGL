<%@ Application Language="C#" %>
<%@ Import Namespace="System.IO" %>

<script runat="server">

    void Application_Start(object sender, EventArgs e)
    {
        // 在应用程序启动时运行的代码
        string filepath = Server.MapPath("~/Count.txt");
        if (!File.Exists(filepath))
        {
            StreamWriter sw = new StreamWriter(filepath);
            sw.WriteLine(0);//初始访问量
            sw.Flush();
            sw.Close();
        }
        StreamReader sr = new StreamReader(filepath);
        int intTotal = int.Parse(sr.ReadLine());
        sr.Close();

        Application["Total"] = intTotal;//统计来访总人数
        Application["Online"] = 0;//统计在线人数
    }

    void Application_End(object sender, EventArgs e)
    {
        //  在应用程序关闭时运行的代码
        string filepath = Server.MapPath("~/Count.txt");
        StreamWriter sw = new StreamWriter(filepath);
        sw.WriteLine(Application["Total"]);
        sw.Flush();
        sw.Close();
    }

    void Application_Error(object sender, EventArgs e)
    {
        // 在出现未处理的错误时运行的代码

    }

    void Session_Start(object sender, EventArgs e)
    {
        // 在新会话启动时运行的代码
        Application.Lock();
        Application["Total"] = int.Parse(Application["Total"].ToString()) + 1;
        Application["Online"] = int.Parse(Application["Online"].ToString()) + 1;
        Application.UnLock();
        Session.Timeout = 60;
        string filepath = Server.MapPath("~/Count.txt");
        StreamWriter swFile = new StreamWriter(filepath);
        swFile.WriteLine(Application["Total"]);
        swFile.Flush();
        swFile.Close();
    }

    void Session_End(object sender, EventArgs e)
    {
        // 在会话结束时运行的代码。 
        // 注意: 只有在 Web.config 文件中的 sessionstate 模式设置为
        // InProc 时，才会引发 Session_End 事件。如果会话模式设置为 StateServer 
        // 或 SQLServer，则不会引发该事件。
        Application.Lock();
        Application["Online"] = int.Parse(Application["Online"].ToString()) - 1;
        Application.UnLock();
    }       
</script>
