<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Main_index.aspx.cs" Inherits="Main_index" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>湖北大学课程中心</title>
    <link href="Styles/master.css" rel="stylesheet" type="text/css" />
    <link href="Styles/Main_index.css" rel="stylesheet" type="text/css" />
    <script src="Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script src="Scripts/ScoreTop.js" type="text/javascript"></script>
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
            //


        });
    </script>
    <style type="text/css">
        .style1
        {
            width: 81px;
        }
        .style2
        {
            width: 99px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div class="returntop">
            <img alt="回顶部" id="img1" src="image/returntop1.jpg" />
            <img alt="回顶部" id="img2" style="display: none;" src="image/returntop2.jpg" /></div>
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
                <div >
                    <ul class="topnav">
                        <li style="font-size: 13px;"><a href="Main_index.aspx">首页</a>
                            <%--<ul class="subnav">
                                <li><a href="">添加标题</a></li>
                                <li><a href="">添加标题</a></li>
                            </ul>--%>
                        </li>
                        <li style="font-size: 13px;"><a href="KC/KCfaculty.aspx">课程总览</a>
                            <ul class="subnav">
                                <li><a href="KC/CourseView.aspx">所有课程</a></li>
                                <li><a href="KC/RMCourse.aspx">热门课程</a></li>
                                <li><a href="KC/JPKFCourse.aspx">精品开放课程</a></li>
                                <li><a href="KC/TSJYCourse.aspx">通识教育选修课</a></li>
                                <li><a href="KC/XWYZCourse.aspx">校外优质课程</a></li>
                            </ul>
                        </li>
                        <li style="font-size: 13px;"><a href="KC/MajorView.aspx?majortype=4">专业设置</a>
                             <ul class="subnav">
                                <li><a href="KC/MajorView.aspx?majortype=1">品牌(特色)专业</a></li>
                                <li><a href="KC/MajorView.aspx?majortype=2">战略支柱产业专业</a></li>
                                <li><a href="KC/MajorView.aspx?majortype=3">综合改革试点专业</a></li>
                            </ul>
                        </li>
                        <li style="font-size: 13px;"><a href="KC/TeacherFamous.aspx?tchtype=4">优秀教师</a>
                             <ul class="subnav">
                                <li><a href="KC/TeacherFamous.aspx?tchtype=1">教学名师</a></li>
                                <li><a href="KC/TeacherFamous.aspx?tchtype=2">教学质量优秀奖教师</a></li>
                                <li><a href="KC/TeacherFamous.aspx?tchtype=3">教学技能大赛获奖教师</a></li>
                            </ul>
                        </li>
                        <li style="font-size: 13px;"><a href="KC/News.aspx">新闻公告</a>
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
                <img alt="湖北大学" src="image/banner.jpg" /></div>
            <div style="height: 2px">
                &nbsp;</div>
            <div>
                <table width="100%">
                    <tr valign="top" style="height: 100px;">
                        <td width="100%" valign="top">
                            <table width="100%">
                                <tr>
                                    <td width="25%" valign="top">
                                        <table width="100%" style="height: 100px; line-height: 25px">
                                            <tr>
                                                <td valign="top">
                                                    <div>
                                                        <b class="b1"></b><b class="b2 d1"></b><b class="b3 d1"></b><b class="b4 d1"></b>
                                                        <div class="b d1 k">
                                                            <font size="4" style="margin: 0px 10px;"><strong>登陆</strong>
                                                                <asp:Login ID="Login" runat="server" BackColor="#F7F8F9" BorderColor="#E6E2D8" BorderStyle="Solid"
                                                                    BorderWidth="0px" Font-Names="宋体" Font-Size="13px" BorderPadding="4" Height="150px"
                                                                    PasswordLabelText="密码：" TitleText="" UserNameLabelText="用户名：" Width="200px" ForeColor="#999999">
                                                                    <CheckBoxStyle Font-Size="12px" />
                                                                    <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
                                                                    <LabelStyle Font-Size="12px" />
                                                                    <LayoutTemplate>
                                                                        <table cellpadding="4" cellspacing="0" style="border-collapse: collapse;">
                                                                            <tr>
                                                                                <td>
                                                                                    <table cellpadding="0" style="height: 150px; width: 200px;">
                                                                                        <tr>
                                                                                            <br />
                                                                                            <td align="right" valign="middle" width="100px">
                                                                                                <font size="4">
                                                                                                    <asp:Image ID="Image3" runat="server" ImageUrl="~/image/user.png" />
                                                                                                </font>
                                                                                                <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">用户名：</asp:Label>
                                                                                            </td>
                                                                                            <td valign="middle">
                                                                                                <asp:TextBox ID="UserName" runat="server" Font-Size="12px" Height="15px" Width="82px"></asp:TextBox>
                                                                                                <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName"
                                                                                                    ErrorMessage="必须填写“用户名”。" ForeColor="#FF3300" ToolTip="必须填写“用户名”。" ValidationGroup="Login">*</asp:RequiredFieldValidator>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td align="right" valign="middle">
                                                                                                <font size="4">
                                                                                                    <asp:Image ID="Image2" runat="server" ImageUrl="~/image/key.png" />
                                                                                                </font>
                                                                                                <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">密&nbsp;码：</asp:Label>
                                                                                            </td>
                                                                                            <td valign="middle">
                                                                                                <asp:TextBox ID="Password" runat="server" Font-Size="12px" Height="15px" TextMode="Password"
                                                                                                    Width="82px"></asp:TextBox>
                                                                                                <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password"
                                                                                                    ErrorMessage="必须填写“密码”。" ForeColor="#FF3300" ToolTip="必须填写“密码”。" ValidationGroup="Login">*</asp:RequiredFieldValidator>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td colspan="2" style="font-size: 12px;">
                                                                                                <asp:CheckBox ID="RememberMe" runat="server" Text="下次记住我。" />
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td align="center" colspan="2" style="color: Red;">
                                                                                                <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td align="right" colspan="2">
                                                                                                <asp:Button ID="LoginButton" runat="server" BackColor="White" BorderColor="#C5BBAF"
                                                                                                    BorderStyle="Solid" BorderWidth="1px" CommandName="Login" CssClass="btnstyle"
                                                                                                    Font-Names="Verdana" Font-Size="12px" ForeColor="Black" Text="登录" ValidationGroup="Login"
                                                                                                    Width="50px" />
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td colspan="2">
                                                                                                <table width="100%">
                                                                                                    <tr>
                                                                                                        <td>
                                                                                                            <a href="http://jwxt.hubu.edu.cn/" target="_blank"><asp:Image ID="imgbtn_jwxt" runat="server" ImageUrl="~/image/教务系统.jpg" Width="105px" Height="26px" /></a>
                                                                                                           <%-- <asp:ImageButton ID="imgbtn_jwxt" runat="server" ImageUrl="~/image/教务系统.jpg" PostBackUrl="http://jwc.hubu.edu.cn/"
                                                                                                                 />--%>
                                                                                                        </td>
                                                                                                        <td>
                                                                                                         <a href="http://jwxt.hubu.edu.cn/tkglAction.do?method=wztzkb&fs=?&selectUrl=" target="_blank"><asp:Image ID="Image1" runat="server" ImageUrl="~/image/课表查询.jpg" Width="105px" Height="26px" /></a>
                                                                                                            <%--<asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/image/课表查询.jpg" PostBackUrl="http://jwc.hubu.edu.cn/"
                                                                                                                Width="105px" Height="26px" />--%>
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </LayoutTemplate>
                                                                    <LoginButtonStyle BackColor="White" BorderColor="#C5BBAF" BorderStyle="Solid" BorderWidth="1px"
                                                                        Font-Names="Verdana" CssClass="btnstyle" Font-Size="12px" ForeColor="Black" Width="50px" />
                                                                    <TextBoxStyle Font-Size="12px" Height="15px" Width="120px" />
                                                                    <TitleTextStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="#FFFFFF" Font-Size="0.9em" />
                                                                    <ValidatorTextStyle ForeColor="#FF3300" />
                                                                </asp:Login>
                                                            </font>
                                                        </div>
                                                        <b class="b4b d1"></b><b class="b3b d1"></b><b class="b2b d1"></b><b class="b1b">
                                                        </b>
                                                    </div>
                                                </td>
                                                <td valign="top">
                                                    &nbsp;
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td width="75%" valign="top">
                                        <table width="100%" style="height: 100px; line-height: 25px">
                                            <tr>
                                                <td valign="top">
                                                    <div>
                                                        <b class="b1"></b><b class="b2 d1"></b><b class="b3 d1"></b><b class="b4 d1"></b>
                                                        <div class="b d1 k">
                                                            <center>
                                                                <table width="95%">
                                                                    <tr>
                                                                        <td align="left">
                                                                            <font size="4"><strong>新闻公告栏 </strong></font>
                                                                        </td>
                                                                        <td align="center" width="15%">
                                                                            <a href="KC/News.aspx" style="color: Black">更多>></a>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td colspan="2">
                                                                            <hr />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="center" colspan="2">
                                                                            <dx:ASPxGridView ID="gvNews" class="gvclass" runat="server" AutoGenerateColumns="False"
                                                                                DataSourceID="odsNews" KeyFieldName="新闻ID" Width="100%" EnableTheming="False"
                                                                                ClientInstanceName="cl_gvNews" SettingsPager-PageSize="7" Font-Names="华文细黑" Font-Size="Smaller">
                                                                                <SettingsBehavior AllowDragDrop="False" AllowGroup="False" AllowSort="False" />
                                                                                <Columns>
                                                                                    <dx:GridViewDataTextColumn FieldName="新闻标题" VisibleIndex="0">
                                                                                        <DataItemTemplate>
                                                                                            <li style="list-style-type: none;">●<a class="ahover" href='<%# "./KC/ViewNews.aspx?NewsID=" +  Eval("新闻ID") %>'
                                                                                                target="_blank" style="font-size: 15px; color: #698B22" title='<%#Eval("新闻标题")%>'>
                                                                                                <%# Eval("新闻标题").ToString().Length < 30 ? Eval("新闻标题") : Eval("新闻标题").ToString().Substring(0, 30) + "..."%></a>
                                                                                            </li>
                                                                                        </DataItemTemplate>
                                                                                    </dx:GridViewDataTextColumn>
                                                                                    <dx:GridViewDataDateColumn FieldName="最后更新时间" VisibleIndex="1" Width="15%">
                                                                                        <PropertiesDateEdit DisplayFormatString="[yyyy-MM-dd]">
                                                                                        </PropertiesDateEdit>
                                                                                        <CellStyle Font-Size="Larger">
                                                                                        </CellStyle>
                                                                                    </dx:GridViewDataDateColumn>
                                                                                </Columns>
                                                                                <SettingsPager PageSize="6" Visible="False">
                                                                                    <AllButton>
                                                                                        <Image ToolTip="显示全部">
                                                                                        </Image>
                                                                                    </AllButton>
                                                                                    <FirstPageButton>
                                                                                        <Image AlternateText="首页" ToolTip="首页">
                                                                                        </Image>
                                                                                    </FirstPageButton>
                                                                                    <LastPageButton>
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
                                                                                    <Summary Text="" />
                                                                                </SettingsPager>
                                                                                <Settings GridLines="None" ShowColumnHeaders="False"></Settings>
                                                                                <SettingsText EmptyDataRow="暂无新闻" />
                                                                                <Styles>
                                                                                    <EmptyDataRow BackColor="#F7F8F9">
                                                                                    </EmptyDataRow>
                                                                                    <Cell ForeColor="Black" HorizontalAlign="Left" VerticalAlign="Middle" BackColor="#F7F8F9">
                                                                                        <Border BorderStyle="None" />
                                                                                    </Cell>
                                                                                    <PagerBottomPanel BackColor="#F7F8F9" HorizontalAlign="Center">
                                                                                        <Border BorderStyle="None" />
                                                                                    </PagerBottomPanel>
                                                                                </Styles>
                                                                                <Border BorderStyle="None"></Border>
                                                                            </dx:ASPxGridView>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </center>
                                                            <asp:ObjectDataSource ID="odsNews" runat="server" OldValuesParameterFormatString="original_{0}"
                                                                SelectMethod="GetPubNews" TypeName="MainDataSetTableAdapters.TA_新闻表TableAdapter">
                                                            </asp:ObjectDataSource>
                                                        </div>
                                                        <b class="b4b d1"></b><b class="b3b d1"></b><b class="b2b d1"></b><b class="b1b">
                                                        </b>
                                                    </div>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr valign="top">
                        <td width="100%" valign="top">
                            <div>
                                <b class="b1"></b><b class="b2 d1"></b><b class="b3 d1"></b><b class="b4 d1"></b>
                                <div class="b d1">
                                    <table width="100%">
                                        <tr>
                                            <td width="25%" valign="top">
                                                <div class="pillar">
                                                    <b class="b1"></b><b class="b2"></b><b class="b3"></b><b class="b2"></b><b class="b4">
                                                    </b>
                                                    <div class="boxcontent">
                                                        <center>
                                                            <b><a style="color: white" href="KC/RMCourse.aspx">热门课程</a></b></center>
                                                    </div>
                                                    <b class="b4"></b><b class="b2"></b><b class="b3"></b><b class="b2"></b><b class="b1">
                                                    </b>
                                                </div>
                                                <%-- <div id="divrmkc">
                                                        
                                                    </div>--%>
                                                <div align="center">
                                                    <asp:Repeater ID="rptRMKC" runat="server" DataSourceID="odsRMKC" OnItemCommand="rptRMKC_ItemCommand">
                                                        <HeaderTemplate>
                                                            <table width="95%">
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <tr>
                                                                <td width="100%" style="font-size: small">
                                                                    <%-- <a href='KC/KCinfo.aspx?KCID=<%#Eval("课程代码")%>'> <%#Eval("课程名称")%>
                                                        </a>--%><center>
                                                            <asp:LinkButton ID="LinkButton1" Width="100%" runat="server" BorderColor="#6B8E23"
                                                                BorderWidth="1px" BackColor="#D9D9D9" CommandArgument='<%#Eval("课程代码")%>' ForeColor="#333333"
                                                                Height="18px"><%#Eval("课程名称")%></asp:LinkButton></center>
                                                                </td>
                                                            </tr>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <tr>
                                                                <td width="100%" style="font-size: small;">
                                                                    <center>
                                                                        <asp:LinkButton ID="LinkButton1" Width="100%" runat="server" BorderColor="#6B8E23"
                                                                            BorderWidth="1px" BackColor="#D9D9D9" PostBackUrl='~/KC/RMCourse.aspx' ForeColor="#333333"
                                                                            Height="18px">更多>></asp:LinkButton></center>
                                                                </td>
                                                            </tr>
                                                            </table><asp:Label ID="lblNull" runat="server" Text="" Visible='<%#bool.Parse((rptRMKC.Items.Count==0).ToString()) %>'></asp:Label></FooterTemplate>
                                                    </asp:Repeater>
                                                </div>
                                            </td>
                                            <td width="25%" valign="top">
                                                <div class="pillar">
                                                    <b class="b1"></b><b class="b2"></b><b class="b3"></b><b class="b2"></b><b class="b4">
                                                    </b>
                                                    <div class="boxcontent">
                                                        <center>
                                                            <b><a style="color: white" href="KC/JPKFCourse.aspx">精品开放课程</a></b></center>
                                                    </div>
                                                    <b class="b4"></b><b class="b2"></b><b class="b3"></b><b class="b2"></b><b class="b1">
                                                    </b>
                                                </div>
                                                <%-- <a href='KC/KCinfo.aspx?KCID=<%#Eval("课程代码")%>'> <%#Eval("课程名称")%>
                                                        </a>--%>
                                                <div align="center">
                                                    <asp:Repeater ID="rptJPKC" runat="server" DataSourceID="odsJPKC" OnItemCommand="rptJPKC_ItemCommand">
                                                        <HeaderTemplate>
                                                            <table width="95%">
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <tr>
                                                                <td width="100%" style="font-size: small">
                                                                    <%-- <a href='KC/KCinfo.aspx?KCID=<%#Eval("课程代码")%>'> <%#Eval("课程名称")%>
                                                        </a>--%><center>
                                                            <asp:LinkButton ID="LinkButton1" Width="100%" runat="server" BorderColor="#6B8E23"
                                                                BorderWidth="1px" BackColor="#D9D9D9" CommandArgument='<%#Eval("课程代码")%>' ForeColor="#333333"
                                                                Height="18px"><%#Eval("课程名称")%></asp:LinkButton></center>
                                                                </td>
                                                            </tr>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <tr>
                                                                <td width="100%" style="font-size: small">
                                                                    <center>
                                                                        <asp:LinkButton ID="LinkButton1" Width="100%" runat="server" BorderColor="#6B8E23"
                                                                            BorderWidth="1px" BackColor="#D9D9D9" PostBackUrl='~/KC/JPKFCourse.aspx' ForeColor="#333333"
                                                                            Height="18px">更多>></asp:LinkButton></center>
                                                                </td>
                                                            </tr>
                                                            </table><asp:Label ID="lblNull" runat="server" Text="" Visible='<%#bool.Parse((rptJPKC.Items.Count==0).ToString()) %>'></asp:Label></FooterTemplate>
                                                    </asp:Repeater>
                                            </td>
                                            <td width="25%" valign="top">
                                                <div class="pillar">
                                                    <b class="b1"></b><b class="b2"></b><b class="b3"></b><b class="b2"></b><b class="b4">
                                                    </b>
                                                    <div class="boxcontent">
                                                        <center>
                                                            <b><a style="color: white" href="KC/TSJYCourse.aspx">通识教育选修课</a></b></center>
                                                    </div>
                                                    <b class="b4"></b><b class="b2"></b><b class="b3"></b><b class="b2"></b><b class="b1">
                                                    </b>
                                                </div>
                                                <%#Eval("课程名称")%>
                                                <div align="center">
                                                    <asp:Repeater ID="rptTSKC" runat="server" DataSourceID="odsTSKC" OnItemCommand="rptTSKC_ItemCommand">
                                                        <HeaderTemplate>
                                                            <table width="95%">
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <tr>
                                                                <td width="100%" style="font-size: small">
                                                                    <%--<a href='KC/KCinfo.aspx?KCID=<%#Eval("课程代码")%>'> <%#Eval("课程名称")%>
                                                        </a>>--%><center>
                                                            <asp:LinkButton ID="LinkButton1" Width="100%" runat="server" BorderColor="#6B8E23"
                                                                BorderWidth="1px" BackColor="#D9D9D9" CommandArgument='<%#Eval("课程代码")%>' ForeColor="#333333"
                                                                Height="18px"><%#Eval("课程名称")%></asp:LinkButton></center>
                                                                </td>
                                                            </tr>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <tr>
                                                                <td width="100%" style="font-size: small">
                                                                    <center>
                                                                        <asp:LinkButton ID="LinkButton1" Width="100%" runat="server" BorderColor="#6B8E23"
                                                                            BorderWidth="1px" BackColor="#D9D9D9" PostBackUrl='~/KC/TSJYCourse.aspx' ForeColor="#333333"
                                                                            Height="18px">更多>></asp:LinkButton></center>
                                                                </td>
                                                            </tr>
                                                            </table><asp:Label ID="lblNull" runat="server" Text="" Visible='<%#bool.Parse((rptTSKC.Items.Count==0).ToString()) %>'></asp:Label></FooterTemplate>
                                                    </asp:Repeater>
                                                </div>
                                            </td>
                                            <td width="25%" valign="top">
                                                <div class="pillar">
                                                    <b class="b1"></b><b class="b2"></b><b class="b3"></b><b class="b2"></b><b class="b4">
                                                    </b>
                                                    <div class="boxcontent">
                                                        <center>
                                                            <b><a style="color: white" href="KC/XWYZCourse.aspx">校外优质课程</a></b></center>
                                                    </div>
                                                    <b class="b4"></b><b class="b2"></b><b class="b3"></b><b class="b2"></b><b class="b1">
                                                    </b>
                                                </div>
                                                <div align="center">
                                                    <asp:Repeater ID="rptJPSP" runat="server" DataSourceID="odsJPSP" OnItemCommand="rptJPSP_ItemCommand">
                                                        <HeaderTemplate>
                                                            <table width="95%">
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <tr>
                                                                <td width="100%" style="font-size: small">
                                                                    <center>
                                                                        <asp:LinkButton ID="LinkButton1" Width="100%" runat="server" BorderColor="#6B8E23"
                                                                            BorderWidth="1px" BackColor="#D9D9D9" CommandArgument='<%#Eval("优质课程代码")%>' ForeColor="#333333"
                                                                            Height="18px"><%#Eval("优质课程名称")%></asp:LinkButton>
                                                                        <%--<asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%#Eval("优质课程网址") %>' style=" border-color:#6B8E23; border-width:1px; background-color:#7bba35; color:#333333; width:100%"><%#Eval("优质课程名称")%></asp:HyperLink>
                                                                <a href='<%#Eval("优质课程网址") %>' style=" border-color:#6B8E23; border-width:1px; background-color:#7bba35; color:Black; width:150px"><%#Eval("优质课程名称")%></a>--%>
                                                                    </center>
                                                                </td>
                                                            </tr>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <tr>
                                                                <td width="100%" style="font-size: small">
                                                                    <center>
                                                                        <asp:LinkButton ID="LinkButton1" Width="100%" runat="server" BorderColor="#6B8E23"
                                                                            BorderWidth="1px" BackColor="#D9D9D9" PostBackUrl='~/KC/XWYZCourse.aspx' ForeColor="#333333"
                                                                            Height="18px">更多>></asp:LinkButton></center>
                                                                </td>
                                                            </tr>
                                                            </table><asp:Label ID="lblNull" runat="server" Text="" Visible='<%#bool.Parse((rptJPSP.Items.Count==0).ToString()) %>'></asp:Label></FooterTemplate>
                                                    </asp:Repeater>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <b class="b4b d1"></b><b class="b3b d1"></b><b class="b2b d1"></b><b class="b1b">
                                </b>
                            </div>
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
        <asp:ObjectDataSource ID="odsRMKC" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetRMKC" TypeName="MainDataSetTableAdapters.TA_课程信息表TableAdapter"
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
        <asp:ObjectDataSource ID="odsJPKC" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetJPKC" TypeName="MainDataSetTableAdapters.TA_课程信息表TableAdapter">
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="odsTSKC" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetTSKC" TypeName="MainDataSetTableAdapters.TA_课程信息表TableAdapter">
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="odsJPSP" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="Gettop5Data" TypeName="DMDataSetTableAdapters.DM_优质课程TableAdapter">
        </asp:ObjectDataSource>
    </div>
    </form>
</body>
</html>
