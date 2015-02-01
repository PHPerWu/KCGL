<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ImageManager.aspx.cs" Inherits="CollegeManager_TeacherFamous" %>

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
    <script type="text/javascript">
        function show(name, path) {
            alert("修改成功");
            name.src = path;

        }
        function showTXT1(src) {

            document.getElementById("txtUpload1").value = src;
            

        }
        function showTXT2(src) {

            document.getElementById("txtUpload2").value = src;

        }
        function showTXT3(src) {

            document.getElementById("txtUpload3").value = src;

        }

      
        function sendtxt1(str)
        {
            document.getElementById("hide1").value = str;
            
        }
        function sendtxt2(str)
        {
            document.getElementById("hide2").value = str;
           
        }
        function sendtxt3(str)
        {
            document.getElementById("hide3").value = str;
            
        }
</script>
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
        #hide1,#hide2,#hide3,#hide4
        {
            display:none;
            }
        .style1
        {
            width: 400px;
        }
        .style2
        {
            width: 400px;
        }
        .style3
        {
            width:400px;
        }
        .style4
        {
            width: 400px;
        }
        .style5
        {
            width:400px;
        }
    </style>
    </head>
<body>
    <form id="form1" runat="server">
    <div>
        <table class="style1">
            <tr>
                <td class="style4">
                    &nbsp;</td>
                <td class="style2">
                    <b>MOOC</b>
                     <br /> <br /><dx:ASPxImage ID="lunbo1" runat="server" ShowLoadingImage="true" 
                        Height="192px" Width="220px">
        </dx:ASPxImage><br /><a style="color:Red">请将图片裁剪成200*230 px上传</a>
                    <br /> <br />
                    <asp:FileUpload ID="upload1" runat="server" />
                    <br /> <br />
                    图片链接：<asp:TextBox ID="txtUpload1" onkeyup="sendtxt1(this.value)" runat="server"></asp:TextBox>
                    <dx:ASPxButton ID="btnUpload1" runat="server" onclick="btnUpload1_Click" 
                        Text="更新">
                    </dx:ASPxButton>
                </td>
                 <td class="style5">
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     &nbsp;</td>
                <td class="style3">
                   
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp; <b>视频公开课</b> <br /> <br /><dx:ASPxImage ID="lunbo2" runat="server" 
                        ShowLoadingImage="true" Height="192px" Width="220px">
                    </dx:ASPxImage><br /><a style="color:Red">请将图片裁剪成200*230 px上传</a>
                    <br /> <br />
                    <asp:FileUpload ID="upload2" runat="server" />
                    <br /> <br />
                    图片链接：<asp:TextBox ID="txtUpload2" onkeyup="sendtxt2(this.value)" runat="server"></asp:TextBox>
                    <dx:ASPxButton ID="btnUpload2" runat="server" Text="更新" 
                        onclick="btnUpload2_Click">
                    </dx:ASPxButton></td>
            </tr>
            <tr>
                <td class="style4">
                    &nbsp;</td>
                <td class="style2">
                    &nbsp;</td>
                     <td class="style5">
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
                     <td class="style5">
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
                    <b>资源共享课</b> <br /> <br /><dx:ASPxImage ID="lunbo3" runat="server" 
                        ShowLoadingImage="true" Height="192px" Width="220px">
                    </dx:ASPxImage><br /><a style="color:Red">请将图片裁剪成200*230 px上传</a>
                    <br /> <br />
                    <asp:FileUpload ID="upload3" runat="server" />
                    <br /> <br />
                   图片链接：  
                    <asp:TextBox ID="txtUpload3" onkeyup="sendtxt3(this.value)" runat="server"></asp:TextBox>
                    <dx:ASPxButton ID="btnUpload3" runat="server" Text="更新" 
                        onclick="btnUpload3_Click">
                    </dx:ASPxButton>
                </td>
                 <td class="style5">
                     &nbsp;</td>
                <td class="style3">
                    <br />
                
                    <br />
                    <asp:TextBox ID="hide1" runat="server"></asp:TextBox>
                    <asp:TextBox ID="hide2" runat="server"></asp:TextBox>
                    <asp:TextBox ID="hide3" runat="server"></asp:TextBox>
                    <asp:TextBox ID="hide4" runat="server"></asp:TextBox>
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
