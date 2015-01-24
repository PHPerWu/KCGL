﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RMCourse.aspx.cs" Inherits="KC_RMCourse" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
                </div>--%>                <%--<div style="float: right; width: 80%">--%>
                <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="odsRMKC"
                    KeyFieldName="课程代码" Width="100%" Theme="Glass">
                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="课程代码" VisibleIndex="0" ReadOnly="True" 
                            Visible="False">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="课程名称" VisibleIndex="1">
                            <Settings AllowHeaderFilter="True" HeaderFilterMode="CheckedList" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="课程点击量" VisibleIndex="4">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="开课学院名称" VisibleIndex="3" Caption="开课学院">
                            <Settings AllowHeaderFilter="True" HeaderFilterMode="CheckedList" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="课程类别名" VisibleIndex="2" Caption="课程类别">
                            <Settings AllowHeaderFilter="True" HeaderFilterMode="CheckedList" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="查看详情" VisibleIndex="5">
                            <DataItemTemplate>
                                <dx:ASPxButton ID="btnInfo" runat="server" 
                                    CommandArgument='<%# Eval("课程代码") %>' EnableTheming="True" 
                                    oncommand="btnInfo_Command" Text="查看详情&gt;&gt;" Theme="Aqua">
                                    <Border BorderStyle="None" />
                                </dx:ASPxButton>
                            </DataItemTemplate>
                        </dx:GridViewDataTextColumn>
                    </Columns>
                    <SettingsPager PageSize="20">
                    </SettingsPager>
                    <Settings ShowTitlePanel="True" />
                    <SettingsText Title="热门课程" />
                    <Styles>
                        <Header HorizontalAlign="Center" VerticalAlign="Middle">
                        </Header>
                        <Cell HorizontalAlign="Center" VerticalAlign="Middle">
                        </Cell>
                        <TitlePanel Font-Bold="True" ForeColor="Black" HorizontalAlign="Center" 
                            Font-Size="Medium">
                        </TitlePanel>
                    </Styles>
                </dx:ASPxGridView>
                <%--  </div>--%>
                <asp:ObjectDataSource ID="odsRMKC" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataHotKC" 
                    TypeName="MainDataSetTableAdapters.TA_课程信息表TableAdapter" 
                    DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update">
                    <DeleteParameters>
                        <asp:Parameter Name="Original_课程代码" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="课程代码" Type="String" />
                        <asp:Parameter Name="开课学期" Type="String" />
                        <asp:Parameter Name="课程性质" Type="String" />
                        <asp:Parameter Name="课程类别" Type="String" />
                        <asp:Parameter Name="先修课程" Type="String" />
                        <asp:Parameter Name="使用教材" Type="String" />
                        <asp:Parameter Name="双学位课程" Type="Decimal" />
                        <asp:Parameter Name="总学时" Type="Decimal" />
                        <asp:Parameter Name="讲授学时" Type="Decimal" />
                        <asp:Parameter Name="实践学时" Type="Decimal" />
                        <asp:Parameter Name="精品视频公开课" Type="Decimal" />
                        <asp:Parameter Name="精品课程网址" Type="String" />
                        <asp:Parameter Name="开课学院" Type="String" />
                        <asp:Parameter Name="课程名称" Type="String" />
                        <asp:Parameter Name="后续课程" Type="String" />
                        <asp:Parameter Name="课程学分" Type="Decimal" />
                        <asp:Parameter Name="考核方式" Type="String" />
                        <asp:Parameter Name="教学方式" Type="String" />
                        <asp:Parameter Name="主要参考书目" Type="String" />
                        <asp:Parameter Name="教学计划" Type="Object" />
                        <asp:Parameter Name="教学大纲" Type="Object" />
                        <asp:Parameter Name="精品资源共享课" Type="Decimal" />
                        <asp:Parameter Name="评分" Type="Decimal" />
                        <asp:Parameter Name="已评分人数" Type="Decimal" />
                        <asp:Parameter Name="实验学时" Type="Decimal" />
                        <asp:Parameter Name="课程点击量" Type="Decimal" />
                        <asp:Parameter Name="课程级别" Type="String" />
                        <asp:Parameter Name="面向对象" Type="String" />
                        <asp:Parameter Name="创建时间" Type="DateTime" />
                        <asp:Parameter Name="创建人" Type="String" />
                        <asp:Parameter Name="课程描述" Type="Object" />
                        <asp:Parameter Name="立项级别" Type="String" />
                        <asp:Parameter Name="立项年度" Type="String" />
                        <asp:Parameter Name="课程负责人" Type="String" />
                        <asp:Parameter Name="课程图片" Type="String" />
                        <asp:Parameter Name="喜欢" Type="Decimal" />
                        <asp:Parameter Name="一般喜欢" Type="Decimal" />
                        <asp:Parameter Name="不喜欢" Type="Decimal" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="开课学期" Type="String" />
                        <asp:Parameter Name="课程性质" Type="String" />
                        <asp:Parameter Name="课程类别" Type="String" />
                        <asp:Parameter Name="先修课程" Type="String" />
                        <asp:Parameter Name="使用教材" Type="String" />
                        <asp:Parameter Name="双学位课程" Type="Decimal" />
                        <asp:Parameter Name="总学时" Type="Decimal" />
                        <asp:Parameter Name="讲授学时" Type="Decimal" />
                        <asp:Parameter Name="实践学时" Type="Decimal" />
                        <asp:Parameter Name="精品视频公开课" Type="Decimal" />
                        <asp:Parameter Name="精品课程网址" Type="String" />
                        <asp:Parameter Name="开课学院" Type="String" />
                        <asp:Parameter Name="课程名称" Type="String" />
                        <asp:Parameter Name="后续课程" Type="String" />
                        <asp:Parameter Name="课程学分" Type="Decimal" />
                        <asp:Parameter Name="考核方式" Type="String" />
                        <asp:Parameter Name="教学方式" Type="String" />
                        <asp:Parameter Name="主要参考书目" Type="String" />
                        <asp:Parameter Name="教学计划" Type="Object" />
                        <asp:Parameter Name="教学大纲" Type="Object" />
                        <asp:Parameter Name="精品资源共享课" Type="Decimal" />
                        <asp:Parameter Name="评分" Type="Decimal" />
                        <asp:Parameter Name="已评分人数" Type="Decimal" />
                        <asp:Parameter Name="实验学时" Type="Decimal" />
                        <asp:Parameter Name="课程点击量" Type="Decimal" />
                        <asp:Parameter Name="课程级别" Type="String" />
                        <asp:Parameter Name="面向对象" Type="String" />
                        <asp:Parameter Name="创建时间" Type="DateTime" />
                        <asp:Parameter Name="创建人" Type="String" />
                        <asp:Parameter Name="课程描述" Type="String" />
                        <asp:Parameter Name="立项级别" Type="String" />
                        <asp:Parameter Name="立项年度" Type="String" />
                        <asp:Parameter Name="课程负责人" Type="String" />
                        <asp:Parameter Name="Original_课程代码" Type="String" />
                    </UpdateParameters>
                </asp:ObjectDataSource>
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
