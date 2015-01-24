<%@ Page Language="C#" AutoEventWireup="true" CodeFile="VideoManage.aspx.cs" Inherits="VideoManage" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxUploadControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxHtmlEditor.v13.2, Version=13.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxHtmlEditor" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxSpellChecker.v13.2, Version=13.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxSpellChecker" TagPrefix="dx" %>
<%@ Register Assembly="Brettle.Web.NeatUpload" Namespace="Brettle.Web.NeatUpload"
    TagPrefix="Upload" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>精品视频管理</title>
    <script type="text/javascript">
        function ToggleVisibility(id, type) {
            var el = document.getElementById(id);
            if (el.style) {
                if (type == 'on') {
                    el.style.display = 'block';
                }
                else {
                    el.style.display = 'none';
                }
            }
            else {
                if (type == 'on') {
                    el.display = 'block';
                }
                else {
                    el.display = 'none';
                }
            }
        } 
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table style="width: 100%;">
            <tr>
                <td align="center">
                    <dx:ASPxGridView ID="gv_JPKC" runat="server" AutoGenerateColumns="False" DataSourceID="odsJPKC"
                        KeyFieldName="课程代码" Width="80%" OnDetailRowExpandedChanged="gv_Video_DetailRowExpandedChanged">
                        <Columns>
                            <dx:GridViewDataTextColumn FieldName="课程代码" VisibleIndex="0">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="开课学期" VisibleIndex="3">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="课程性质" Visible="False" VisibleIndex="4">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="课程类别" Visible="False" VisibleIndex="5">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="先修课程" Visible="False" VisibleIndex="6">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="使用教材" Visible="False" VisibleIndex="7">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="双学位课程" Visible="False" VisibleIndex="8">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="总学时" VisibleIndex="9">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="讲授学时" Visible="False" VisibleIndex="10">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="实践学时" Visible="False" VisibleIndex="11">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="精品视频公开课" Visible="False" VisibleIndex="12">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="精品课程网址" Visible="False" VisibleIndex="13">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="开课学院" Visible="False" VisibleIndex="14">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="课程名称" VisibleIndex="1">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="后续课程" Visible="False" VisibleIndex="15">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="课程学分" Visible="False" VisibleIndex="16">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="考核方式" Visible="False" VisibleIndex="17">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="教学方式" Visible="False" VisibleIndex="18">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="主要参考书目" Visible="False" VisibleIndex="19">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="精品资源共享课" Visible="False" VisibleIndex="20">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="评分" Visible="False" VisibleIndex="21">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="已评分人数" Visible="False" VisibleIndex="22">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="实验学时" Visible="False" VisibleIndex="23">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="课程点击量" Visible="False" VisibleIndex="24">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="课程级别" Visible="False" VisibleIndex="25">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="面向对象" Visible="False" VisibleIndex="26">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="立项级别" VisibleIndex="43">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="立项年度" VisibleIndex="44">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="课程负责人" Visible="False" VisibleIndex="28">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="课程图片" Visible="False" VisibleIndex="29">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="课程描述" Visible="False" VisibleIndex="30">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="喜欢" Visible="False" VisibleIndex="31">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="一般喜欢" Visible="False" VisibleIndex="32">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="不喜欢" Visible="False" VisibleIndex="33">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataDateColumn FieldName="创建时间" Visible="False" VisibleIndex="34">
                            </dx:GridViewDataDateColumn>
                            <dx:GridViewDataTextColumn FieldName="创建人" Visible="False" VisibleIndex="35">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="教学方式名" Visible="False" VisibleIndex="36">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="考核方式名" Visible="False" VisibleIndex="37">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="课程性质" FieldName="课程性质名" VisibleIndex="38">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="课程类别" FieldName="课程类别名" VisibleIndex="39">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="课程级别" FieldName="课程级别名" VisibleIndex="40">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="面向对象" FieldName="面向对象名" VisibleIndex="27">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="开课学院" FieldName="开课学院名" VisibleIndex="2">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="先修课程名称" Visible="False" VisibleIndex="41">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="后续课程名称" Visible="False" VisibleIndex="42">
                            </dx:GridViewDataTextColumn>
                        </Columns>
                        <SettingsBehavior AllowDragDrop="False" AllowSort="False" ConfirmDelete="True" />
                        <Settings ShowTitlePanel="True" />
                        <SettingsText CommandCancel="[取消]" CommandEdit="[编辑]" CommandNew="[新增]" CommandUpdate="[确定]"
                            Title="精品课程视频管理" ConfirmDelete="确认删除吗？" CommandDelete="[删除]" />
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
                                            <dx:ASPxButton ID="btnVideo" runat="server" AutoPostBack="False" Text="新增视频">
                                                <ClientSideEvents Click="function(s, e) {
	gv_Video.AddNewRow();
}" />
                                            </dx:ASPxButton>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <dx:ASPxGridView ID="gv_Video" runat="server" AutoGenerateColumns="False" ClientInstanceName="gv_Video"
                                                DataSourceID="odsSPPath" KeyFieldName="视频ID" Width="100%" OnHtmlEditFormCreated="gv_Video_HtmlEditFormCreated"
                                                OnRowInserting="gv_Video_RowInserting">
                                                <Columns>
                                                    <dx:GridViewCommandColumn Caption="基本操作" VisibleIndex="0">
                                                        <EditButton Visible="True">
                                                        </EditButton>
                                                        <DeleteButton Visible="True">
                                                        </DeleteButton>
                                                    </dx:GridViewCommandColumn>
                                                    <dx:GridViewDataTextColumn VisibleIndex="1" FieldName="视频ID" ReadOnly="True" Visible="False">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="视频名称" VisibleIndex="2">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="视频路径" VisibleIndex="3">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataDateColumn FieldName="视频上传时间" VisibleIndex="4">
                                                    </dx:GridViewDataDateColumn>
                                                    <dx:GridViewDataTextColumn FieldName="视频内容介绍" VisibleIndex="5" Visible="False">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="课程ID" Visible="False" VisibleIndex="6">
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
                                                                    视频名称：
                                                                </td>
                                                                <td align="left" colspan="2">
                                                                    <dx:ASPxTextBox ID="txtName" runat="server" Text='<%# Bind("视频名称") %>' Width="280px">
                                                                        <ValidationSettings>
                                                                            <RequiredField ErrorText="请填写" IsRequired="True" />
                                                                        </ValidationSettings>
                                                                    </dx:ASPxTextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    选择视频：
                                                                </td>
                                                                <td align="left">
                                                                    <Upload:InputFile runat="server" ID="AttachFile" BackColor="#B6D6FF" ToolTip="请选择视频文件！"
                                                                        Width="280px"></Upload:InputFile>
                                                                    <br />
                                                                    <asp:Label ID="Label1" runat="server" Font-Size="12px" ForeColor="Red" Text="【当前支持视频文件类型：mp4,flv,f4v】"
                                                                        Width="400px"></asp:Label>
                                                                    <div id="ProgressBar">
                                                                        <Upload:ProgressBar runat='server' ID="pbProgressBar" Style="display: none;" Width="500px"
                                                                            Height="100px" AllowTransparency="False">
                                                                        </Upload:ProgressBar>
                                                                    </div>
                                                                </td>
                                                                <td align="left" width="100px">
                                                                    <asp:Label ID="lblTip" runat="server" Font-Size="14px" ForeColor="Red" Text="Label"
                                                                        Visible="False"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="right">
                                                                    相关图片：</td>
                                                                <td colspan="2" align="left">
                                                                    <Upload:InputFile runat="server" ID="AttachFilePic" BackColor="#B6D6FF" ToolTip="请选择图片文件！"
                                                                        Width="280px"></Upload:InputFile>
                                                                    <br />
                                                                    <dx:ASPxLabel ID="lblTip0" runat="server" ForeColor="Red" Text="【若没有可不上传】【支持图片格式：jpg,jpeg,png,gif】"
                                                                        Theme="Aqua">
                                                                    </dx:ASPxLabel>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    视频简介：
                                                                </td>
                                                                <td colspan="2">
                                                                    &nbsp;
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="3">
                                                                    <dx:ASPxHtmlEditor ID="htmlVideoIntro" runat="server" Html='<%# Bind("视频内容介绍") %>'>
                                                                    </dx:ASPxHtmlEditor>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="center" colspan="3">
                                                                    &nbsp;
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="center" colspan="3">
                                                                    <table width="180">
                                                                        <tr>
                                                                            <td>
                                                                                <asp:Button ID="btnSave" runat="server" Text="保存" OnClientClick="ToggleVisibility('ProgressBar','on')"
                                                                                    BackColor="#D6E7FF" Height="25px" Width="60px" 
                                                                                    CommandArgument="<%# Container.VisibleIndex %>" oncommand="btnSave_Click"/>
                                                                            </td>
                                                                            <td>
                                                                                <dx:ASPxButton ID="btnCancel" runat="server" AutoPostBack="False" Text="取消" CausesValidation="False"
                                                                                    Width="60px">
                                                                                    <ClientSideEvents Click="function(s, e) {
	gv_Video.CancelEdit();
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
                    <asp:ObjectDataSource ID="odsJPKC" runat="server" OldValuesParameterFormatString="original_{0}"
                        SelectMethod="GetDataJPKC" TypeName="MainDataSetTableAdapters.VI_KCINFOTableAdapter">
                    </asp:ObjectDataSource>
                    <asp:ObjectDataSource ID="odsSPPath" runat="server" OldValuesParameterFormatString="original_{0}"
                        SelectMethod="GetData" TypeName="MainDataSetTableAdapters.TA_课程视频表TableAdapter"
                        DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update">
                        <DeleteParameters>
                            <asp:Parameter Name="Original_视频ID" Type="String" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="视频名称" Type="String" />
                            <asp:Parameter Name="视频路径" Type="String" />
                            <asp:Parameter Name="视频上传时间" Type="DateTime" />
                            <asp:Parameter Name="视频内容介绍" Type="String" />
                            <asp:Parameter Name="课程ID" Type="String" />
                            <asp:Parameter Name="图片路径" Type="String" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:SessionParameter DefaultValue="-1" Name="课程ID" SessionField="课程代码" Type="String" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="视频名称" Type="String" />
                            <asp:Parameter Name="视频路径" Type="String" />
                            <asp:Parameter Name="视频上传时间" Type="DateTime" />
                            <asp:Parameter Name="视频内容介绍" Type="Object" />
                            <asp:Parameter Name="课程ID" Type="String" />
                            <asp:Parameter Name="图片路径" Type="String" />
                            <asp:Parameter Name="点击量" Type="Decimal" />
                            <asp:Parameter Name="备用1" Type="String" />
                            <asp:Parameter Name="备用2" Type="String" />
                            <asp:Parameter Name="Original_视频ID" Type="String" />
                        </UpdateParameters>
                    </asp:ObjectDataSource>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
