<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LunboManager.aspx.cs" Inherits="CollegeManager_TeacherFamous" %>

<%@ Register assembly="DevExpress.Web.v13.2, Version=13.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v13.2, Version=13.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxHtmlEditor.v13.2, Version=13.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxHtmlEditor" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxSpellChecker.v13.2, Version=13.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxSpellChecker" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.v13.2, Version=13.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridLookup" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.v13.2, Version=13.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxUploadControl" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v13.2, Version=13.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPopupControl" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v13.2, Version=13.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxFileManager" tagprefix="dx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <script type="text/javascript" src="../Scripts/My97DatePicker/WdatePicker.js"></script>
      <script type="text/javascript">
    // <![CDATA[
          function CloseGridLookup() {
              gridLookup.ConfirmCurrentSelection();
              gridLookup.HideDropDown();
          }
    // ]]> 
    </script>
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table width="100%">
            <tr>
                <td align="right">
                    <dx:ASPxButton ID="btnNewTeacher" runat="server" AutoPostBack="False" 
                        Text="新增名师" CausesValidation="False">
                        <ClientSideEvents Click="function(s, e) {
	gvCFamousTeacher.AddNewRow();
}" />
                    </dx:ASPxButton>
                </td>
            </tr>
            <tr>
                <td>
    
        <dx:ASPxGridView ID="gvFamousTeacher" runat="server" 
            AutoGenerateColumns="False" DataSourceID="odsFamousTeacher" KeyFieldName="教师ID" 
            Width="100%" ClientInstanceName="gvCFamousTeacher" Theme="Glass">
            <Columns>
                <dx:GridViewCommandColumn Caption="操作" VisibleIndex="9">
                    <EditButton Visible="True">
                    </EditButton>
                    <DeleteButton Visible="True">
                    </DeleteButton>
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn Caption="序号" VisibleIndex="0">
                <DataItemTemplate>
                <%#Container.VisibleIndex+1 %>
                </DataItemTemplate>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="教师ID" ReadOnly="True" Visible="False" 
                    VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="教师姓名" VisibleIndex="2">
                    <DataItemTemplate>
                        <table>
                            <tr>
                                <td>
                                    <dx:ASPxImage ID="ASPxImage1" runat="server" Height="45px" 
                                        
                                        ImageUrl='<%# Eval("教师图片").ToString()!=""?Eval("教师图片"):"../image/public/noup.jpg" %>' 
                                        Width="45px">
                                        <EmptyImage Url="~/image/public/noup.jpg">
                                        </EmptyImage>
                                    </dx:ASPxImage>
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
                    <PropertiesComboBox DataSourceID="odsDepartment" TextField="学院名称" 
                        ValueField="学院ID">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn FieldName="教师图片" VisibleIndex="6" Visible="False">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="教师简介" VisibleIndex="7" Visible="False">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn FieldName="获奖级别" VisibleIndex="3">
                    <PropertiesComboBox DataSourceID="odsWinning" TextField="代码含义" 
                        ValueField="代码ID">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn FieldName="获奖年度" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="点击量" VisibleIndex="8">
                    <CellStyle HorizontalAlign="Center">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
            </Columns>
            <SettingsBehavior ConfirmDelete="True" />
            <Settings ShowTitlePanel="True" />
            <SettingsText Title="名师推荐" PopupEditFormCaption="新增名师" CommandDelete="删除" 
                CommandEdit="编辑" ConfirmDelete="确定删除吗？" />
            <SettingsPopup>
                <EditForm HorizontalAlign="WindowCenter" VerticalAlign="Middle" />
            </SettingsPopup>
            <Styles>
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
                            <td align="left" colspan="2">
                                <asp:Label ID="Label1" runat="server" Font-Size="Small" ForeColor="Red" 
                                    Text="*上传的教师信息需控制在2M以内！"></asp:Label>
                            </td>
                            <td align="right">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td align="right">
                                姓名：</td>
                            <td>
                                <dx:ASPxTextBox ID="txbName" runat="server" Text='<%# Bind("教师姓名") %>' 
                                    Width="170px">
                                    <ValidationSettings>
                                        <RequiredField ErrorText="不能为空" IsRequired="True" />
                                    </ValidationSettings>
                                </dx:ASPxTextBox>
                            </td>
                            <td align="right">
                                获奖级别：</td>
                            <td>
                                <dx:ASPxComboBox ID="cmbWinning" runat="server" DataSourceID="odsWinning" 
                                    Text='<%# Eval("获奖级别") %>' TextField="代码含义" Value='<%# Bind("获奖级别") %>' 
                                    ValueField="代码ID">
                                    <ValidationSettings>
                                        <RequiredField ErrorText="请选择" IsRequired="True" />
                                    </ValidationSettings>
                                </dx:ASPxComboBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                获奖年份：</td>
                            <td>
                                <dx:ASPxTextBox ID="startTime" runat="server" ClientInstanceName="startTime" 
                                    Text='<%# Bind("获奖年度") %>' Width="170px">
                                    <ClientSideEvents GotFocus="function(s, e) {
