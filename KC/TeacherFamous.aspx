<%@ Page Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="TeacherFamous.aspx.cs" Inherits="KC_TeacherFamous" %>

<%@ Register Assembly="DevExpress.Web.ASPxHtmlEditor.v13.2, Version=13.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxHtmlEditor" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxSpellChecker.v13.2, Version=13.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxSpellChecker" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <title>课程总览</title>
      <style>
         .dxbButton_Aqua
         {
             background:none !important;
             border:0 !important;
             }
         .dxeButtonEditButton_Youthful
         {
             background:#afc185 !important;
             
             }
         .dxgvTitlePanel_Youthful, .dxgvTable_Youthful caption
         {
             background-color:#fff;
             color:#000;
             font-weight:bold;
             }
        .dxb-hb,.dxb
         {
             background-color:#afc185 !important;
            color:#000;
           border:2px solid;
            border-radius:2px;
           -moz-border-radius:2px;
           
             }
         .dxgvHeader_Youthful
         {
            background-color:#afc185 !important;
             }
     </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
            <div class="body">
                <dx:ASPxGridView ID="gvFamousTeacher" runat="server" 
                    AutoGenerateColumns="False" KeyFieldName="教师ID" Width="100%" 
                    ClientInstanceName="gvCFamousTeacher" Theme="Youthful" 
                    EnableTheming="True">
                    <Columns>
                        <dx:GridViewCommandColumn ShowClearFilterButton="True" VisibleIndex="0">
                        </dx:GridViewCommandColumn>
                        <dx:GridViewDataTextColumn Caption="序号" VisibleIndex="1">
                            <DataItemTemplate>
                                <%#Container.VisibleIndex+1 %>
                            </DataItemTemplate>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="教师ID" ReadOnly="True" Visible="False" 
                            VisibleIndex="2">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="教师姓名" VisibleIndex="3">
                            <Settings AllowHeaderFilter="False" HeaderFilterMode="CheckedList" />
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
                        <dx:GridViewDataComboBoxColumn FieldName="所属学院" VisibleIndex="6">
                            <PropertiesComboBox DataSourceID="odsDepartment" TextField="学院名称" ValueField="学院ID">
                            </PropertiesComboBox>
                            <Settings AllowHeaderFilter="False" HeaderFilterMode="CheckedList" />
                        </dx:GridViewDataComboBoxColumn>
                        <dx:GridViewDataTextColumn FieldName="教师图片" VisibleIndex="7" Visible="False">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="教师简介" VisibleIndex="8" Visible="False">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataComboBoxColumn FieldName="获奖级别" VisibleIndex="4">
                            <PropertiesComboBox DataSourceID="odsWinning" TextField="代码含义" ValueField="代码ID">
                            </PropertiesComboBox>
                            <Settings AllowHeaderFilter="False" HeaderFilterMode="CheckedList" />
                        </dx:GridViewDataComboBoxColumn>
                        <dx:GridViewDataTextColumn FieldName="获奖年度" VisibleIndex="5">
                            <Settings AllowHeaderFilter="False" HeaderFilterMode="CheckedList" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="点击量" VisibleIndex="9">
                            <CellStyle HorizontalAlign="Center">
                            </CellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="查看详情" VisibleIndex="10">
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
                    <Settings ShowTitlePanel="True" ShowFilterRow="True" />
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
</asp:Content>