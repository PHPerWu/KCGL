<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TA_UsersAndRoles.aspx.cs" Inherits="SysManager_TA_UsersAndRoles" %>

<%@ Register assembly="DevExpress.Web.v13.2, Version=13.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v13.2, Version=13.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.v13.2, Version=13.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridLookup" tagprefix="dx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style2
        {
            height: 20px;
        }
    </style>
     <script type="text/javascript">
    // <![CDATA[
         function CloseGridLookup() {
             gridLookup.ConfirmCurrentSelection();
             gridLookup.HideDropDown();
         }
    // ]]>
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div align="center">
    <table width="100%">
     <tr><td width="10%"></td><td width="80%" align="right">
            <dx:ASPxButton ID="btnNew" runat="server" Text="新增"  
                Width="100px" onclick="btnNew_Click">
            </dx:ASPxButton>
        </td><td width="10%"></td></tr>
        <tr> <td colspan="3" align="center">
        <dx:ASPxGridView ID="gv_users" runat="server" AutoGenerateColumns="False" 
            DataSourceID="ods_Users" KeyFieldName="USERNAME" Width="80%" 
            ClientInstanceName="gv_users" oninitnewrow="gv_users_InitNewRow" 
            onrowupdating="gv_users_RowUpdating" 
            onstartrowediting="gv_users_StartRowEditing" 
            onrowdeleting="gv_users_RowDeleting">
            <Columns>
                <dx:GridViewCommandColumn Caption="操作" VisibleIndex="1">
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
                <dx:GridViewDataTextColumn Caption="用户名" FieldName="USERNAME" ReadOnly="True" 
                    VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="USERPWD" VisibleIndex="3" Caption="密码" 
                    Visible="False">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn FieldName="所属学院ID" VisibleIndex="4" 
                    Caption="所属学院">
                    <PropertiesComboBox DataSourceID="ods_学院" TextField="学院名称" ValueField="学院ID">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn FieldName="所属学院名称" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
            </Columns>
            <SettingsBehavior ConfirmDelete="True" />
            <Settings ShowTitlePanel="True" />
            <SettingsText CommandDelete="删除" CommandEdit="编辑" CommandNew="新增" 
                ConfirmDelete="确定删除该用户吗？" Title="用户表" />
            <Styles>
                <TitlePanel Font-Bold="True" Font-Size="Large">
                </TitlePanel>
            </Styles>
            <Templates>
                <EditForm>
                    <table width="90%">
                        <tr>
                            <td>
                                用户名：</td>
                            <td align="left">
                                <dx:ASPxTextBox ID="txt_username" runat="server" Text='<%# Bind("USERNAME") %>' 
                                 Enabled='<%# Convert.ToString(Eval("USERNAME")).Equals("")?true:false %>'
                                    Width="170px" ClientInstanceName="txt_username" 
                                  
                                    >
                                 
                                    <ValidationSettings>
                                        <RequiredField ErrorText="请填写" IsRequired="True" />
                                    </ValidationSettings>
                                 
                                </dx:ASPxTextBox>
                            </td>
                            <td>
                                所属学院：</td>
                            <td align="left">
                                <dx:ASPxComboBox ID="cmb_学院" runat="server" DataSourceID="ods_学院" 
                                    TextField="学院名称" Value='<%# Bind("所属学院ID") %>' ValueField="学院ID" 
                                    ClientInstanceName="cmb_学院">
                                    <DropDownButton Text="请选择">
                                    </DropDownButton>
                                    <ValidationSettings>
                                        <RequiredField ErrorText="请选择" IsRequired="True" />
                                    </ValidationSettings>
                                </dx:ASPxComboBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                角色：</td>
                            <td align="left">
                             <dx:ASPxGridLookup ID="GridLookup" runat="server" SelectionMode="Multiple" 
                                    DataSourceID="ods_角色" ClientInstanceName="gridLookup"
                                   KeyFieldName="ROLEID" Width="180px" TextFormatString="{2}" 
                                    MultiTextSeparator=", " AutoGenerateColumns="False" 
                                    oninit="GridLookup_Init" ondatabinding="GridLookup_DataBinding">
                    <Columns>
                        <dx:GridViewCommandColumn ShowSelectCheckbox="True" />
                        <dx:GridViewDataColumn FieldName="ROLEID" Visible="false" />
                     <dx:GridViewDataColumn Caption="序号">
                        <DataItemTemplate>
                        <%#Container.VisibleIndex+1 %>
                        </DataItemTemplate>
                        </dx:GridViewDataColumn>
                        <dx:GridViewDataColumn FieldName="ROLE" Settings-AllowAutoFilter="False" Caption="角色" >
                            <Settings AllowAutoFilter="False" />
                        </dx:GridViewDataColumn>
                    </Columns>
                    <GridViewProperties>
                        <Templates>
                            <StatusBar>
                                <table width="100%"><tr>
                                    <td style="width: 100%" />
                                    <td  onclick="return _aspxCancelBubble(event)">
                                        <dx:ASPxButton ID="Close" runat="server" AutoPostBack="false" Text="Close" ClientSideEvents-Click="CloseGridLookup" />
                                    </td>
                                </tr></table>
                            </StatusBar>
                        </Templates>
                        <SettingsBehavior AllowSelectByRowClick="True" />
                        <Settings ShowFilterRow="True" ShowStatusBar="Visible" />
                    </GridViewProperties>
                                 <DropDownButton Text="请选择">
                                 </DropDownButton>
                                 <ValidationSettings>
                                     <RequiredField ErrorText="请选择" IsRequired="True" />
                                 </ValidationSettings>
                </dx:ASPxGridLookup>
                               </td>
                            <td align="left">
                                密码：</td>
                            <td align="left">
                                <dx:ASPxTextBox ID="ASPxTextBox1" runat="server" Text='<%# Bind("USERPWD") %>' 
                                    Width="170px">
                                </dx:ASPxTextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style2">
                            </td>
                            <td align="left" class="style2">
                            </td>
                            <td align="left" class="style2">
                            </td>
                            <td align="left" class="style2">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td align="left">
                                &nbsp;</td>
                            <td align="left">
                                <dx:ASPxButton ID="btn_save" runat="server" Text="保存" 
                                    oncommand="btn_save_Command">
                                    <ClientSideEvents Click="function(s, e) {
     e.processOnServer=false;
 if(cmb_学院.isValid==true&amp;&amp;gridLookup.isValid==true)
{
    e.processOnServer=true;

}
}" />
                                </dx:ASPxButton>
                            </td>
                            <td align="left">
                                <dx:ASPxButton ID="btn_cancel" runat="server" AutoPostBack="False" Text="取消">
                                    <ClientSideEvents Click="function(s, e) {
	gv_users.CancelEdit();
}" />
                                </dx:ASPxButton>
                            </td>
                        </tr>
                    </table>
                </EditForm>
            </Templates>
        </dx:ASPxGridView>
        </td></tr>
        </table>
        <br />
        <asp:ObjectDataSource ID="ods_Users" runat="server" DeleteMethod="Delete" 
            InsertMethod="InsertUser" OldValuesParameterFormatString="original_{0}" 
            SelectMethod="GetData" TypeName="MainDataSetTableAdapters.TA_用户表TableAdapter" 
            UpdateMethod="UpdatePwd">
            <DeleteParameters>
                <asp:Parameter Name="Original_USERNAME" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="USERNAME" Type="String" />
                <asp:Parameter Name="USERPWD" Type="String" />
                <asp:Parameter Name="所属学院ID" Type="String" />
                <asp:Parameter Name="所属学院名称" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="USERPWD" Type="String" />
                <asp:Parameter Name="Original_USERNAME" Type="String" />
            </UpdateParameters>
        </asp:ObjectDataSource>
    
        <br />
        <asp:ObjectDataSource ID="ods_学院" runat="server" DeleteMethod="Delete" 
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
    
        <br />
        <asp:ObjectDataSource ID="ods_角色" runat="server" DeleteMethod="Delete" 
            InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
            SelectMethod="GetData" TypeName="MainDataSetTableAdapters.TA_角色表TableAdapter" 
            UpdateMethod="Update">
            <DeleteParameters>
                <asp:Parameter Name="Original_ROLEID" Type="Decimal" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ROLEID" Type="Decimal" />
                <asp:Parameter Name="ROLE" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="ROLE" Type="String" />
                <asp:Parameter Name="Original_ROLEID" Type="Decimal" />
            </UpdateParameters>
        </asp:ObjectDataSource>
    
    </div>
    </form>
</body>
</html>
