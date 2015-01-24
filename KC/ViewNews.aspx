<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ViewNews.aspx.cs" Inherits="ViewNews" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
    <%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../Styles/master.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script src="../Scripts/ScoreTop.js" type="text/javascript"></script>
    <style type="text/css">
        .returntop
        {
            background: url(../images/returntop1.jpg);
            display: none;
            position: fixed;
            bottom: 50px;
            right: 100px;
            cursor: pointer;
        }
    </style>
     <script type="text/javascript">
         //下拉菜单
         $(document).ready(function () {
             $("ul.subnav").parent().append("<span></span>");
             //给下拉按钮添加事件
             $("ul.topnav li span").click(function () {
                 $(this).parent().find("ul.subnav").slideDown('fast').show();
                 $(this).parent().hover(function () {
                 }, function () {
                     $(this).parent().find("ul.subnav").slideUp('slow');
                 });
             }).hover(function () {
                 $(this).addClass("subhover");
             }, function () {
                 $(this).removeClass("subhover");
             });
         });


    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">
        <div class="returntop">
            <img alt="回顶部" id="img1" src="../image/returntop1.jpg" />
            <img alt="回顶部" id="img2" style="display: none;" src="../image/returntop2.jpg" /></div>
        <div id="header">
          <div class="headFunc">
                    <div class="function">
                        <a href="#" onclick="this.style.behavior='url(#default#homepage)'; this.setHomePage(document.location.href);event.returnValue=false;">
                            设为首页</a>&nbsp;&nbsp;|&nbsp; <a href="Javascript:window.external.addFavorite(document.location.href,document.title)">
                                加入收藏</a>
                    </div>
                    <div class="search">
                    <table>
                    <tr>
                    <td><dx:ASPxTextBox ID="txtSearch" runat="server" Width="150px"  
                             class="txtSearch" Height="17px" NullText="请输入课程名称" 
                            Theme="Office2003Olive">
                            <NullTextStyle ForeColor="#999999">
                            </NullTextStyle>
                        </dx:ASPxTextBox></td>
                    <td><asp:Button ID="btnSearch" runat="server" Text="搜索" class="btnSearch" BackColor="#598F30"
                            BorderStyle="None" ForeColor="White" Width="40px" Height="20px" 
                            onclick="btnSearch_Click" /></td>
                    </tr>
                    </table>
                        
                        <%--<asp:TextBox ID="txtSearch" runat="server" BorderColor="#13683D" BorderStyle="Solid"
                            BorderWidth="1px" class="txtSearch" Height="17px"></asp:TextBox>--%>
                        
                    </div>
                </div>
                </div>
                <div>
               <ul class="topnav">
                        <li style="font-size: 13px;"><a href="../Main_index.aspx">首页</a>
                            <%--<ul class="subnav">
                                <li><a href="">添加标题</a></li>
                                <li><a href="">添加标题</a></li>
                            </ul>--%>
                        </li>
                        <li style="font-size: 13px;"><a href="KCfaculty.aspx">课程总览</a>
                            <ul class="subnav">
                                <li><a href="CourseView.aspx">所有课程</a></li>
                                <li><a href="RMCourse.aspx">热门课程</a></li>
                                <li><a href="JPKFCourse.aspx">精品开放课程</a></li>
                                <li><a href="TSJYCourse.aspx">通识教育选修课</a></li>
                                <li><a href="XWYZCourse.aspx">校外优质课程</a></li>
                            </ul>
                        </li>
                         <li style="font-size: 13px;"><a href="MajorView.aspx?majortype=4">专业设置</a>
                             <ul class="subnav">
                                <li><a href="MajorView.aspx?majortype=1">品牌(特色)专业</a></li>
                                <li><a href="MajorView.aspx?majortype=2">战略支柱产业专业</a></li>
                                <li><a href="MajorView.aspx?majortype=3">综合改革试点专业</a></li>
                            </ul>
                        </li>
                        <li style="font-size: 13px;"><a href="TeacherFamous.aspx?tchtype=4">优秀教师</a>
                             <ul class="subnav">
                                <li><a href="TeacherFamous.aspx?tchtype=1">教学名师</a></li>
                                <li><a href="TeacherFamous.aspx?tchtype=2">教学质量优秀奖教师</a></li>
                                <li><a href="TeacherFamous.aspx?tchtype=3">教学技能大赛获奖教师</a></li>
                            </ul>
                        </li>
                        <li style="font-size: 13px;"><a href="News.aspx">新闻公告</a>
                            <%-- <ul class="subnav">
                                <li><a href="">添加标题</a></li>
                                <li><a href="">添加标题</a></li>
                            </ul>--%>
                        </li>
                        <%--2013.22.29加上友情链接 By张敏 --%>
                        <li style="font-size: 13px;"><a>友情链接</a>
                            <ul class="subnav">
                                <li><a href="http://www.hubu.edu.cn/" target="_blank">湖北大学</a></li>
                                <li><a href="http://jwc.hubu.edu.cn/" target="_blank">湖北大学教务处</a></li>
                                <li><a href="http://www.jingpinke.com/" target="_blank">国家精品课程资源网</a></li>
                                <li><a href="http://kczx.whu.edu.cn/G2S/ShowSystem/Index.aspx" target="_blank">武汉大学课程中心</a></li>
                                <li><a href="http://curriculum.hust.edu.cn/" target="_blank">华中科技大学课程中心</a></li>
                                <li><a href="http://www.icourses.cn/home/" target="_blank">爱课程网站</a></li>
                                <li><a href="http://www.xuetangx.com/" target="_blank">学堂在线</a></li>
                            </ul>
                        </li>
                    </ul>
            <%--2013.22.29加上访问量—任俊伟--%>
            <div class="visit">
                <span>
                    <asp:Label ID="lblOnline" runat="server" Text="Label"></asp:Label>
                    <asp:Label ID="lblTotal" runat="server" Text="Label"></asp:Label></span></div>
        </div>
        <div class="body" align="center">
            <a name='top'></a>
            <br />
            <br />
            <br />
            <asp:Repeater ID="rptNews" runat="server" DataSourceID="odsNews">
                <ItemTemplate>
                    <table width="65%" style="text-align: left; line-height: 200%;">
                        <tr>
                            <td style="font-size: x-large; color:black; font-weight: bold;" align="center">
                                <%# Eval("新闻标题") %>
                            </td>
                        </tr>
                        <tr>
                            <td style="font-size: small; color: #808080;" align="center">
                                最后更新时间：<%# Eval("最后更新时间") %>&nbsp;浏览次数：<%# Eval("浏览次数")%> &nbsp;发布者：<%# Eval("发布者")%>&nbsp;发布时间：<%# Convert.ToDateTime(Eval("发布时间")).ToString("yyyy年MM月dd日")%>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <hr />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <%# Eval("新闻内容") %>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                               
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                
                            </td>
                        </tr>
                        <tr>
                            <td>
                                附件下载：无
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:Repeater>
            <br />
            <%--<a href="#top">返回顶部</a>--%>
            <asp:ObjectDataSource ID="odsNews" runat="server" OldValuesParameterFormatString="original_{0}"
                SelectMethod="GetOneNews" TypeName="MainDataSetTableAdapters.TA_新闻表TableAdapter">
                <SelectParameters>
                    <asp:QueryStringParameter Name="新闻ID" QueryStringField="NewsID" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </div>
        <div>
            &nbsp;</div>
        <div style="background-color: #6B8E23; height: 5px">
            &nbsp;</div>
        <center style="font-size: 12px">
            版权说明</center>
    </div>
    </form>
</body>
</html>
