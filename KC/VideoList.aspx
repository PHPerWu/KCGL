﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="VideoList.aspx.cs" Inherits="VideoList" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxDataView" TagPrefix="dx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>课程总览</title>
    <script src="../Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
    <link href="../Styles/master.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/KCinfo.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/ScoreTop.js" type="text/javascript"></script>
    <link href="../Styles/PageforCommunication.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        
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
                        <li style="font-size: 13px;"><a href="~/KC/KCfaculty.aspx">课程总览</a>
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
            <div class="body" style="margin: 0px; padding: 0px">
                <%--<div id="vertmenu" style="float: left; width: 20%; margin: 0px; padding: 0px">
                    <dl class="label" width="100%" style="margin: 0px; padding: 0px">
                        <dt>学术交流</dt>
                        <dd>
                            <a href='../InlandCom.aspx'>所有课程</a></dd>
                        <dd>
                            <a href='../InterCom.aspx'>通识教育课程</a></dd>
                        <dd>
                            <a href='../GATCom.aspx'>精品开放课程</a></dd>
                        <dd>
                            <a href='../GATCom.aspx'>校外优质课程</a></dd>
                    </dl>
                </div>--%><%--<div style="float: right; width: 80%">--%>
                <div class="VideoTitle">
                    <asp:Label ID="lblTitle" runat="server" Text=""></asp:Label></div>
                <dx:ASPxDataView ID="dvVideo" runat="server" AlwaysShowPager="True" BackColor="White"
                    ColumnCount="4" RowPerPage="4" ItemSpacing="0px" EnableTheming="True" RightToLeft="False"
                    Theme="Glass" Width="1000px" DataSourceID="odsVideo">
                    <SettingsFlowLayout ItemsPerPage="16"></SettingsFlowLayout>
                    <SettingsTableLayout ColumnCount="4" RowsPerPage="4" />
                    <PagerSettings Position="Bottom">
                    </PagerSettings>
                    <ItemTemplate>
                        <table width="240px" class="VideoList">
                            <tr>
                                <td colspan="3" align="center">
                                    <a href="VideoView.aspx?url=<%#Eval("视频路径").ToString().Substring(9) %>&ID=<%#Eval("视频ID") %>"
                                        title='<%#Eval("视频名称") %>' target="_blank">
                                        <asp:Image ID="img" runat="server" ImageUrl='<%#Eval("图片路径") %>' Width="210px" Height="140px" />
                                    </a>
                                </td>
                            </tr>
                            <tr>
                                <td width="15px">
                                </td>
                                <td width="210px" align="left">
                                    <a href="VideoView.aspx?url=<%#Eval("视频路径").ToString().Substring(9) %>&ID=<%#Eval("视频ID") %>"
                                        title=" <%#Eval("视频名称")%>" target="_blank">
                                        <%#Eval("视频名称")%></a>
                                </td>
                                <td width="15px">
                                </td>
                            </tr>
                            <tr>
                                <td width="15px">
                                </td>
                                <td width="210px" align="right" class="time">
                                    [<%#Eval("视频上传时间", "{0:yyyy/MM/dd}")%>]
                                </td>
                                <td width="15px">
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                    <Paddings PaddingLeft="0px" PaddingRight="0px" PaddingTop="0px" />
                    <ItemStyle BackColor="White" HorizontalAlign="Center" VerticalAlign="Top">
                        <Paddings PaddingBottom="10px" PaddingLeft="0px" PaddingRight="0px" PaddingTop="0px" />
                        <Border BorderStyle="None" />
                    </ItemStyle>
                    <PagerSummaryStyle HorizontalAlign="Center">
                    </PagerSummaryStyle>
                    <Border BorderStyle="None" />
                </dx:ASPxDataView>
                <asp:ObjectDataSource ID="odsVideo" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="MainDataSetTableAdapters.TA_课程视频表TableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="hfdKCID" DefaultValue="-1" Name="课程ID" PropertyName="Value"
                            Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:HiddenField ID="hfdKCID" runat="server" />
            </div>
            <div>
                &nbsp;</div>
            <div style="background-color: #6B8E23; height: 5px">
                &nbsp;</div>
            <center style="font-size: 12px">
                版权说明</center>
        </div>
    </div>
    </form>
</body>
</html>