WdatePicker({dateFmt:'yyyy'});
}" />
                                    <ValidationSettings>
                                        <RequiredField ErrorText="请选择" IsRequired="True" />
                                    </ValidationSettings>
                                </dx:ASPxTextBox>
                            </td>
                            <td align="right">
                                所在学院：</td>
                            <td>
                                <dx:ASPxComboBox ID="cmbOrg" runat="server" DataSourceID="odsDepartment" 
                                    TextField="学院名称" ValueField="学院ID" Text='<%# Eval("所属学院") %>' 
                                    Value='<%# Bind("所属学院") %>'>
                                    <ValidationSettings>
                                        <RequiredField ErrorText="请选择" IsRequired="True" />
                                    </ValidationSettings>
                                </dx:ASPxComboBox>
                            </td>
                        </tr>
                         <tr>
                            <td align="right">
                                上传图片：</td>
                            <td>
                                <dx:ASPxUploadControl ID="upload" runat="server" UploadMode="Advanced" 
                                    Width="280px">
                                </dx:ASPxUploadControl>
                            </td>
                            <td align="right">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td align="center" colspan="4">
                                教师简介<dx:ASPxHtmlEditor ID="htmleditor" runat="server" EnableTheming="True" 
                                    Html='<%# Bind("教师简介") %>' Theme="Aqua">
                                 
                                </dx:ASPxHtmlEditor>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" colspan="4">
                                <table width="150">
                                    <tr>
                                        <td>
                                            <dx:ASPxButton ID="btnSave" runat="server" Text="保存" 
                                                CommandArgument='<%# Eval("教师ID") %>' oncommand="btnSave_Command">
                                            </dx:ASPxButton>
                                        </td>
                                        <td>
                                            <dx:ASPxButton ID="btnCancel" runat="server" AutoPostBack="False" Text="取消" 
                                                CausesValidation="False">
                                                <ClientSideEvents Click="function(s, e) {
	gvCFamousTeacher.CancelEdit();
}" />
                                            </dx:ASPxButton>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                    </table>
                </EditForm>
            </Templates>
        </dx:ASPxGridView>
                </td>
            </tr>
        </table>
        <asp:ObjectDataSource ID="odsFamousTeacher" runat="server" 
            DeleteMethod="Delete" InsertMethod="InsertTeacherInfo" 
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataOrderByName" 
            TypeName="MainDataSetTableAdapters.TA_教师信息表TableAdapter" 
            UpdateMethod="Update">
            <DeleteParameters>
                <asp:Parameter Name="Original_教师ID" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="教师姓名" Type="String" />
                <asp:Parameter Name="所属学院" Type="String" />
                <asp:Parameter Name="教师图片" Type="String" />
                <asp:Parameter Name="教师简介" Type="String" />
                <asp:Parameter Name="获奖级别" Type="String" />
                <asp:Parameter Name="获奖年度" Type="String" />
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
        <asp:ObjectDataSource ID="odsDepartment" runat="server" DeleteMethod="Delete" 
            InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
            SelectMethod="GetDataByID" 
            TypeName="MainDataSetTableAdapters.TA_学院信息表TableAdapter" UpdateMethod="Update">
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
    
        <asp:ObjectDataSource ID="odsYear" runat="server" DeleteMethod="Delete" 
            InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
            SelectMethod="GetDataOrderBy排序" 
            TypeName="MainDataSetTableAdapters.DM_获奖年份TableAdapter" UpdateMethod="Update">
            <DeleteParameters>
                <asp:Parameter Name="Original_代码ID" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="代码ID" Type="String" />
                <asp:Parameter Name="代码含义" Type="String" />
                <asp:Parameter Name="启用标志" Type="String" />
                <asp:Parameter Name="备注" Type="String" />
                <asp:Parameter Name="排序" Type="Decimal" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="代码含义" Type="String" />
                <asp:Parameter Name="启用标志" Type="String" />
                <asp:Parameter Name="备注" Type="String" />
                <asp:Parameter Name="排序" Type="Decimal" />
                <asp:Parameter Name="Original_代码ID" Type="String" />
            </UpdateParameters>
        </asp:ObjectDataSource>
    
        <asp:ObjectDataSource ID="odsWinning" runat="server" DeleteMethod="Delete" 
            InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
            SelectMethod="GetDataBy启用标志" 
            TypeName="MainDataSetTableAdapters.DM_获奖级别TableAdapter" UpdateMethod="Update">
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
    
    </div>
    </form>
</body>
</html>
