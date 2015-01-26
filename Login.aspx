<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 132px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <div class="b d1 k">
                                                            <font size="4" style="margin: 0px 10px;"><strong>登陆</strong>
                                                                <asp:Login ID="Login1" runat="server" BackColor="#F7F8F9" 
                                                                BorderColor="#E6E2D8" BorderStyle="Solid"
                                                                    BorderWidth="0px" Font-Names="宋体" Font-Size="13px" BorderPadding="4" Height="150px"
                                                                    PasswordLabelText="密码：" TitleText="" UserNameLabelText="用户名：" 
                                                                Width="200px" ForeColor="#999999" DestinationPageUrl="Default.aspx">
                                                                    <CheckBoxStyle Font-Size="12px" />
                                                                    <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
                                                                    <LabelStyle Font-Size="12px" />
                                                                    <LayoutTemplate>
                                                                        <table cellpadding="4" cellspacing="0" style="border-collapse: collapse;">
                                                                            <tr>
                                                                                <td>
                                                                                    <table cellpadding="0" style="height: 150px; width: 200px;">
                                                                                        <caption>
                                                                                            <br />
                                                                                            <tr>
                                                                                                <td align="right" valign="middle" width="100px">
                                                                                                    <font size="4">
                                                                                                    <asp:Image ID="Image3" runat="server" ImageUrl="~/image/user.png" />
                                                                                                    </font>
                                                                                                    <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">用户名：</asp:Label>
                                                                                                </td>
                                                                                                <td class="style1" valign="middle">
                                                                                                    <asp:TextBox ID="UserName" runat="server" Font-Size="12px" Height="15px" 
                                                                                                        Width="82px"></asp:TextBox>
                                                                                                    <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" 
                                                                                                        ControlToValidate="UserName" ErrorMessage="必须填写“用户名”。" ForeColor="#FF3300" 
                                                                                                        ToolTip="必须填写“用户名”。" ValidationGroup="Login">*</asp:RequiredFieldValidator>
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td align="right" valign="middle">
                                                                                                    <font size="4">
                                                                                                    <asp:Image ID="Image2" runat="server" ImageUrl="~/image/key.png" />
                                                                                                    </font>
                                                                                                    <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">密&nbsp;码：</asp:Label>
                                                                                                </td>
                                                                                                <td class="style1" valign="middle">
                                                                                                    <asp:TextBox ID="Password" runat="server" Font-Size="12px" Height="15px" 
                                                                                                        TextMode="Password" Width="82px"></asp:TextBox>
                                                                                                    <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" 
                                                                                                        ControlToValidate="Password" ErrorMessage="必须填写“密码”。" ForeColor="#FF3300" 
                                                                                                        ToolTip="必须填写“密码”。" ValidationGroup="Login">*</asp:RequiredFieldValidator>
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td colspan="2" style="font-size: 12px;">
                                                                                                    <asp:CheckBox ID="RememberMe" runat="server" Text="下次记住我。" />
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td align="center" colspan="2" style="color: Red;">
                                                                                                    <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td align="right" colspan="2">
                                                                                                    <asp:Button ID="LoginButton" runat="server" BackColor="White" 
                                                                                                        BorderColor="#C5BBAF" BorderStyle="Solid" BorderWidth="1px" CommandName="Login" 
                                                                                                        CssClass="btnstyle" Font-Names="Verdana" Font-Size="12px" ForeColor="Black" 
                                                                                                        Text="登录" ValidationGroup="Login" Width="50px" />
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td colspan="2">
                                                                                                    <table width="100%">
                                                                                                        <tr>
                                                                                                            <td>
                                                                                                                <a href="http://jwxt.hubu.edu.cn/" target="_blank">
                                                                                                                <asp:Image ID="imgbtn_jwxt" runat="server" Height="26px" 
                                                                                                                    ImageUrl="~/image/教务系统.jpg" Width="105px" />
                                                                                                                </a>
                                                                                                                <%-- <asp:ImageButton ID="imgbtn_jwxt" runat="server" ImageUrl="~/image/教务系统.jpg" PostBackUrl="http://jwc.hubu.edu.cn/"
                                                                                                                 />--%>
                                                                                                            </td>
                                                                                                            <td>
                                                                                                                <a href="http://jwxt.hubu.edu.cn/tkglAction.do?method=wztzkb&amp;fs=?&amp;selectUrl=" 
                                                                                                                    target="_blank">
                                                                                                                <asp:Image ID="Image1" runat="server" Height="26px" ImageUrl="~/image/课表查询.jpg" 
                                                                                                                    Width="105px" />
                                                                                                                </a>
                                                                                                                <%--<asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/image/课表查询.jpg" PostBackUrl="http://jwc.hubu.edu.cn/"
                                                                                                                Width="105px" Height="26px" />--%>
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                    </table>
                                                                                                </td>
                                                                                            </tr>
                                                                                        </caption>
                                                                                    </table>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </LayoutTemplate>
                                                                    <LoginButtonStyle BackColor="White" BorderColor="#C5BBAF" BorderStyle="Solid" BorderWidth="1px"
                                                                        Font-Names="Verdana" CssClass="btnstyle" Font-Size="12px" ForeColor="Black" Width="50px" />
                                                                    <TextBoxStyle Font-Size="12px" Height="15px" Width="120px" />
                                                                    <TitleTextStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="#FFFFFF" Font-Size="0.9em" />
                                                                    <ValidatorTextStyle ForeColor="#FF3300" />
                                                                </asp:Login>
                                                            </font>
                                                        </div>
    </div>
    </form>
</body>
</html>
