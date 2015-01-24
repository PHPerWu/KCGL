<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MajorView.aspx.cs" Inherits="KC_MajorView" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxUploadControl" TagPrefix="dx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>专业总览</title>
    <script src="../Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
    <link href="../Styles/master.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/KCinfo.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/ScoreTop.js" type="text/javascript"></script>
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
            <div class="body">
                <table width="100%">
                    <tr>
                        <td width="100%" valign="top">
                            <dx:ASPxGridView ID="gv_ZY" runat="server" AutoGenerateColumns="False"
                                KeyFieldName="专业ID" Width="100%" ClientInstanceName="clgv_ZY" 
                                Theme="Glass">
                                <Columns>
                                    <dx:GridViewCommandColumn Caption="专业简介" VisibleIndex="6">
                                        <EditButton Text="详情&gt;&gt;" Visible="True">
                                        </EditButton>
                                    </dx:GridViewCommandColumn>
                                    <dx:GridViewDataTextColumn FieldName="专业ID" VisibleIndex="0" ReadOnly="True" Width="15%">
                                        <Settings AllowAutoFilter="True" AllowHeaderFilter="True" FilterMode="DisplayText"
                                            HeaderFilterMode="CheckedList" ShowFilterRowMenu="True" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="专业名称" VisibleIndex="1" Width="25%">
                                        <Settings AllowHeaderFilter="True" FilterMode="DisplayText" HeaderFilterMode="CheckedList" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataComboBoxColumn FieldName="所属学院" VisibleIndex="2" Width="25%">
                                        <PropertiesComboBox DataSourceID="odsDepartment" TextField="学院名称" ValueField="学院ID">
                                        </PropertiesComboBox>
                                        <Settings AllowHeaderFilter="True" FilterMode="DisplayText" HeaderFilterMode="CheckedList" />
                                    </dx:GridViewDataComboBoxColumn>
                                    <dx:GridViewDataTextColumn FieldName="专业英文名称" VisibleIndex="3" Caption="专业类别" 
                                        Visible="False">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataComboBoxColumn FieldName="专业学制" VisibleIndex="4" Width="15%" 
                                        Visible="False">
                                        <PropertiesComboBox DataSourceID="odsZYXZ" TextField="代码含义" ValueField="代码ID">
                                            <Style VerticalAlign="Top">
                                                
                                            </Style>
                                        </PropertiesComboBox>
                                    </dx:GridViewDataComboBoxColumn>
                                    <dx:GridViewDataMemoColumn FieldName="专业简介" VisibleIndex="5" Visible="False">
                                        <PropertiesMemoEdit Height="120px">
                                            <Style VerticalAlign="Top">
                                                
                                            </Style>
                                        </PropertiesMemoEdit>
                                    </dx:GridViewDataMemoColumn>
                                    <dx:GridViewDataTextColumn Caption="培养方案" VisibleIndex="7">
                                        <DataItemTemplate>
                                            <dx:ASPxButton ID="btn_XQ" runat="server" 
                                                CommandArgument='<%# Container.VisibleIndex %>' Text="点击查看&gt;&gt;" 
                                                Theme="Aqua" oncommand="btn_XQ_Command">
                                                <Border BorderStyle="None" />
                                            </dx:ASPxButton>
                                        </DataItemTemplate>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                <SettingsBehavior AllowDragDrop="False" AllowSort="False" ConfirmDelete="True" />
                                <SettingsPager PageSize="20">
                                    <Summary Text="第{0}页/共{1}页(共{2}条)" />
                                </SettingsPager>
                                <Settings ShowTitlePanel="True" ShowFilterRow="True" />
                                <SettingsText CommandCancel="[取消]" CommandEdit="[编辑]" CommandNew="[新增]" CommandUpdate="[确定]"
                                    Title="专业设置总览" ConfirmDelete="确认删除吗？" CommandDelete="[删除]" />
                                <SettingsDetail AllowOnlyOneMasterRowExpanded="True" ShowDetailRow="True"/>
                                <Styles>
                                    <Header HorizontalAlign="Center" VerticalAlign="Middle">
                                    </Header>
                                    <Cell HorizontalAlign="Center">
                                    </Cell>
                                    <DetailRow HorizontalAlign="Center">
                                    </DetailRow>
                                    <AlternatingRow Enabled="True">
                                    </AlternatingRow>
                                    
                                    <EditForm HorizontalAlign="Center">
                                    </EditForm>
                                    <TitlePanel Font-Bold="True" Font-Size="Large">
                                    </TitlePanel>
                                </Styles>
                                <Templates>
                                    <DetailRow>
                                        <table width="100%">
                                            <tr>
                                                <td align="right">
                                                   
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <dx:ASPxGridView ID="gvPYFA" runat="server" AutoGenerateColumns="False" ClientInstanceName="gvPYFA"
                                                        DataSourceID="odsZYFJ" KeyFieldName="附件ID" OnBeforePerformDataSelect="gvPYFA_BeforePerformDataSelect"
                                                        Width="100%" EnableTheming="True" Theme="Glass">
                                                        <Columns>
                                                            <dx:GridViewDataTextColumn Caption="序号" VisibleIndex="0">
                                                                <DataItemTemplate>
                                                                    <%#Container.VisibleIndex+1 %>
                                                                </DataItemTemplate>
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn FieldName="附件ID" ReadOnly="True" Visible="False" 
                                                                VisibleIndex="1">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn FieldName="附件名称" VisibleIndex="2" Caption="名称">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn FieldName="附件路径" VisibleIndex="3" Caption="路径" 
                                                                Visible="False">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn FieldName="附件类型" VisibleIndex="4" Caption="类型" 
                                                                Visible="False">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn FieldName="专业ID" Visible="False" VisibleIndex="5">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="查看培养方案" VisibleIndex="6">
                                                            <DataItemTemplate>
                                                                <a href='/kcgl/SysManager<%#Eval("附件路径").ToString().Substring(13) %>' target="_blank"><%#Eval("附件名称") %></a>
                                                            </DataItemTemplate>
                                                            </dx:GridViewDataTextColumn>
                                                        </Columns>
                                                        <SettingsBehavior ConfirmDelete="True" />
                                                        <SettingsText CommandDelete="[删除]" CommandEdit="[编辑]" ConfirmDelete="确定删除吗？" EmptyDataRow="暂无培养方案" />
                                                        <Styles>
                                                            <Header HorizontalAlign="Center">
                                                            </Header>
                                                        </Styles>
                                                        <Templates>
                                                            <EditForm>
                                                            </EditForm>
                                                        </Templates>
                                                    </dx:ASPxGridView>
                                                </td>
                                            </tr>
                                            <tr>
                                            <td align="center">
                                                <dx:ASPxButton ID="btn_Up" runat="server" Text="收 起" 
                                                    CommandArgument="<%# Container.VisibleIndex %>" oncommand="btn_Up_Command">
                                                </dx:ASPxButton>
                                            </td>
                                            </tr>
                                        </table>
                                    </DetailRow>
                                    <EditForm>
                                        <center>
                                            <table style="width: 100%;">
                                                <tr>
                                                    <td align="right" style="width: 10%; vertical-align:top">
                                                        <font size="2"><strong><center >
                                                            <%#Eval("专业名称")%>:</center></strong></font>
                                                    </td>
                                                    <td align="left" valign="top">
                                                       <p style=" font-size:13px; line-height:150%"><%#Eval("专业简介")%></p> 
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="center" colspan="2">
                                                        <dx:ASPxButton ID="ASPxButton1" runat="server" Text="返回">
                                                            <ClientSideEvents Click="function(s, e) {
	 clgv_ZY.CancelEdit();
     e.processOnServer=false;
}" />
                                                        </dx:ASPxButton>
                                                    </td>
                                                </tr>
                                            </table>
                                        </center>
                                    </EditForm>
                                </Templates>
                            </dx:ASPxGridView>
                            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
                                SelectMethod="GetDataBy专业ID" TypeName="MainDataSetTableAdapters.TA_专业信息表TableAdapter">
                            </asp:ObjectDataSource>
                            <asp:ObjectDataSource ID="odsZYFJ" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
                                OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataBy专业ID" TypeName="MainDataSetTableAdapters.TA_培养方案附件TableAdapter"
                                UpdateMethod="Update">
                                <DeleteParameters>
                                    <asp:Parameter Name="Original_附件ID" Type="String" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="附件名称" Type="String" />
                                    <asp:Parameter Name="附件路径" Type="String" />
                                    <asp:Parameter Name="附件类型" Type="String" />
                                    <asp:Parameter Name="专业ID" Type="String" />
                                </InsertParameters>
                                <SelectParameters>
                                    <asp:SessionParameter Name="专业ID" SessionField="专业ID" Type="String" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="附件名称" Type="String" />
                                    <asp:Parameter Name="附件路径" Type="String" />
                                    <asp:Parameter Name="附件类型" Type="String" />
                                    <asp:Parameter Name="专业ID" Type="String" />
                                    <asp:Parameter Name="Original_附件ID" Type="String" />
                                </UpdateParameters>
                            </asp:ObjectDataSource>
                            <asp:ObjectDataSource ID="odsDepartment" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
                                OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="MainDataSetTableAdapters.TA_学院信息表TableAdapter"
                                UpdateMethod="Update">
                                <DeleteParameters>
                                    <asp:Parameter Name="Original_学院ID" Type="String" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="学院ID" Type="String" />
                                    <asp:Parameter Name="学院名称" Type="String" />
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="学院名称" Type="String" />
                                    <asp:Parameter Name="Original_学院ID" Type="String" />
                                </UpdateParameters>
                            </asp:ObjectDataSource>
                            <asp:ObjectDataSource ID="odsZYXZ" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
                                OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByQYBZ" TypeName="DMDataSetTableAdapters.DM_专业学制TableAdapter"
                                UpdateMethod="Update">
                                <DeleteParameters>
                                    <asp:Parameter Name="Original_代码ID" Type="String" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="代码ID" Type="String" />
                                    <asp:Parameter Name="代码含义" Type="String" />
                                    <asp:Parameter Name="启用标志" Type="String" />
                                    <asp:Parameter Name="备注" Type="String" />
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="代码含义" Type="String" />
                                    <asp:Parameter Name="启用标志" Type="String" />
                                    <asp:Parameter Name="备注" Type="String" />
                                    <asp:Parameter Name="Original_代码ID" Type="String" />
                                </UpdateParameters>
                            </asp:ObjectDataSource>
                            <asp:ObjectDataSource ID="ods_XY" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
                                OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="MainDataSetTableAdapters.TA_学院信息表TableAdapter"
                                UpdateMethod="Update">
                                <DeleteParameters>
                                    <asp:Parameter Name="Original_学院ID" Type="String" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="学院ID" Type="String" />
                                    <asp:Parameter Name="学院名称" Type="String" />
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="学院名称" Type="String" />
                                    <asp:Parameter Name="Original_学院ID" Type="String" />
                                </UpdateParameters>
                            </asp:ObjectDataSource>
                            <asp:ObjectDataSource ID="ods_品牌特色专业" runat="server"
                                OldValuesParameterFormatString="original_{0}" SelectMethod="GetData品牌特色专业" 
                                TypeName="MainDataSetTableAdapters.TA_专业信息表TableAdapter" 
                                DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update">
                                <DeleteParameters>
                                    <asp:Parameter Name="Original_专业ID" Type="String" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="专业ID" Type="String" />
                                    <asp:Parameter Name="专业名称" Type="String" />
                                    <asp:Parameter Name="所属学院" Type="String" />
                                    <asp:Parameter Name="专业英文名称" Type="String" />
                                    <asp:Parameter Name="专业学制" Type="String" />
                                    <asp:Parameter Name="专业简介" Type="String" />
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="专业名称" Type="String" />
                                    <asp:Parameter Name="所属学院" Type="String" />
                                    <asp:Parameter Name="专业英文名称" Type="String" />
                                    <asp:Parameter Name="专业学制" Type="String" />
                                    <asp:Parameter Name="专业简介" Type="String" />
                                    <asp:Parameter Name="Original_专业ID" Type="String" />
                                </UpdateParameters>
                            </asp:ObjectDataSource>
                            <asp:ObjectDataSource ID="ods_战略支柱产业专业" runat="server"
                                OldValuesParameterFormatString="original_{0}" 
                                SelectMethod="GetData战略支柱产业专业" 
                                TypeName="MainDataSetTableAdapters.TA_专业信息表TableAdapter" 
                                DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update">
                                <DeleteParameters>
                                    <asp:Parameter Name="Original_专业ID" Type="String" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="专业ID" Type="String" />
                                    <asp:Parameter Name="专业名称" Type="String" />
                                    <asp:Parameter Name="所属学院" Type="String" />
                                    <asp:Parameter Name="专业英文名称" Type="String" />
                                    <asp:Parameter Name="专业学制" Type="String" />
                                    <asp:Parameter Name="专业简介" Type="String" />
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="专业名称" Type="String" />
                                    <asp:Parameter Name="所属学院" Type="String" />
                                    <asp:Parameter Name="专业英文名称" Type="String" />
                                    <asp:Parameter Name="专业学制" Type="String" />
                                    <asp:Parameter Name="专业简介" Type="String" />
                                    <asp:Parameter Name="Original_专业ID" Type="String" />
                                </UpdateParameters>
                            </asp:ObjectDataSource>
                            <asp:ObjectDataSource ID="ods_综合改革试点专业" runat="server"
                                OldValuesParameterFormatString="original_{0}" 
                                SelectMethod="GetData综合改革试点专业" 
                                TypeName="MainDataSetTableAdapters.TA_专业信息表TableAdapter" 
                                DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update">
                                <DeleteParameters>
                                    <asp:Parameter Name="Original_专业ID" Type="String" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="专业ID" Type="String" />
                                    <asp:Parameter Name="专业名称" Type="String" />
                                    <asp:Parameter Name="所属学院" Type="String" />
                                    <asp:Parameter Name="专业英文名称" Type="String" />
                                    <asp:Parameter Name="专业学制" Type="String" />
                                    <asp:Parameter Name="专业简介" Type="String" />
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="专业名称" Type="String" />
                                    <asp:Parameter Name="所属学院" Type="String" />
                                    <asp:Parameter Name="专业英文名称" Type="String" />
                                    <asp:Parameter Name="专业学制" Type="String" />
                                    <asp:Parameter Name="专业简介" Type="String" />
                                    <asp:Parameter Name="Original_专业ID" Type="String" />
                                </UpdateParameters>
                            </asp:ObjectDataSource>
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
    </div>
    </form>
</body>
</html>
