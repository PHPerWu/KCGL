<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>

<body style="background-image: url(./Content/Images/bg_3.gif)">
    <form id="Form1" runat="server">
    <table width="100%" height="100%" cellspacing="0" cellpadding="0" bordercolor="#bed1eb"
        border="0" style="border-collapse: collapse">
        <tbody>
            <tr>
                <td valign="middle" align="center">
                    <table width="555" height="312" style=" margin-top:12%;" cellspacing="0" cellpadding="0" border="0">
                        <tbody valign="middle">
                            <tr>
                                <td valign="middle" height="312" background="./Content/Images/kk.jpg" align="center">
                                    <table width="280" cellspacing="0" cellpadding="0" border="0" class="notice-text">
                                        <tbody>
                                          
                                            <tr align="right">
                                                <td width="79" height="30" align="right" colspan="2" 
                                                    style="height: 70px; padding-left: 120px;">
                                                    &nbsp;&nbsp;
                                                    <asp:Login ID="Login1" runat="server" BorderPadding="4" BorderStyle="None" Font-Names="宋体"
                                                        Font-Size="Small" ForeColor="#333333" TitleText="" Width="350px" 
                                                        DestinationPageUrl="Default.aspx" >
                                                        <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
                                                        <LayoutTemplate>
                                                            <table cellpadding="4"  cellspacing="0" style="border-collapse: collapse;">
                                                                <tr>
                                                                    <td>
                                                                        <table cellpadding="0" style="width: 300px;">
                                                                            <tr>
                                                                                <td align="right" height="30">
                                                                                    &nbsp;</td>
                                                                                <td height="30">
                                                                                    &nbsp;</td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="right" height="30">
                                                                                    登陆账号&nbsp; 
                                                                                </td>
                                                                                <td height="30" align="left">
                                                                                    <asp:TextBox ID="UserName" runat="server" Font-Size="0.8em" Width="150px"></asp:TextBox>
                                                                                    <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" 
                                                                                        ControlToValidate="UserName" ErrorMessage="必须填写“用户名”。" ForeColor="Red" 
                                                                                        ToolTip="必须填写“用户名”。" ValidationGroup="Login1">*请输入</asp:RequiredFieldValidator>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="right" height="30">
                                                                                    密&nbsp;码 &nbsp; </td>
                                                                                <td height="30" align="left">
                                                                                    <asp:TextBox ID="Password" runat="server" Font-Size="0.8em" TextMode="Password" 
                                                                                        Width="150px"></asp:TextBox>
                                                                                    <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password"
                                                                                        ErrorMessage="必须填写“密码”。" ToolTip="必须填写“密码”。" ValidationGroup="Login1"  ForeColor="Red">*请输入</asp:RequiredFieldValidator>
                                                                                </td>
                                                                            </tr>
                                                                          
                                                                            <tr>
                                                                                <td align="center" colspan="2" style="color: Red;"  height="30">
                                                                                    <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="center" colspan="2"  height="30">
                                                                                <div class="container-fluid">
	<div class="row-fluid">
		<div class="span12">
			                                                                                     <asp:Button ID="LoginButton" runat="server" BackColor="White" BorderColor="#507CD1"
                                                                                        BorderStyle="Solid" BorderWidth="1px" CommandName="Login" Font-Names="宋体"
                                                                                        Font-Size="Small" ForeColor="#284E98" CssClass="LoginButton btn"  Text="登录" ValidationGroup="Login1" />
		</div>
	</div>
</div>


                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </LayoutTemplate>
                                                        <LoginButtonStyle BackColor="White"  BorderColor="#507CD1" BorderStyle="Solid" BorderWidth="1px"
                                                            Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284E98" />
                                                        <TextBoxStyle Font-Size="0.8em" />
                                                        <TitleTextStyle BackColor="#507CD1" Font-Bold="True" Font-Size="0.9em" ForeColor="White" />
                                                    </asp:Login>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td valign="bottom" height="30" align="center" style="line-height:25px;">
                                    <span class="style1">系统要求:1024*768分辩率,浏览器IE8.0以上,禁用所有弹出窗口拦截程序</span><br 
                                        class="style1">
                                    <span class="style1">主管单位：湖北大学 招生就业办公室</span><br class="style1">
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </td>
            </tr>
        </tbody>
    </table>
    </form>
</body>
</html>
