<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TeacherFamousInfo.aspx.cs"
    Inherits="KC_TeacherFamous" %>

<%@ Register Assembly="DevExpress.Web.ASPxHtmlEditor.v13.2, Version=13.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxHtmlEditor" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxSpellChecker.v13.2, Version=13.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxSpellChecker" TagPrefix="dx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>名师简介</title>
    <link href="../Styles/master.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/KCfaculty.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script src="../Scripts/ScoreTop.js" type="text/javascript"></script>
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
    <style type="text/css">
        .repMSJX
        {
            font-size: 14px;
            color:  Black;
            border: 1px solid #6B8E23;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div class="returntop">
            <img alt="回顶部" id="img1" src="../image/returntop1.jpg" />
            <img alt="回顶部" id="img2" style="display: none;" src="../image/returntop2.jpg" /></div>
        <div class="container">
            <div>
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
            </div>
            <div style="height: 10px; float: left;">
                &nbsp;</div>
            <div style="text-align: center">
                <img alt="湖北大学" src="../image/banner.jpg" /></div>
            <div style="height: 2px">
                &nbsp;</div>
            <div class="body">
            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="odsTeacherInfo" OnItemDataBound="Repeater1_ItemDataBound">
                    <HeaderTemplate>
                        <table width="100%" class="repMSJX">
                            <tr>
                                <td align="center" colspan="6">
                                    <h2>
                                        名师简介</h2>
                            </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                    <tr><td>
                    <table>
                    <tr>
                    <td rowspan="2" width="25%" align="right" style="vertical-align: middle;"> 
                    <asp:Image ID="Image1" runat="server" Height="120px" Width="96px" ImageUrl='<%# Eval("教师图片").ToString()!=""?Eval("教师图片"):"~/image/public/noup.jpg" %>' />
                    </td>
                    <td align="right" width="120px" height="40px">
                                <strong>教师姓名:</strong>
                            </td>
                            <td align="left" width="150px">
                                <%#Eval("教师姓名") %>
                            </td>
                     <td align="right" width="100px">
                                <strong>所属学院:</strong>
                            </td>
                            <td width="350px" align="left">
                                <asp:Label ID="lblSchool" runat="server" Text=""></asp:Label>
                            </td>
                    </tr>
                    <tr>
                    <td align="right" height="40px">
                                <strong>获奖级别:</strong>
                            </td>
                            <td>
                                <asp:Label ID="lblWinning" runat="server" Text=""></asp:Label>
                            </td>
                            <td align="right">
                                <strong>获奖年度:</strong>
                            </td>
                            <td>
                                <%#Eval("获奖年度") %>
                            </td>
                    </tr>
                    <tr>
                    <td align="right" height="40px">
                                <strong>点击量:</strong>
                            </td>
                            <td>
                                <%#Eval("点击量") %>
                            </td>
                    <td> &nbsp;</td>
                    <td> &nbsp;</td>
                    <td> &nbsp;</td>
                    </tr>
                    </table> 
                        <table width="100%">
                        <tr>
                            <td align="center" valign="top" width="100%">
                                <strong>教师简介:</strong>
                            </td>  
                        </tr>
                        <tr>
                        <td align="center">
                        <table width="80%">
                        <tr>
                        <td align="left">
                        <%#Eval("教师简介") %>
                        </td>
                        </tr>
                        </table>
                                
                            </td>
                        </tr>
                        </table>
                        <table width="100%">
                        <tr><td align="right" style=" font-size:13px; padding-right:60px;"><a style="color:#698B22" href="TeacherFamous.aspx">返回上一页</a></td></tr>
                        </table>
                    </td>
                    </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                        </table>
                    </FooterTemplate>
                </asp:Repeater>
            </div>
            <div>
                &nbsp;</div>
            <div style="background-color: #6B8E23; height: 5px">
                &nbsp;</div>
            <center style="font-size: 12px">
                版权说明</center>
        </div>
    </div>
    <asp:ObjectDataSource ID="odsTeacherInfo" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetData教师信息ByID" TypeName="MainDataSetTableAdapters.TA_教师信息表TableAdapter">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="-1" Name="教师ID" SessionField="TeacherID" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    </form>
</body>
</html>
