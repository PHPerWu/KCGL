<%@ Page Language="C#" AutoEventWireup="true" CodeFile="NavManager.aspx.cs" Inherits="CollegeManager_TeacherFamous" %>

<%@ Register assembly="DevExpress.Web.v13.2, Version=13.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v13.2, Version=13.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxHtmlEditor.v13.2, Version=13.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxHtmlEditor" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxSpellChecker.v13.2, Version=13.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxSpellChecker" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.v13.2, Version=13.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridLookup" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.v13.2, Version=13.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxUploadControl" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v13.2, Version=13.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPopupControl" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v13.2, Version=13.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxFileManager" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.v13.2, Version=13.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxSiteMapControl" tagprefix="dx1" %>

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
    </head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table width="100%">
            <tr>
                <td align="right">
                    <dx:ASPxButton ID="btnNewTeacher" runat="server" AutoPostBack="False" 
                        Text="新增栏目" CausesValidation="False">
                        <ClientSideEvents Click="function(s, e) {
	gvCFamousTeacher.AddNewRow();
}" />
                    </dx:ASPxButton>
                </td>
            </tr>
            <tr>
                <td>
    
        <dx:ASPxGridView ID="gvNav" runat="server" 
            AutoGenerateColumns="False" DataSourceID="odsNav" KeyFieldName="栏目ID" 
            Width="100%" ClientInstanceName="gvCFamousTeacher" Theme="Glass">
            <Columns>
                <dx:GridViewCommandColumn Caption="操作" VisibleIndex="10" 
                    ShowSelectCheckbox="True">
                    <EditButton Visible="True">
                    </EditButton>
                    <DeleteButton Visible="True">
                    </DeleteButton>
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn VisibleIndex="1" FieldName="栏目ID" Visible="False">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="栏目名称" 
                    VisibleIndex="3">

                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn FieldName="添加人IP" VisibleIndex="6" 
                    Visible="False">
                    <PropertiesComboBox DataSourceID="odsDepartment" TextField="学院名称" 
                        ValueField="学院ID">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn FieldName="添加时间" VisibleIndex="7" Visible="False">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn FieldName="栏目链接" VisibleIndex="4">
                    <PropertiesComboBox DataSourceID="odsWinning" TextField="代码含义" 
                        ValueField="代码ID">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn FieldName="添加人" VisibleIndex="5" Visible="False">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="栏目顺序" FieldName="备用1" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
            </Columns>
            <SettingsBehavior ConfirmDelete="True" />
            <Settings ShowTitlePanel="True" />
            <SettingsText Title="导航管理" PopupEditFormCaption="新增栏目" CommandDelete="删除" 
                CommandEdit="编辑" ConfirmDelete="确定删除吗？" />
            <SettingsPopup>
                <EditForm HorizontalAlign="WindowCenter" VerticalAlign="Middle" />
            </SettingsPopup>
            <SettingsDataSecurity AllowDelete="False" />
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
                <dx:ASPxTextBox ID="txtID" runat="server" Text='<%# Bind("栏目ID") %>' 
                        Value='<%# Bind("栏目ID") %>' Width="170px" Visible=false>
                    </dx:ASPxTextBox>
                  
                    栏目顺序：<dx:ASPxTextBox ID="txtRange" runat="server" Text='<%# Bind("备用1") %>' 
                        Value='<%# Bind("备用1") %>' Width="170px">
                        
                    </dx:ASPxTextBox>
                  <%-- <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                        ErrorMessage="必须输入数字" Text='<%# Eval("栏目ID") %>' 
                        ValidationExpression="^[0-9]*$ " Visible='<%# Eval("栏目ID") %>'></asp:RegularExpressionValidator>--%>
                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ErrorMessage="栏目顺序不能为空" Text='<%# Eval("栏目ID") %>' 
                        Visible='<%# Eval("栏目ID") %>'></asp:RequiredFieldValidator>--%>
                    <br />
                     栏目名称：<br /> 
                    <dx:ASPxTextBox ID="txtName" runat="server" Text='<%# Bind("栏目名称") %>' 
                        Value='<%# Bind("栏目名称") %>' Width="170px">
                    </dx:ASPxTextBox>
                    <br />
                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ErrorMessage="栏目名称不能为空" Text='<%# Eval("栏目名称") %>' 
                        Visible='<%# Eval("栏目名称") %>'></asp:RequiredFieldValidator>--%>
                    <br />
                    栏目链接：<br /> 
                    <dx:ASPxTextBox ID="txtUrl" runat="server" Text='<%# Bind("栏目链接") %>' 
                        Value='<%# Bind("栏目链接") %>' Width="170px">
                    </dx:ASPxTextBox>
                    <br />
                   <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ErrorMessage="栏目链接不能为空" Text='<%# Eval("栏目链接") %>' 
                        Visible='<%# Eval("栏目链接") %>'></asp:RequiredFieldValidator>--%>
                    <br />
                  <dx:ASPxButton ID="btn_Save" runat="server" OnCommand="btn_Save_Command" Text="保存"
                                                        Width="60px" >
