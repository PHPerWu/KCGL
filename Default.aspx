<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Default" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxSiteMapControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTreeView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxSplitter" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxCallback" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxLoadingPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.Web.v13.2, Version=13.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxHtmlEditor.v13.2, Version=13.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxHtmlEditor" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxSpellChecker.v13.2, Version=13.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxSpellChecker" tagprefix="dx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>湖北大学课程管理系统</title>
    <link href="Styles/Site.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="Form1" runat="server">
    <div class="page">
        <div class="header" style="background-color: #FFFFFF;">
            <div class="title">
                <img id="Img1" src="~/image/header_b2.jpg" runat="server" />
            </div>
            <div style="padding-top: 70px; padding-left: 0px; text-align:right; margin-right: 40px;">
                <asp:LoginView ID="LoginView1" runat="server">
                    <AnonymousTemplate>
                        &nbsp;
                    </AnonymousTemplate>
                    <LoggedInTemplate>
                        <asp:LoginName ID="LoginName1" runat="server" Font-Bold="True" Font-Size="13px" ForeColor="#003300" />
                        <br />
                        <asp:LoginStatus LogoutPageUrl="~/Main_index.aspx" ID="LoginStatus1" runat="server"
                            LogoutAction="RedirectToLoginPage" Font-Bold="False" Font-Size="13px" ForeColor="#003300" />
                        <asp:LinkButton ID="LinkButton1" runat="server" OnClientClick="
     ASPxLoadingPanel1.Show();
    ASPxCallback1.PerformCallback();     
	PopUpChangePassword.Show();
    return false;
 " Font-Size="12px" ForeColor="#000CE4">修改密码</asp:LinkButton>
                    </LoggedInTemplate>
                </asp:LoginView>
            </div>
            <div class="main">
                <dx:ASPxSplitter ID="ASPxSplitter1" runat="server" Height="580px" Width="100%">
                    <Panes>
                        <dx:SplitterPane Size="210px" MinSize="30px" ScrollBars="Auto" ShowCollapseBackwardButton="True" AutoHeight="False">
                            <ContentCollection>
                                <dx:SplitterContentControl ID="SplitterContentControl1" runat="server" SupportsDisabledAttribute="True">
                                    <dx:ASPxTreeView ID="ASPxTreeView1" runat="server" DataSourceID="ASPxSiteMapDataSource1"
                                        Target="contentUrlPaneArea">
                                    </dx:ASPxTreeView>
                                    <dx:ASPxSiteMapDataSource ID="ASPxSiteMapDataSource1" runat="server" SiteMapFileName=""
                                        SiteMapProvider="webSiteMap" EnableRoles="True" />
                                </dx:SplitterContentControl>
                            </ContentCollection>
                        </dx:SplitterPane>
                        <dx:SplitterPane Name="ContentUrlPane" ScrollBars="Auto" ContentUrlIFrameName="contentUrlPaneArea" AutoHeight="False" AllowResize="Default">
                            <ContentCollection>
                                <dx:SplitterContentControl ID="SplitterContentControl2" runat="server" SupportsDisabledAttribute="True">
                                </dx:SplitterContentControl>
                            </ContentCollection>
                        </dx:SplitterPane>
                    </Panes>
                </dx:ASPxSplitter>
            </div>
            <div class="clear">
                <dx:ASPxPopupControl ID="ASPxPopupControl1" runat="server" ClientInstanceName="PopUpChangePassword"
                    CloseAction="CloseButton" HeaderText="用户密码修改" Height="241px" Modal="True" PopupHorizontalAlign="WindowCenter"
                    PopupVerticalAlign="WindowCenter" Width="300px" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                    CssPostfix="Aqua" LoadingPanelImagePosition="Top" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                    <LoadingPanelImage Url="~/App_Themes/Aqua/Web/Loading.gif">
                    </LoadingPanelImage>
                    <ClientSideEvents Closing="function(s, e) {
	ASPxClientEdit.ClearEditorsInContainer(s.GetMainElement());
}" PopUp="function(s, e) {
	ASPxClientEdit.ClearEditorsInContainer(s.GetMainElement());
}" />

<ClientSideEvents Closing="function(s, e) {
	ASPxClientEdit.ClearEditorsInContainer(s.GetMainElement());
}" PopUp="function(s, e) {
	ASPxClientEdit.ClearEditorsInContainer(s.GetMainElement());
}"></ClientSideEvents>

                    <ContentStyle VerticalAlign="Top">
                    </ContentStyle>
                    <ContentCollection>
                        <dx:PopupControlContentControl ID="PopupControlContentControl1" runat="server" SupportsDisabledAttribute="True">
                            <table>
                                <tr>
                                    <td align="right" valign="top" class="style5" style="padding-top: 4px; margin-top: 4px">
                                        用户名：
                                    </td>
                                    <td valign="top" class="style5">
                                        <span class="bold">
                                            <asp:LoginName ID="LoginName" runat="server" />
                                        </span>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" valign="top" style="padding-top: 4px; margin-top: 4px">
                                        旧密码：
                                    </td>
                                    <td valign="top">
                                        <dx:ASPxTextBox ID="txt_OldPassword" runat="server" ClientInstanceName="txt_OldPassword"
                                            Width="150px" Password="True">
                                            <ClientSideEvents Validation="function(s, e) {

}" />
<ClientSideEvents Validation="function(s, e) {

}"></ClientSideEvents>

                                            <ValidationSettings ErrorTextPosition="Bottom">
                                                <RequiredField ErrorText="请填写密码" IsRequired="True" />
                                                <RegularExpression ErrorText="密码长度不能小于5" ValidationExpression="\w{5,}" />
