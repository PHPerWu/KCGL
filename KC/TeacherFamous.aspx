<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TeacherFamous.aspx.cs" Inherits="KC_TeacherFamous" %>

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
    <title>名师推荐</title>
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
                <dx:ASPxGridView ID="gvFamousTeacher" runat="server" 
                    AutoGenerateColumns="False" KeyFieldName="教师ID" Width="100%" 
                    ClientInstanceName="gvCFamousTeacher" Theme="Glass">
                    <Columns>
                        <dx:GridViewDataTextColumn Caption="序号" VisibleIndex="0">
                            <DataItemTemplate>
                                <%#Container.VisibleIndex+1 %>
                            </DataItemTemplate>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="教师ID" ReadOnly="True" Visible="False" VisibleIndex="1">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="教师姓名" VisibleIndex="2">
                            <Settings AllowHeaderFilter="True" HeaderFilterMode="CheckedList" />
                            <DataItemTemplate>
                                <table>
                                    <tr>
                                        <td>
                                            <asp:ImageButton ID="btnImage" runat="server" Text="ASPxButton" ImageUrl='<%# Eval("教师图片").ToString()!=""?Eval("教师图片"):"../image/public/noup.jpg" %>'
                                                Width="45px" Height="45px" CommandArgument='<%# Eval("教师ID")+"|"+Eval("所属学院")+"|"+Eval("获奖级别") %>'
                                                OnCommand="btnImage_Command" />
                                        </td>
                                        <td>
                                            <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text='<%# Eval("教师姓名") %>'>
                                            </dx:ASPxLabel>
                                        </td>
                                    </tr>
                                </table>
                            </DataItemTemplate>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataComboBoxColumn FieldName="所属学院" VisibleIndex="5">
                            <PropertiesComboBox DataSourceID="odsDepartment" TextField="学院名称" ValueField="学院ID">
                            </PropertiesComboBox>
                            <Settings AllowHeaderFilter="True" HeaderFilterMode="CheckedList" />
                        </dx:GridViewDataComboBoxColumn>
                        <dx:GridViewDataTextColumn FieldName="教师图片" VisibleIndex="6" Visible="False">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="教师简介" VisibleIndex="7" Visible="False">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataComboBoxColumn FieldName="获奖级别" VisibleIndex="3">
                            <PropertiesComboBox DataSourceID="odsWinning" TextField="代码含义" ValueField="代码ID">
                            </PropertiesComboBox>
                            <Settings AllowHeaderFilter="True" HeaderFilterMode="CheckedList" />
                        </dx:GridViewDataComboBoxColumn>
                        <dx:GridViewDataTextColumn FieldName="获奖年度" VisibleIndex="4">
                            <Settings AllowHeaderFilter="True" HeaderFilterMode="CheckedList" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="点击量" VisibleIndex="8">
                            <CellStyle HorizontalAlign="Center">
                            </CellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="查看详情" VisibleIndex="9">
                            <DataItemTemplate>
                                <dx:ASPxButton ID="btnInfo" runat="server" 
                                    CommandArgument='<%# Eval("教师ID")+"|"+Eval("所属学院")+"|"+Eval("获奖级别") %>' EnableTheming="True" 
                                    oncommand="btnInfo_Command" Text="查看详情&gt;&gt;" Theme="Aqua">
                                    <Border BorderStyle="None" />
                                </dx:ASPxButton>
                            </DataItemTemplate>
                        </dx:GridViewDataTextColumn>
                    </Columns>
                    <SettingsBehavior ConfirmDelete="True" />
                    <SettingsPager>
                        <Summary Text="第{0}页/共{1}页(共{2}条)" />
                    </SettingsPager>
                    <Settings ShowTitlePanel="True" />
                    <SettingsText Title="优秀教师" PopupEditFormCaption="新增名师" CommandDelete="删除" CommandEdit="编辑"
                        ConfirmDelete="确定删除吗？" />
                    <SettingsPopup>
                        <EditForm HorizontalAlign="WindowCenter" VerticalAlign="Middle" />
                    </SettingsPopup>
                    <Styles>
                        <Cell HorizontalAlign="Center" VerticalAlign="Middle">
                        </Cell>
                        <Header HorizontalAlign="Center">
                        </Header>
                        <AlternatingRow Enabled="True">
                        </AlternatingRow>
                        <EditFormDisplayRow HorizontalAlign="Center" VerticalAlign="Middle">
                        </EditFormDisplayRow>
                        <TitlePanel Font-Bold="True" Font-Size="Medium" HorizontalAlign="Center">
                        </TitlePanel>
                    </Styles>
                    <Templates>
                        <EditForm>
                            <table class="style1">
                                <tr>
                                    <td align="right">
                                        姓名：
                                    </td>
                                    <td>
                                        <%# Eval("教师姓名")%>
                                    </td>
                                    <td align="right">
                                        获奖级别：
                                    </td>
                                    <td>
                                        <%# Eval("获奖级别") %>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        获奖年份：
                                    </td>
                                    <td>
                                        <%# Eval("获奖年度")%>
                                    </td>
                                    <td align="right">
                                        所在学院：
                                    </td>
                                    <td>
                                        <%# Eval("所属学院")%>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        图片：
                                    </td>
                                    <td>
                                        <dx:ASPxImage ID="ASPxImage1" runat="server" Height="45px" ImageUrl='<%# Eval("教师图片").ToString()!=""?Eval("教师图片"):"~/DeanManager/pic/noup.jpg" %>'
                                            Width="45px">
                                        </dx:ASPxImage>
                                    </td>
                                    <td align="right">
                                        点击量
                                    </td>
                                    <td>
                                        <%#Eval("点击量")%>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        教师简介：
                                    </td>
                                    <td colspan="3">
                                        <%# Eval("教师简介") %>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="4">
                                        <dx:ASPxButton ID="btnCancel" runat="server" AutoPostBack="False" Text="取消" CausesValidation="False"
                                            OnClick="btnCancel_Click">
                                            <ClientSideEvents Click="function(s, e) {
	gvCFamousTeacher.CancelEdit();
    e.processOnServer=false;
}" />
                                        </dx:ASPxButton>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                            </table>
                        </EditForm>
                    </Templates>
                </dx:ASPxGridView>
            </div>
            <div>
                &nbsp;&nbsp;</div>
            <div style="background-color: #6B8E23; height: 5px">
                &nbsp;</div>
            <center style="font-size: 12px">
                版权说明</center>
        </div>
        <asp:ObjectDataSource ID="ods_teacher" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetData" 
            TypeName="MainDataSetTableAdapters.TA_教师信息表TableAdapter" DeleteMethod="Delete" 
            InsertMethod="Insert" UpdateMethod="Update">
            <DeleteParameters>
                <asp:Parameter Name="Original_教师ID" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="教师ID" Type="String" />
                <asp:Parameter Name="教师姓名" Type="String" />
                <asp:Parameter Name="所属学院" Type="String" />
                <asp:Parameter Name="教师图片" Type="String" />
                <asp:Parameter Name="教师简介" Type="Object" />
                <asp:Parameter Name="获奖级别" Type="String" />
                <asp:Parameter Name="获奖年度" Type="String" />
                <asp:Parameter Name="点击量" Type="Decimal" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="教师姓名" Type="String" />
                <asp:Parameter Name="所属学院" Type="String" />
                <asp:Parameter Name="教师图片" Type="String" />
                <asp:Parameter Name="教师简介" Type="Object" />
                <asp:Parameter Name="获奖级别" Type="String" />
                <asp:Parameter Name="获奖年度" Type="String" />
                <asp:Parameter Name="点击量" Type="Decimal" />
                <asp:Parameter Name="Original_教师ID" Type="String" />
            </UpdateParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="odsDepartment" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetDataByID" TypeName="MainDataSetTableAdapters.TA_学院信息表TableAdapter">
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="odsYear" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetDataOrderBy排序" TypeName="MainDataSetTableAdapters.DM_获奖年份TableAdapter">
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="odsWinning" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetDataBy启用标志" TypeName="MainDataSetTableAdapters.DM_获奖级别TableAdapter">
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ods_教学名师" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetData教学名师" 
            TypeName="MainDataSetTableAdapters.TA_教师信息表TableAdapter" 
            DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update">
            <DeleteParameters>
                <asp:Parameter Name="Original_教师ID" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="教师ID" Type="String" />
                <asp:Parameter Name="教师姓名" Type="String" />
                <asp:Parameter Name="所属学院" Type="String" />
                <asp:Parameter Name="教师图片" Type="String" />
                <asp:Parameter Name="教师简介" Type="Object" />
                <asp:Parameter Name="获奖级别" Type="String" />
                <asp:Parameter Name="获奖年度" Type="String" />
                <asp:Parameter Name="点击量" Type="Decimal" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="教师姓名" Type="String" />
                <asp:Parameter Name="所属学院" Type="String" />
                <asp:Parameter Name="教师图片" Type="String" />
                <asp:Parameter Name="教师简介" Type="Object" />
                <asp:Parameter Name="获奖级别" Type="String" />
                <asp:Parameter Name="获奖年度" Type="String" />
                <asp:Parameter Name="点击量" Type="Decimal" />
                <asp:Parameter Name="Original_教师ID" Type="String" />
            </UpdateParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ods_教学质量优秀奖教师" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetData教学质量优秀奖教师" 
            TypeName="MainDataSetTableAdapters.TA_教师信息表TableAdapter" 
            DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update">
            <DeleteParameters>
                <asp:Parameter Name="Original_教师ID" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="教师ID" Type="String" />
                <asp:Parameter Name="教师姓名" Type="String" />
                <asp:Parameter Name="所属学院" Type="String" />
                <asp:Parameter Name="教师图片" Type="String" />
                <asp:Parameter Name="教师简介" Type="Object" />
                <asp:Parameter Name="获奖级别" Type="String" />
                <asp:Parameter Name="获奖年度" Type="String" />
                <asp:Parameter Name="点击量" Type="Decimal" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="教师姓名" Type="String" />
                <asp:Parameter Name="所属学院" Type="String" />
                <asp:Parameter Name="教师图片" Type="String" />
                <asp:Parameter Name="教师简介" Type="Object" />
                <asp:Parameter Name="获奖级别" Type="String" />
                <asp:Parameter Name="获奖年度" Type="String" />
                <asp:Parameter Name="点击量" Type="Decimal" />
                <asp:Parameter Name="Original_教师ID" Type="String" />
            </UpdateParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ods_教学技能大赛获奖教师" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetData教学技能大赛获奖教师" 
            TypeName="MainDataSetTableAdapters.TA_教师信息表TableAdapter" 
            DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update">
            <DeleteParameters>
                <asp:Parameter Name="Original_教师ID" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="教师ID" Type="String" />
                <asp:Parameter Name="教师姓名" Type="String" />
                <asp:Parameter Name="所属学院" Type="String" />
                <asp:Parameter Name="教师图片" Type="String" />
                <asp:Parameter Name="教师简介" Type="Object" />
                <asp:Parameter Name="获奖级别" Type="String" />
                <asp:Parameter Name="获奖年度" Type="String" />
                <asp:Parameter Name="点击量" Type="Decimal" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="教师姓名" Type="String" />
                <asp:Parameter Name="所属学院" Type="String" />
                <asp:Parameter Name="教师图片" Type="String" />
                <asp:Parameter Name="教师简介" Type="Object" />
                <asp:Parameter Name="获奖级别" Type="String" />
                <asp:Parameter Name="获奖年度" Type="String" />
                <asp:Parameter Name="点击量" Type="Decimal" />
                <asp:Parameter Name="Original_教师ID" Type="String" />
            </UpdateParameters>
        </asp:ObjectDataSource>
    </div>
    </form>
</body>
</html>
