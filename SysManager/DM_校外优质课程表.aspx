<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DM_校外优质课程表.aspx.cs" Inherits="SysManager_DM_校外优质课程表" %>

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
            <dx:ASPxButton ID="btnNew" runat="server" Text="新增" onclick="btnNew_Click" 
                Width="100px">
            </dx:ASPxButton>
        </td><td width="10%"></td></tr>
            <tr>
                <td align="center" colspan="3">
                    <dx:aspxgridview id="gv_XWYZ" runat="server" autogeneratecolumns="False" datasourceid="ObjectDataSource1"
                        keyfieldname="优质课程代码" width="80%" 
                        oncustomerrortext="gv_XWYZ_CustomErrorText" >
                       <Columns>
                           <dx:GridViewCommandColumn Caption="基本操作" VisibleIndex="0">
                               <editbutton visible="True">
                               </editbutton>
                               <deletebutton text="[删除]" visible="True">
                               </deletebutton>
                           </dx:GridViewCommandColumn>
                           <dx:GridViewDataTextColumn FieldName="优质课程名称" VisibleIndex="2">
                               <Settings AllowSort="True" />
                           </dx:GridViewDataTextColumn>
                           <dx:GridViewDataTextColumn FieldName="优质课程网址" 
                               VisibleIndex="3">
                               
                           </dx:GridViewDataTextColumn>
                           <dx:GridViewDataTextColumn FieldName="优质课程代码" VisibleIndex="1">
                           </dx:GridViewDataTextColumn>
                       </Columns>
                       <SettingsBehavior AllowDragDrop="False" AllowSort="False" 
                           ConfirmDelete="True" />
                       <Settings ShowTitlePanel="True" />
                       <SettingsText CommandCancel="[取消]" CommandEdit="[编辑]" CommandNew="[新增]" 
                           CommandUpdate="[确定]" Title="校外优质课程表" ConfirmDelete="确认删除吗？" />

<SettingsBehavior AllowDragDrop="False" AllowSort="False" ConfirmDelete="True"></SettingsBehavior>

<Settings ShowTitlePanel="True"></Settings>



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
        </dx:aspxgridview>
                    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
                        SelectMethod="GetData" TypeName="DMDataSetTableAdapters.DM_优质课程TableAdapter"
                        DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update">
                        <DeleteParameters>
                            <asp:Parameter Name="Original_优质课程代码" Type="String" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="优质课程名称" Type="String" />
                            <asp:Parameter Name="优质课程网址" Type="String" />
                            <asp:Parameter Name="优质课程代码" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="优质课程名称" Type="String" />
                            <asp:Parameter Name="优质课程网址" Type="String" />
                            <asp:Parameter Name="优质课程代码" Type="String" />
                            <asp:Parameter Name="Original_优质课程代码" Type="String" />
                        </UpdateParameters>
                    </asp:ObjectDataSource>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