<%--                                                        <ClientSideEvents Click="function(s, e) {
    if((txt_OldPassword.isValid==true)&amp;&amp;(txt_Password.isValid==true)&amp;&amp;(txt_PasswordAgain.isValid==true))
{
     ASPxCallback1.PerformCallback();
     ASPxLoadingPanel1.Show(); 
     e.processOnServer=true;
}
else
e.processOnServer=false;
}" />
<ClientSideEvents Click="function(s, e) {
    if((txt_OldPassword.isValid==true)&amp;&amp;(txt_Password.isValid==true)&amp;&amp;(txt_PasswordAgain.isValid==true))
{
     ASPxCallback1.PerformCallback();
     ASPxLoadingPanel1.Show(); 
     e.processOnServer=true;
}
else
e.processOnServer=false;
}"></ClientSideEvents>--%>
                                                    </dx:ASPxButton>

                                                    <dx:ASPxButton ID="btn_Cancel" runat="server" CausesValidation="False" Text="取消"
                                                        Width="60px" AutoPostBack="False">
                                                        <ClientSideEvents Click="function(s, e) {
     lblResult.SetText('');
     ASPxCallback1.PerformCallback();
     ASPxLoadingPanel1.Show(); 
     PopUpChangePassword.Hide();
     e.processOnServer=false;
}" />
<ClientSideEvents Click="function(s, e) {
     lblResult.SetText(&#39;&#39;);
     ASPxCallback1.PerformCallback();
     ASPxLoadingPanel1.Show(); 
     PopUpChangePassword.Hide();
     e.processOnServer=false;
}"></ClientSideEvents>
                                                    </dx:ASPxButton>
                </EditForm>
            </Templates>
        </dx:ASPxGridView>
                </td>
            </tr>
        </table>
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
    
        <asp:ObjectDataSource ID="odsNav" runat="server" DeleteMethod="DeleteQuery" 
            InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
            SelectMethod="GetDataByID" TypeName="ImageTableAdapters.TA_导航表TableAdapter">
            <DeleteParameters>
                <asp:Parameter Name="栏目ID" Type="Decimal" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="栏目ID" Type="Decimal" />
                <asp:Parameter Name="栏目名称" Type="String" />
                <asp:Parameter Name="栏目链接" Type="String" />
                <asp:Parameter Name="添加人" Type="String" />
                <asp:Parameter Name="添加人IP" Type="String" />
                <asp:Parameter Name="添加时间" Type="String" />
                <asp:Parameter Name="备用1" Type="String" />
                <asp:Parameter Name="备用2" Type="String" />
                <asp:Parameter Name="备用3" Type="String" />
                <asp:Parameter Name="备用4" Type="String" />
                <asp:Parameter Name="备用5" Type="String" />
            </InsertParameters>
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
    
        <dx:ASPxButton ID="btnDelete" runat="server" onclick="btnDelete_Click" 
            Text="删除">
        </dx:ASPxButton>
    
    </div>
    </form>
</body>
</html>