<RegularExpression ErrorText="密码长度不能小于5" ValidationExpression="\w{5,}"></RegularExpression>

<RequiredField IsRequired="True" ErrorText="请填写密码"></RequiredField>
                                            </ValidationSettings>
                                        </dx:ASPxTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" valign="top" style="padding-top: 4px; margin-top: 4px">
                                        新密码：
                                    </td>
                                    <td valign="top">
                                        <dx:ASPxTextBox ID="txt_Password" runat="server" ClientInstanceName="txt_Password"
                                            Width="150px" Password="True">
                                            <ClientSideEvents Validation="function(s, e) {

}" />
<ClientSideEvents Validation="function(s, e) {

}"></ClientSideEvents>

                                            <ValidationSettings ErrorTextPosition="Bottom">
                                                <RequiredField ErrorText="请填写密码" IsRequired="True" />
                                                <RegularExpression ErrorText="密码长度不能小于5" ValidationExpression="\w{5,}" />
<RegularExpression ErrorText="密码长度不能小于5" ValidationExpression="\w{5,}"></RegularExpression>

<RequiredField IsRequired="True" ErrorText="请填写密码"></RequiredField>
                                            </ValidationSettings>
                                        </dx:ASPxTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" valign="top" style="padding-top: 4px; margin-top: 4px">
                                        确认密码：
                                    </td>
                                    <td valign="top">
                                        <dx:ASPxTextBox ID="txt_PasswordAgain" runat="server" ClientInstanceName="txt_PasswordAgain"
                                            Width="150px" Password="True">
                                            <ClientSideEvents Validation="function(s, e) {
	if(txt_Password.GetText()==txt_PasswordAgain.GetText())
{
  e.isValid=true;
}
else
{
  e.isValid=false;
  e.errorText=&quot;密码和确认密码不一致&quot;;
}
}" />
<ClientSideEvents Validation="function(s, e) {
	if(txt_Password.GetText()==txt_PasswordAgain.GetText())
{
  e.isValid=true;
}
else
{
  e.isValid=false;
  e.errorText=&quot;密码和确认密码不一致&quot;;
}
}"></ClientSideEvents>

                                            <ValidationSettings ErrorTextPosition="Bottom">
                                            </ValidationSettings>
                                        </dx:ASPxTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style4" colspan="2" align="center">
                                        <dx:ASPxLabel ID="lblResult" runat="server" ForeColor="Red" ClientInstanceName="lblResult">
                                            <ClientSideEvents Click="function(s, e) {
	ChangPassword.Show();
}" />
<ClientSideEvents Click="function(s, e) {
	ChangPassword.Show();
}"></ClientSideEvents>
                                        </dx:ASPxLabel>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2">
                                        <table width="160">
                                            <tr>
                                                <td>
                                                    <dx:ASPxButton ID="btn_Save" runat="server" OnCommand="btn_Save_Command" Text="保存"
                                                        Width="60px">
                                                        <ClientSideEvents Click="function(s, e) {
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
}"></ClientSideEvents>
                                                    </dx:ASPxButton>
                                                </td>
                                                <td>
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
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                            <dx:ASPxCallback ID="ASPxCallback1" runat="server" ClientInstanceName="ASPxCallback1">
                                <ClientSideEvents CallbackComplete="function(s, e) {
	ASPxLoadingPanel1.Hide();
}" />
                                <ClientSideEvents CallbackComplete="function(s, e) {
	ASPxLoadingPanel1.Hide();
}" CallbackError="function(s, e) {
	ASPxLoadingPanel1.Hide();
}" EndCallback="function(s, e) {
		ASPxLoadingPanel1.Hide();
}" />
<ClientSideEvents CallbackComplete="function(s, e) {
	ASPxLoadingPanel1.Hide();
}" EndCallback="function(s, e) {
		ASPxLoadingPanel1.Hide();
}" CallbackError="function(s, e) {
	ASPxLoadingPanel1.Hide();
}"></ClientSideEvents>
                            </dx:ASPxCallback>
                            <dx:ASPxLoadingPanel ID="ASPxLoadingPanel1" runat="server" ClientInstanceName="ASPxLoadingPanel1"
                                CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" HorizontalAlign="Center"
                                ImagePosition="Top" VerticalAlign="Middle">
                                <Image Url="~/App_Themes/Aqua/Web/Loading.gif">
                                </Image>
                            </dx:ASPxLoadingPanel>
                        </dx:PopupControlContentControl>
                    </ContentCollection>
                </dx:ASPxPopupControl>
                <dx:ASPxCallback ID="ASPxCallback2" runat="server">
                </dx:ASPxCallback>
                <dx:ASPxLoadingPanel ID="ASPxLoadingPanel2" runat="server">
                </dx:ASPxLoadingPanel>
            </div>
        </div>
        </div>
        <center style="font-size: 12px">
            <br />版权说明
            <br />版权说明</center>
    </form>
</body>
</html>
