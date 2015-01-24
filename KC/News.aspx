<%@ Page Language="C#" AutoEventWireup="true" CodeFile="News.aspx.cs" Inherits="KC_News" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.Web.v13.2, Version=13.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>新闻公告</title>
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
                        <li style="font-size: 13px;"><a href="TeacherFamous.aspx">优秀教师</a>
                             <ul class="subnav">
                                <li><a href="">教学名师</a></li>
                                <li><a href="">教学质量优秀奖教师</a></li>
                                <li><a href="">教学技能大赛获奖教师</a></li>
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
                <div>
                    <center>
                        <font size="4"><strong>新闻公告</strong></font></center>
                </div>
                <div class="body" align="center">
                    <dx:ASPxGridView ID="gvNews" class="gvclass" runat="server" AutoGenerateColumns="False"
                        DataSourceID="odsNews" KeyFieldName="新闻ID" Width="80%" EnableTheming="False"
                        ClientInstanceName="cl_gvNews" SettingsPager-PageSize="7" 
                        Font-Names="华文细黑" Font-Size="Smaller" style="text-align: center">
                        <SettingsBehavior AllowDragDrop="False" AllowGroup="False" AllowSort="False" />
                        <Columns>
                            <dx:GridViewDataTextColumn FieldName="新闻标题" VisibleIndex="0" Width="85%">
                                <DataItemTemplate>
                                <li style=" line-height:20px; list-style-type:none;border-bottom-width:1px;
                                         border-bottom-style:dashed; border-bottom-color:#C0C0C0; ">
                                         ●
                                         <a class="ahover" href='<%# "ViewNews.aspx?NewsID=" +  Eval("新闻ID") %>' target="_blank"
                                        style="font-size: 15px; color: Black;" title='<%#Eval("新闻标题")%>'>
                                        <%# Eval("新闻标题").ToString().Length < 30 ? Eval("新闻标题") : Eval("新闻标题").ToString().Substring(0, 30) + "..."%></a>
                                    </li>        
                                </DataItemTemplate>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataDateColumn FieldName="最后更新时间" VisibleIndex="2" Width="15%">
                            <DataItemTemplate>
                            <li style=" line-height:20px; list-style-type:none;border-bottom-width:1px;
                                         border-bottom-style:dashed; border-bottom-color:#C0C0C0; ">
                                         <%#Eval("最后更新时间", "{0:yyyy/MM/dd}")%>
                            </li>
                            </DataItemTemplate>
                                <PropertiesDateEdit DisplayFormatString="[yyyy-MM-dd]" >
                                </PropertiesDateEdit>
                            </dx:GridViewDataDateColumn>
                        </Columns>
                        <SettingsPager AlwaysShowPager="True" PageSize="8" ShowNumericButtons="False">
                            <AllButton>
                                <Image ToolTip="显示全部">
                                </Image>
                            </AllButton>
                            <FirstPageButton Visible="True">
                                <Image AlternateText="首页" ToolTip="首页">
                                </Image>
                            </FirstPageButton>
                            <LastPageButton Visible="True">
                                <Image AlternateText="尾页" ToolTip="尾页">
                                </Image>
                            </LastPageButton>
                            <NextPageButton>
                                <Image AlternateText="下一页" ToolTip="下一页">
                                </Image>
                            </NextPageButton>
                            <PrevPageButton>
                                <Image AlternateText="上一页" ToolTip="上一页">
                                </Image>
                            </PrevPageButton>
                            <Summary Text="第{0}页/共{1}页(共{2}条)" Visible="False" />
                        </SettingsPager>
                        <Settings GridLines="None" ShowColumnHeaders="False"></Settings>
                        <SettingsText EmptyDataRow="暂无新闻" />
                        <Styles>
                            <EmptyDataRow BackColor="#F7F8F9">
                            </EmptyDataRow>
                            <Cell ForeColor="Black" HorizontalAlign="Left" VerticalAlign="Middle" BackColor="#F7F8F9">
                                <Paddings PaddingBottom="10px" />
                                <Border BorderStyle="None" />
                            </Cell>
                            <PagerBottomPanel BackColor="#F7F8F9" HorizontalAlign="Center">
                                <Border BorderStyle="None" />
                            </PagerBottomPanel>
                        </Styles>
                        <Border BorderStyle="None"></Border>
                    </dx:ASPxGridView>
                    <asp:ObjectDataSource ID="odsNews" runat="server" OldValuesParameterFormatString="original_{0}"
                        SelectMethod="GetPubNews" TypeName="MainDataSetTableAdapters.TA_新闻表TableAdapter">
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
    </div>
    </form>
</body>
</html>
