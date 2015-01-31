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
        .style2
        {
            width: 255px;
        }
        .style3
        {
            width: 250px;
        }
        .style4
        {
            width: 16px;
        }
    </style>
    </head>
<body>
    <form id="form1" runat="server" enctype="multipart/form-data">
    <div>
    
        <table class="style1">
            <tr>
                <td class="style4">
                    &nbsp;</td>
                <td class="style2">
    
        <dx:ASPxImage ID="lunbo1" runat="server" ShowLoadingImage="true">
        </dx:ASPxImage>
                    <br />
                    <asp:FileUpload ID="upload1" runat="server" />
                    <br />
                    图片链接：<dx:ASPxTextBox ID="txtUpload1" runat="server" Width="170px">
                    </dx:ASPxTextBox>
                    <dx:ASPxButton ID="btnUpload1" runat="server" onclick="btnUpload1_Click" 
                        Text="ASPxButton">
                    </dx:ASPxButton>
                </td>
                 <td>
                    &nbsp;</td>
                <td class="style3">
                    <dx:ASPxImage ID="lunbo2" runat="server" ShowLoadingImage="true">
                    </dx:ASPxImage>
                    <br />
                    <asp:FileUpload ID="upload2" runat="server" />
                    <br />
                    图片链接：<dx:ASPxTextBox ID="txtUpload2" runat="server" Width="170px">
                    </dx:ASPxTextBox>
                    <dx:ASPxButton ID="btnUpload2" runat="server" Text="ASPxButton" 
                        onclick="btnUpload2_Click">
                    </dx:ASPxButton>
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style4">
                    &nbsp;</td>
                <td class="style2">
                    &nbsp;</td>
                     <td>
                    &nbsp;</td>
                <td class="style3">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style4">
                    &nbsp;</td>
                <td class="style2">
                    &nbsp;</td>
                     <td>
                    &nbsp;</td>
                <td class="style3">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style4">
                    &nbsp;</td>
                <td class="style2">
                    <dx:ASPxImage ID="lunbo3" runat="server" ShowLoadingImage="true">
                    </dx:ASPxImage>
                    <br />
                    <asp:FileUpload ID="upload3" runat="server" />
                    <br />
                   图片链接： <dx:ASPxTextBox ID="txtUpload3" runat="server" Width="170px">
                    </dx:ASPxTextBox>
                    <dx:ASPxButton ID="btnUpload3" runat="server" Text="ASPxButton" 
                        onclick="btnUpload3_Click">
                    </dx:ASPxButton>
                </td>
                 <td>
                    &nbsp;</td>
                <td class="style3">
                    <dx:ASPxImage ID="lunbo4" runat="server" ShowLoadingImage="true">
                    </dx:ASPxImage>
                    <br />
                    <asp:FileUpload ID="upload4" runat="server" />
                    <br />
                   图片链接： <dx:ASPxTextBox ID="txtUpload4" runat="server" Width="170px">
                    </dx:ASPxTextBox>
                    <dx:ASPxButton ID="btnUpload4" runat="server" Text="ASPxButton" 
                        onclick="btnUpload4_Click">
                    </dx:ASPxButton>
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
