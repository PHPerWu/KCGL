<%@ Page Language="C#" AutoEventWireup="true" CodeFile="KCinfo.aspx.cs" Inherits="KC_KCinfo" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>课程详情</title>
    <script src="../Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
    <link href="../Styles/master.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/KCinfo.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/ScoreTop.js" type="text/javascript"></script>
    <style type="text/css">
        .table
        {
            border: 1px solid #496077;
            border-collapse: collapse;
            text-align: left;
        }
        .table td
        {
            border: 1px solid #496077;
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
    <div>
        <div class="returntop">
            <img alt="回顶部" id="img1" src="../image/returntop1.jpg" />
            <img alt="回顶部" id="img2" style="display: none;" src="../image/returntop2.jpg" /></div>
        <div class="container">
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
            <div style="height: 10px; float: left;">
                &nbsp;</div>
            <div style="text-align: center">
                <img alt="湖北大学" src="../image/banner.jpg" /></div>
            <div style="height: 2px">
                &nbsp;</div>
            <div class="body">
                <table width="100%">
                    <tr>
                        <td width="100%" valign="top">
                            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="odsKCXX">
                                <HeaderTemplate>
                                    <table width="100%" class="rptb">
                                </HeaderTemplate>
                                <FooterTemplate>
                                    </table></FooterTemplate>
                                <ItemTemplate>
                                    <tr>
                                        <td width="45%">
                                            &nbsp;&nbsp;<b>课程名称：</b><%#Eval("课程名称") %>
                                        </td>
                                        <td>
                                            <b>点击量：</b><%#Eval("课程点击量") %>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;&nbsp;<b>课程级别：</b><%#Eval("课程级别名") %>
                                        </td>
                                        <td>
                                            <b>评分：</b><%#Eval("评分") %>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;&nbsp;<b>总学时：</b><%#Eval("总学时") %>学时
                                        </td>
                                        <td>
                                            <b>讲授学时：</b><%#Eval("讲授学时") %>学时
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;&nbsp;<b>实践学时：</b><%#Eval("实践学时") %>学时
                                        </td>
                                        <td>
                                            <b>实验学时：</b><%#Eval("实验学时") %>学时
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;&nbsp;<b>课程类别：</b><%#Eval("课程类别名") %>
                                        </td>
                                        <td>
                                            <b>课程性质：</b><%#Eval("课程性质名") %>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;&nbsp;<b>课程学分：</b><%#Eval("课程学分") %>学分
                                        </td>
                                        <td>
                                            <b>双学位课程：</b><%#Eval("双学位课程").Equals(1)?"是":"否" %>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;&nbsp;<b>教学方式：</b><%#Eval("教学方式名") %>
                                        </td>
                                        <td>
                                            <b>考核方式：</b><%#Eval("考核方式名") %>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;&nbsp;<b>先修课程：</b><%#Eval("先修课程名称") %>
                                        </td>
                                        <td>
                                            <b>后续课程：</b><%#Eval("后续课程名称")%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;&nbsp;<b>开课学院：</b><%#Eval("开课学院名") %>
                                        </td>
                                        <td>
                                            <b>面向对象：</b><%#Eval("面向对象名") %>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;&nbsp;<b>创建人：</b><%#Eval("创建人") %>
                                        </td>
                                        <td>
                                            <b>创建时间：</b><%#Eval("创建时间","{0:yyyy年MM月dd日}") %>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;&nbsp;<b>精品视频公开课：</b><%#Eval("精品视频公开课").Equals(1) ? "是" : "否"%>
                                        </td>
                                        <td>
                                            <b>精品资源共享课：</b><%#Eval("精品资源共享课").Equals(1) ? "是" : "否"%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;&nbsp;<b>开课学期：</b><%#Eval("学期名") %>
                                        </td>
                                        <td>
                                            <b>精品教程网址：</b><a href='<%#Eval("精品课程网址")%>' target="_blank"><%# Eval("精品课程网址").ToString().Length < 40 ? Eval("精品课程网址") : Eval("精品课程网址").ToString().Substring(0, 40) + "..."%></a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;&nbsp;<b>使用教材:</b><%#Eval("使用教材") %>
                                        </td>
                                        <td>
                                            <b>主要参考书目：</b><%#Eval("主要参考书目") %>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;&nbsp;<b>教学计划：</b><%#Eval("教学计划") %>
                                        </td>
                                        <td>
                                            <b>教学大纲：</b><%#Eval("教学大纲") %>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </td>
                    </tr>
                </table>
                <table class="table" width="100%">
                    <tr>
                        <td>
                            课程名称：
                        </td>
                        <td>
                            课程级别：
                        </td>
                        <td>
                            点击量：
                        </td>
                        <td rowspan="4">
                            图片
                        </td>
                    </tr>
                    <tr>
                        <td>
                            总学时：
                        </td>
                        <td>
                            实践学时：
                        </td>
                        <td>
                            课程类别：
                        </td>
                    </tr>
                    <tr>
                        <td>
                            课程学分：
                        </td>
                        <td>
                            教学方式：
                        </td>
                        <td>
                            先修课程：
                        </td>
                    </tr>
                    <tr>
                        <td>
                            创建人：
                        </td>
                        <td>
                            精品视频公开课：
                        </td>
                        <td>
                            开课学期：
                        </td>
                    </tr>
                    <tr>
                        <td>
                            教学计划：
                        </td>
                        <td>
                            主要参考书目：
                        </td>
                        <td>
                            开课学院：
                        </td>
                        <td>
                            使用教材:
                        </td>
                    </tr>
                    <tr>
                        <td>
                            主要参考书目：
                        </td>
                        <td>
                            教学大纲：
                        </td>
                        <td>
                            创建时间：
                        </td>
                        <td>
                            精品教程网址：
                        </td>
                    </tr>
                    <tr>
                        <td>
                            评分：
                        </td>
                        <td>
                            讲授学时：
                        </td>
                        <td>
                            实验学时：
                        </td>
                        <td>
                            课程性质：
                        </td>
                    </tr>
                    <tr>
                        <td>
                            双学位课程：
                        </td>
                        <td>
                            考核方式：
                        </td>
                        <td>
                            后续课程：
                        </td>
                        <td>
                            创建时间：
                        </td>
                    </tr>
                </table>
            </div>
            <div>
                &nbsp;</div>
            <div style="background-color: #6B8E23; height: 5px">
                &nbsp;</div>
            <center style="font-size: 12px">
                版权说明</center>
        </div>
        <asp:ObjectDataSource ID="odsKCXX" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetXXKCXXByKCDM" TypeName="MainDataSetTableAdapters.TA_课程信息表TableAdapter">
            <SelectParameters>
                <asp:QueryStringParameter Name="课程代码" QueryStringField="KCID" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </div>
    </form>
</body>
</html>
