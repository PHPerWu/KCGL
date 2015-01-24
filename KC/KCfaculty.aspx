<%@ Page Language="C#" AutoEventWireup="true" CodeFile="KCfaculty.aspx.cs" Inherits="KC_KCFaculty" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxDataView" TagPrefix="dx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>湖北大学院系专业</title>
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
        
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
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
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <table width="100%">
                            <tr valign="top">
                                <td width="100%" valign="top">
                                    <table width="100%">
                                        <tr>
                                            <td width="75%" valign="top">
                                                <table width="100%">
                                                    <tr>
                                                        <td valign="top">
                                                            <%--style="border-right: 2px solid #333" class="style1"--%>
                                                            <div>
                                                                <div id="divXY">
                                                                    <b>湖北大学院系总览</b>
                                                                </div>
                                                                <div>
                                                                    <asp:DataList ID="dltXY" runat="server" RepeatColumns="6" Width="100%" DataKeyField="学院ID"
                                                                        DataSourceID="odsXY" OnItemCommand="dltXY_ItemCommand" ForeColor="black">
                                                                        <HeaderTemplate>
                                                                            <table>
                                                                        </HeaderTemplate>
                                                                        <FooterTemplate>
                                                                            </table></FooterTemplate>
                                                                        <ItemTemplate>
                                                                            <asp:Button ID="Button1" runat="server" Text='<%# Eval("学院名称") %>' Width="160px"
                                                                                Height="30px" ToolTip="点击查看学院下的专业和课程" BorderColor="#6B8E23" BorderWidth="1px"
                                                                                BackColor="#A2CD5A" ForeColor="black" Font-Size="15px" CssClass="lbxy" CommandName="XY"
                                                                                CommandArgument='<%#Eval("学院ID")+"|"+Eval("学院名称") %>' />
                                                                        </ItemTemplate>
                                                                    </asp:DataList>
                                                                </div>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <%--2013.22.29 任俊伟修改--%>
                                            <%--  <td width="25%" valign="top">
                                                <table width="100%">
                                                    <tr>
                                                        <td valign="top">
                                                            <div>
                                                                <div id="divZY">
                                                                    <b>
                                                                        <asp:Label ID="lbzyname" runat="server" Text="专业名称"></asp:Label></b>
                                                                </div>
                                                                <div>
                                                                    <asp:DataList ID="dltZY" runat="server" DataSourceID="odsZY" OnItemCommand="dltZY_ItemCommand"
                                                                        Width="100%">
                                                                        <ItemTemplate>
                                                                            <asp:Button ID="Button1" runat="server" Text='<%# Eval("专业名称") %>' Width="240px"
                                                                                Height="20px" ToolTip="点击查看专业下的课程" BorderColor="#6B8E23" BorderWidth="1px" BackColor="#A2CD5A"
                                                                                Font-Size="12px" CssClass="lbxy" ForeColor="black" CommandArgument='<%#Eval("专业ID")+"|"+Eval("专业名称") %>'
                                                                                CommandName="ZY" />
                                                                        </ItemTemplate>
                                                                    </asp:DataList>
                                                                </div>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>--%>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr valign="top">
                                <td width="100%" valign="top">
                                    <table width="100%">
                                        <tr>
                                            <td width="100%" valign="top" style="border-top: 2px solid #333">
                                                <div>
                                                    <div id="divKC" style="">
                                                        <b>
                                                            <asp:Label ID="lblKCname" runat="server" Text="课程名称"></asp:Label></b>
                                                    </div>
                                                    <div>
                                                        <dx:ASPxDataView ID="dvKC" runat="server" ColumnCount="6" ToolTip="点击课程查看详情" Width="100%"
                                                            EmptyDataText="暂无相关课程" DataSourceID="odsKC" Theme="Glass">
                                                            <ItemTemplate>
                                                                <asp:LinkButton ID="LinkButton1" runat="server" Text='<%# Eval("课程名称").ToString().Length>12?Eval("课程名称").ToString().Substring(0,12):Eval("课程名称") %>'
                                                                    Height="35px" Style="line-height:35px;" ToolTip='<%# Eval("课程名称")%>'  BorderColor="#6B8E23"
                                                                    ForeColor="black" BorderWidth="1px" BackColor="#A2CD5A" Font-Size="13px" CssClass="lbxy"
                                                                    PostBackUrl='<%# "~/KC/PTKCInfo.aspx?KCID=" + Eval("课程代码") %>' Width="100%" Font-Strikeout="False"
                                                                    Font-Underline="False" >
                                                                </asp:LinkButton>
                                                            </ItemTemplate>
                                                            <SettingsFlowLayout ItemsPerPage="16" />
                                                            <SettingsTableLayout ColumnCount="6" RowsPerPage="10" />
                                                            <PagerSettings Position="Bottom"> 
                                                                <FirstPageButton Text="第一页">
                                                                </FirstPageButton>
                                                                <LastPageButton Text="最后一页">
                                                                </LastPageButton>
                                                                <Summary Text="当前第{0}页/共{1}页" />
                                                            </PagerSettings>
                                                            <ItemStyle Height="20px" HorizontalAlign="Center" VerticalAlign="Middle">
                                                                <Paddings PaddingBottom="0px" PaddingLeft="0px" PaddingRight="0px" PaddingTop="0px" />
                                                            </ItemStyle>
                                                            <PagerPageSizeItemStyle Width="20px">
                                                            </PagerPageSizeItemStyle>
                                                            <EmptyDataStyle ForeColor="Black">
                                                            </EmptyDataStyle>
                                                        </dx:ASPxDataView>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
            <div>
                &nbsp;</div>
            <div style="background-color: #6B8E23; height: 5px">
                &nbsp;</div>
            <center style="font-size: 12px">
                版权说明</center>
        </div>
        <asp:ObjectDataSource ID="odsXY" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetDataByID" TypeName="MainDataSetTableAdapters.TA_学院信息表TableAdapter">
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="odsZY" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetDataByXYID" TypeName="MainDataSetTableAdapters.TA_专业信息表TableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="hdfXYID" DefaultValue="-1" Name="所属学院" PropertyName="Value"
                    Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:HiddenField ID="hdfXYID" runat="server" />
        <asp:ObjectDataSource ID="odsKC" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetKCByYX" TypeName="MainDataSetTableAdapters.TA_课程信息表TableAdapter"
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
            <SelectParameters>
                <asp:SessionParameter DefaultValue="-1" Name="YX" SessionField="SYYX" Type="String" />
            </SelectParameters>
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
        <asp:HiddenField ID="hdfSYYX" runat="server" />
        <asp:HiddenField ID="hdfSYZY" runat="server" />
    </div>
    </form>
</body>
</html>
