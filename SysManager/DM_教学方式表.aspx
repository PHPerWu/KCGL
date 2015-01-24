<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DM_教学方式表.aspx.cs" Inherits="SysManager_专业表" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register assembly="DevExpress.Web.v13.2, Version=13.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        
    <table style="width: 100%;">
    <tr>
    <td width="10%"></td>
    <td width="80%" align="right">
        <dx:ASPxButton ID="btnNew" runat="server" Text="新增" onclick="btnNew_Click" 
            Width="100px">
        </dx:ASPxButton>
    </td><td width="10%"></td>
    </tr>
            <tr>
                <td align="center" colspan="3">
                   <dx:ASPxGridView ID="gv_teach" runat="server" AutoGenerateColumns="False" 
                        DataSourceID="ObjectDataSource1" KeyFieldName="代码ID" Width="80%" 
                        oncustomerrortext="gv_teach_CustomErrorText" oninitnewrow="gv_teach_InitNewRow">
                       <Columns>
                           <dx:GridViewCommandColumn Caption="基本操作" VisibleIndex="0">
                               <EditButton Text="[修改]" Visible="True">
                               </EditButton>
                               <NewButton Text="[新增]">
                               </NewButton>
                               <DeleteButton Text="[删除]" Visible="True">
                               </DeleteButton>
                           </dx:GridViewCommandColumn>
                           <dx:GridViewDataTextColumn Caption="代码" FieldName="代码ID" 
                               ToolTip="代码" VisibleIndex="1" SortIndex="0" SortOrder="Ascending" 
                               Width="20%">
                               <PropertiesTextEdit NullText="必填" MaxLength="10">
                                   <ValidationSettings SetFocusOnError="True">
                                 <RequiredField  ErrorText="不能为空 " IsRequired="true"/>
                                   </ValidationSettings>
                               </PropertiesTextEdit>
                               <Settings AllowSort="True" />
                           </dx:GridViewDataTextColumn>
                           <dx:GridViewDataTextColumn Caption="含义" FieldName="代码含义" ToolTip="含义" 
                               VisibleIndex="2">
                               <PropertiesTextEdit MaxLength="50" NullText="必填">
                                   <ValidationSettings SetFocusOnError="True">
                                       <RequiredField ErrorText="不能为空" IsRequired="True" />
                                   </ValidationSettings>
                               </PropertiesTextEdit>
                           </dx:GridViewDataTextColumn>
                           <dx:GridViewDataCheckColumn Caption="启用标志" FieldName="启用标志" ToolTip="启用标志" 
                               VisibleIndex="3">
                               <PropertiesCheckEdit ValueChecked="true" ValueType="System.String" 
                                   ValueUnchecked="false">
                               </PropertiesCheckEdit>
                           </dx:GridViewDataCheckColumn>
                           <dx:GridViewDataMemoColumn Caption="备注" FieldName="备注" ToolTip="备注" 
                               VisibleIndex="4">
                               <PropertiesMemoEdit>
                                   <ValidationSettings>
                                       <RegularExpression ErrorText="输入字符数过多，请删除" ValidationExpression=".{0,50}" />
                                   </ValidationSettings>
                               </PropertiesMemoEdit>
                           </dx:GridViewDataMemoColumn>
                       </Columns>
                       <SettingsBehavior AllowDragDrop="False" AllowSort="False" 
                           ConfirmDelete="True" />
                       <Settings ShowTitlePanel="True" />
                       <SettingsText CommandCancel="[取消]" CommandEdit="[编辑]" CommandNew="[新增]" 
                           CommandUpdate="[确定]" Title="教学方式代码表" ConfirmDelete="确认删除吗？" />
                       <Styles>
                           <Header HorizontalAlign="Center" VerticalAlign="Middle">
                           </Header>
                           <Cell HorizontalAlign="Center">
                           </Cell>
                           <AlternatingRow Enabled="True">
                           </AlternatingRow>
                           <TitlePanel Font-Bold="True" Font-Size="Large">
                           </TitlePanel>
                       </Styles>
        </dx:ASPxGridView>
                    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
                        DeleteMethod="Delete" InsertMethod="Insert" 
                        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                        TypeName="DMDataSetTableAdapters.DM_教学方式表TableAdapter" UpdateMethod="Update">
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
                </td>
              
            </tr>
            
        </table>
    </div>
    </form>
</body>
</html>
