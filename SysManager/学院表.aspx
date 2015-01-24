<%@ Page Language="C#" AutoEventWireup="true" CodeFile="学院表.aspx.cs" Inherits="SysManager_学院表" %>

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
      <tr><td width="10%"></td><td width="80%" align="right">
            <dx:ASPxButton ID="btnNew" runat="server" Text="新增"  
                Width="100px" onclick="btnNew_Click">
            </dx:ASPxButton>
        </td><td width="10%"></td></tr>
            <tr>
                <td align="center" colspan="3">
                   <dx:ASPxGridView ID="gv_XY" runat="server" AutoGenerateColumns="False" 
                        DataSourceID="ObjectDataSource1" KeyFieldName="学院ID" Width="80%" 
                        oncustomerrortext="gv_XY_CustomErrorText">
                       <Columns>
                        <dx:GridViewCommandColumn Caption="基本操作" VisibleIndex="0" Width="40%">
                               <EditButton Text="[修改]" Visible="True">
                               </EditButton>
                               <NewButton Text="[新增]">
                               </NewButton>
                               <DeleteButton Text="[删除]" Visible="True">
                               </DeleteButton>
                           </dx:GridViewCommandColumn>
                           <dx:GridViewDataTextColumn FieldName="学院ID" VisibleIndex="0"  SortIndex="0" SortOrder="Ascending" 
                               Width="30%">
                               <Settings AllowSort="True" />
                               <PropertiesTextEdit NullText="必填" MaxLength="10">
                                   
<ValidationSettings SetFocusOnError="True">
                                 
<RequiredField  ErrorText="不能为空 " IsRequired="true"/>
                                   
</ValidationSettings>
                               
</PropertiesTextEdit>

<Settings AllowSort="True"></Settings>
                           </dx:GridViewDataTextColumn>
                           <dx:GridViewDataTextColumn FieldName="学院名称" 
                               VisibleIndex="1">
                               <PropertiesTextEdit MaxLength="50" NullText="必填">
                                   
<ValidationSettings SetFocusOnError="True">
                                       
<RequiredField ErrorText="不能为空" IsRequired="True" />
                                   
</ValidationSettings>
                               
</PropertiesTextEdit>
                           </dx:GridViewDataTextColumn>
                       </Columns>
                       <SettingsBehavior AllowDragDrop="False" AllowSort="False" 
                           ConfirmDelete="True" />
                       <Settings ShowTitlePanel="True" />
                       <SettingsText CommandCancel="[取消]" CommandEdit="[编辑]" CommandNew="[新增]" 
                           CommandUpdate="[确定]" Title="教学方式代码表" ConfirmDelete="确认删除吗？" />

<SettingsBehavior AllowDragDrop="False" AllowSort="False" ConfirmDelete="True"></SettingsBehavior>

<Settings ShowTitlePanel="True"></Settings>

<SettingsText Title="学院信息表" ConfirmDelete="确认删除吗？" CommandEdit="[编辑]" CommandNew="[新增]" 
                           CommandCancel="[取消]" CommandUpdate="[确定]"></SettingsText>

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
                        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                        TypeName="MainDataSetTableAdapters.TA_学院信息表TableAdapter" 
                        DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update">
                        <DeleteParameters>
                            <asp:Parameter Name="Original_学院ID" Type="String" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="学院ID" Type="String" />
                            <asp:Parameter Name="学院名称" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="学院ID" Type="String" />
                            <asp:Parameter Name="学院名称" Type="String" />
                            <asp:Parameter Name="Original_学院ID" Type="String" />
                        </UpdateParameters>
                    </asp:ObjectDataSource>
                </td>
               
            </tr>
            
        </table>
    </div>
    </form>
</body>
</html>
