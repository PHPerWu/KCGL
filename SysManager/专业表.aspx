<%@ Page Language="C#" AutoEventWireup="true" CodeFile="专业表.aspx.cs" Inherits="DM_教学方式表" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register assembly="DevExpress.Web.v13.2, Version=13.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.v13.2, Version=13.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxUploadControl" tagprefix="dx" %>

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
            <dx:ASPxButton ID="btnNew" runat="server" Text="新增" Width="100px" 
                onclick="btnNew_Click">
            </dx:ASPxButton>
        </td><td width="10%"></td></tr>
            <tr>
                <td align="center" colspan="3">
                   <dx:ASPxGridView ID="gv_ZY" runat="server" AutoGenerateColumns="False" 
                        DataSourceID="ObjectDataSource1" KeyFieldName="专业ID" Width="80%" 
                        oncustomerrortext="gv_ZY_CustomErrorText" 
                        ondetailrowexpandedchanged="gv_ZY_DetailRowExpandedChanged">
                       <Columns>
                           <dx:GridViewCommandColumn Caption="基本操作" VisibleIndex="0" Width="100px">
                               <EditButton Visible="True">
                               </EditButton>
                               <DeleteButton Visible="True">
                               </DeleteButton>
                           </dx:GridViewCommandColumn>
                           <dx:GridViewDataTextColumn FieldName="专业ID" VisibleIndex="1">
                           </dx:GridViewDataTextColumn>
                           <dx:GridViewDataTextColumn FieldName="专业名称" 
                               VisibleIndex="2">
                           </dx:GridViewDataTextColumn>
                           <dx:GridViewDataComboBoxColumn FieldName="所属学院" VisibleIndex="3">
                               <PropertiesComboBox DataSourceID="odsDepartment" TextField="学院名称" 
                                   ValueField="学院ID">
                               </PropertiesComboBox>
                           </dx:GridViewDataComboBoxColumn>
                           <dx:GridViewDataComboBoxColumn FieldName="专业英文名称" VisibleIndex="4" 
                               Caption="专业类别">
                           <PropertiesComboBox DataSourceID="ods专业类别" TextField="代码含义" 
                                   ValueField="代码ID">
                               </PropertiesComboBox>
                           </dx:GridViewDataComboBoxColumn>
                           <dx:GridViewDataComboBoxColumn FieldName="专业学制" VisibleIndex="5">
                               <PropertiesComboBox DataSourceID="odsZYXZ" TextField="代码含义" ValueField="代码ID">
                                   <Style VerticalAlign="Top">
                                   </Style>
                               </PropertiesComboBox>
                           </dx:GridViewDataComboBoxColumn>
                           <dx:GridViewDataMemoColumn FieldName="专业简介" VisibleIndex="6">
                               <PropertiesMemoEdit Height="120px">
                                   <Style VerticalAlign="Top">
                                   </Style>
                               </PropertiesMemoEdit>
                               <DataItemTemplate>
                                   <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text=' <%#Eval("专业简介").ToString().Length >= 20 ? Eval("专业简介").ToString().Substring(0,20)+"..." : Eval("专业简介").ToString()%>' ToolTip='<%#Eval("专业简介").ToString() %>'>
                                   </dx:ASPxLabel>
                              
                               </DataItemTemplate>
                           </dx:GridViewDataMemoColumn>
                       </Columns>
                       <SettingsBehavior AllowDragDrop="False" AllowSort="False" 
                           ConfirmDelete="True" />
                       <Settings ShowTitlePanel="True" />
                       <SettingsText CommandCancel="[取消]" CommandEdit="[编辑]" CommandNew="[新增]" 
                           CommandUpdate="[确定]" Title="专业信息表" ConfirmDelete="确认删除吗？" 
                           CommandDelete="[删除]" />
                       <SettingsDetail ShowDetailRow="True" AllowOnlyOneMasterRowExpanded="True" />
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
                                           <dx:ASPxButton ID="btnFile" runat="server" AutoPostBack="False" Text="新增附件">
                                               <ClientSideEvents Click="function(s, e) {
	gvPYFA.AddNewRow();
}" />
                                           </dx:ASPxButton>
                                       </td>
                                   </tr>
                                   <tr>
                                       <td>
                                           <dx:ASPxGridView ID="gvPYFA" runat="server" AutoGenerateColumns="False" 
                                               ClientInstanceName="gvPYFA" DataSourceID="odsZYFJ" KeyFieldName="附件ID" 
                                               onbeforeperformdataselect="gvPYFA_BeforePerformDataSelect" 
                                               oninitnewrow="gvPYFA_InitNewRow" Width="100%">
                                               <Columns>
                                                   <dx:GridViewDataTextColumn Caption="序号" VisibleIndex="1">
                                                       <DataItemTemplate>
                                                           <%#Container.VisibleIndex+1 %>
                                                       </DataItemTemplate>
                                                   </dx:GridViewDataTextColumn>
                                                   <dx:GridViewCommandColumn Caption="基本操作" VisibleIndex="0">
                                                       <EditButton Visible="True">
                                                       </EditButton>
                                                       <DeleteButton Visible="True">
                                                       </DeleteButton>
                                                   </dx:GridViewCommandColumn>
                                                   <dx:GridViewDataTextColumn FieldName="附件ID" ReadOnly="True" Visible="False" 
                                                       VisibleIndex="2">
                                                   </dx:GridViewDataTextColumn>
                                                   <dx:GridViewDataTextColumn FieldName="附件名称" VisibleIndex="3">
                                                   </dx:GridViewDataTextColumn>
                                                   <dx:GridViewDataTextColumn FieldName="附件路径" VisibleIndex="4">
                                                       <DataItemTemplate>
                                                           <dx:ASPxHyperLink ID="ASPxHyperLink1" runat="server" 
                                                               NavigateUrl='<%# Eval("附件路径") %>' Text='<%# Eval("附件路径") %>' />
                                                       </DataItemTemplate>
                                                   </dx:GridViewDataTextColumn>
                                                   <dx:GridViewDataTextColumn FieldName="附件类型" VisibleIndex="5">
                                                   </dx:GridViewDataTextColumn>
                                                   <dx:GridViewDataTextColumn FieldName="专业ID" Visible="False" VisibleIndex="6">
                                                   </dx:GridViewDataTextColumn>
                                               </Columns>
                                               <SettingsBehavior ConfirmDelete="True" />
                                               <SettingsText CommandDelete="[删除]" CommandEdit="[编辑]" ConfirmDelete="确定删除吗？" />
                                               <Styles>
                                                   <Header HorizontalAlign="Center">
                                                   </Header>
                                               </Styles>
                                               <Templates>
                                                   <EditForm>
                                                       <table align="center">
                                                           <tr>
                                                               <td>
                                                                   附件名称：</td>
                                                               <td>
                                                                   <dx:ASPxTextBox ID="txbName" runat="server" Text='<%# Bind("附件名称") %>' 
                                                                       Width="280px">
                                                                       <ValidationSettings>
                                                                           <RequiredField ErrorText="请填写" IsRequired="True" />
                                                                       </ValidationSettings>
                                                                   </dx:ASPxTextBox>
                                                               </td>
                                                           </tr>
                                                           <tr>
                                                               <td>
                                                                   选择附件：</td>
                                                               <td>
                                                                   <dx:ASPxUploadControl ID="upload" runat="server" UploadMode="Auto" 
                                                                       Width="280px">
                                                                   </dx:ASPxUploadControl>
                                                               </td>
                                                           </tr>
                                                           <tr>
                                                               <td align="center" colspan="2">
                                                                   &nbsp;</td>
                                                           </tr>
                                                           <tr>
                                                               <td align="center" colspan="2">
                                                                   <table width="180">
                                                                       <tr>
                                                                           <td>
                                                                               <dx:ASPxButton ID="btnSaveFile" runat="server" 
                                                                                   CommandArgument='<%# Eval("附件ID") %>' oncommand="btnSaveFile_Command" Text="保存">
                                                                               </dx:ASPxButton>
                                                                           </td>
                                                                           <td>
                                                                               <dx:ASPxButton ID="btnCancel" runat="server" AutoPostBack="False" Text="取消">
                                                                                   <ClientSideEvents Click="function(s, e) {
	gvPYFA.CancelEdit();
}" />
                                                                               </dx:ASPxButton>
                                                                           </td>
                                                                       </tr>
                                                                   </table>
                                                               </td>
                                                           </tr>
                                                       </table>
                                                   </EditForm>
                                               </Templates>
                                           </dx:ASPxGridView>
                                       </td>
                                   </tr>
                               </table>
                           </DetailRow>
                       </Templates>
        </dx:ASPxGridView>
                    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
                        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
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
                            <asp:Parameter Name="专业ID" Type="String" />
                            <asp:Parameter Name="专业名称" Type="String" />
                            <asp:Parameter Name="所属学院" Type="String" />
                            <asp:Parameter Name="专业英文名称" Type="String" />
                            <asp:Parameter Name="专业学制" Type="String" />
                            <asp:Parameter Name="专业简介" Type="String" />
                            <asp:Parameter Name="Original_专业ID" Type="String" />
                        </UpdateParameters>
                    </asp:ObjectDataSource>
                    <asp:ObjectDataSource ID="ods_XY" runat="server" DeleteMethod="Delete" 
                        InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
                        SelectMethod="GetData" TypeName="MainDataSetTableAdapters.TA_学院信息表TableAdapter" 
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
                    <asp:ObjectDataSource ID="odsZYXZ" runat="server" DeleteMethod="Delete" 
                        InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
                        SelectMethod="GetDataByQYBZ" 
                        TypeName="DMDataSetTableAdapters.DM_专业学制TableAdapter" UpdateMethod="Update">
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
                    <asp:ObjectDataSource ID="odsDepartment" runat="server" DeleteMethod="Delete" 
                        InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
                        SelectMethod="GetData" TypeName="MainDataSetTableAdapters.TA_学院信息表TableAdapter" 
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
                    <asp:ObjectDataSource ID="odsZYFJ" runat="server" DeleteMethod="Delete" 
                        InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
                        SelectMethod="GetDataBy专业ID" 
                        TypeName="MainDataSetTableAdapters.TA_培养方案附件TableAdapter" UpdateMethod="Update">
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
                    <asp:ObjectDataSource ID="ods专业类别" runat="server" OldValuesParameterFormatString="original_{0}" 
                        SelectMethod="GetDataByQYBZ" 
                        TypeName="DMDataSetTableAdapters.DM_专业类别TableAdapter">
                    </asp:ObjectDataSource>
                </td>
               
            </tr>
            
        </table>
        
    </div>
    </form>
</body>
</html>
