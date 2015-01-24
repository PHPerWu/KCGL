<%@ Page Language="C#" AutoEventWireup="true" CodeFile="NewsManage.aspx.cs" Inherits="SYS_NewsManage" %>

<%@ Register Assembly="DevExpress.Web.ASPxHtmlEditor.v13.2, Version=13.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxHtmlEditor" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxLoadingPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxSpellChecker.v13.2, Version=13.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxSpellChecker" tagprefix="dx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script language="javascript" type="text/javascript" src="../Scripts/GridViewJs/gridView.js"></script>
    <script type="text/javascript">
        function confirmDel(index) {
            if (confirm('确认删除此则新闻？')) {
                cl_gvNews.DeleteRow(index);
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <center>
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <dx:ASPxLoadingPanel ID="ldpalLoading" runat="server" ClientInstanceName="cl_ldpalLoading"
                        HorizontalAlign="Center" Text="加载中&amp;hellip;" VerticalAlign="Middle">
                    </dx:ASPxLoadingPanel>
                    <table width="90%">
                        <tr>
                            <td>
                                <table width="100%">
                                    <tr>
                                        <td align="left">
                                            <font size="4"><strong>湖北大学课程中心新闻公告栏管理</strong>
                                        </td>
                                        <td align="right">
                                            <dx:ASPxButton ID="btnAddNews" runat="server" CausesValidation="False" Text="新增新闻"
                                                ToolTip="新增一则新闻" Width="80px">
                                                <ClientSideEvents Click="function(s, e) { cl_gvNews.AddNewRow();e.processOnServer = false;}" />
                                            </dx:ASPxButton>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <hr />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <dx:ASPxGridView ID="gvNews" runat="server" AutoGenerateColumns="False" DataSourceID="odsNews"
                                    KeyFieldName="新闻ID" Width="100%" ClientInstanceName="cl_gvNews" 
                                    onrowinserting="gvNews_RowInserting" onrowupdating="gvNews_RowUpdating" 
                                    Theme="Glass">
                                    <SettingsPager AllButton-Visible="True">
                                        <AllButton Visible="True">
                                            <Image ToolTip="显示全部">
                                            </Image>
                                        </AllButton>
                                        <FirstPageButton Visible="True">
                                            <Image AlternateText="首页" ToolTip="首页">
                                            </Image>
                                        </FirstPageButton>
                                        <LastPageButton Visible="True">
                                            <Image AlternateText="尾页" ToolTip="尾页">
                                            </Image>
                                        </LastPageButton>
                                        <NextPageButton>
                                            <Image AlternateText="下一页" ToolTip="下一页">
                                            </Image>
                                        </NextPageButton>
                                        <PrevPageButton>
                                            <Image AlternateText="上一页" ToolTip="上一页">
                                            </Image>
                                        </PrevPageButton>
                                    </SettingsPager>
                                    <Columns>
                                        <dx:GridViewDataTextColumn VisibleIndex="6" Caption="操作">
                                            <DataItemTemplate>
                                                <dx:ASPxButton ID="btnDelete" runat="server" Text="删除" Width="50px" ToolTip="删除此条公告"
                                                    CausesValidation="False" ClientSideEvents-Click='<%# "function(s, e) {confirmDel(" + Container.VisibleIndex + ");e.processOnServer = false;}" %>'>
                                                </dx:ASPxButton>
                                            </DataItemTemplate>
                                            <CellStyle HorizontalAlign="Center">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn VisibleIndex="0" Caption="序号">
                                            <DataItemTemplate>
                                                <%# Container.ItemIndex+1%>
                                            </DataItemTemplate>
                                            <CellStyle HorizontalAlign="Center">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="发布" VisibleIndex="1">
                                            <DataItemTemplate>
                                                <dx:ASPxButton ID="btnPublish" runat="server" CausesValidation="False" CommandArgument='<%# Eval("新闻ID") %>'
                                                    Enabled='<%# Eval("是否发布").ToString().Equals("1") %>' OnCommand="btnPublish_Command"
                                                    Text="发布" ToolTip="发布当前新闻" Width="50px">
                                                    <ClientSideEvents Click="function(s, e) {if (confirm('发布此则新闻吗？')) {
        cl_ldpalLoading.Show();
        e.processOnServer = true;
    }
    else {
        e.processOnServer = false;
    }}" />
                                                </dx:ASPxButton>
                                            </DataItemTemplate>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <CellStyle HorizontalAlign="Center">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="新闻标题" ShowInCustomizationForm="True" VisibleIndex="1"
                                            Width="45%">
                                            <Settings FilterMode="DisplayText" />
                                            <DataItemTemplate>
                                                <dx:ASPxHyperLink ID="LinkButton1" runat="server" Cursor="pointer" Text='<%# Eval("新闻标题").ToString().Length < 20 ? Eval("新闻标题"):Eval("新闻标题").ToString().Substring(0,20) + "..." %>'
                                                    ToolTip='<%# "[点击进行编辑] " + Eval("新闻标题") %>' Font-Size="Medium" Font-Underline="False" 
                                                    ClientSideEvents-Click='<%# "function(s, e) {cl_gvNews.StartEditRow(" + Container.VisibleIndex + ");e.processOnServer = false;}" %>' />
                                            </DataItemTemplate>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <CellStyle HorizontalAlign="Left">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="发布者" ShowInCustomizationForm="True" VisibleIndex="2"
                                            Width="15%">
                                            <CellStyle HorizontalAlign="Center">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataDateColumn FieldName="发布时间" ShowInCustomizationForm="True" VisibleIndex="3"
                                            Width="10%">
                                            <PropertiesDateEdit DisplayFormatString="yyyy-MM-dd" NullDisplayText="未发布">
                                            </PropertiesDateEdit>
                                            <CellStyle HorizontalAlign="Center">
                                            </CellStyle>
                                        </dx:GridViewDataDateColumn>
                                        <dx:GridViewDataDateColumn FieldName="最后更新时间" ShowInCustomizationForm="True" VisibleIndex="5"
                                            Width="10%">
                                            <PropertiesDateEdit DisplayFormatString="yyyy-MM-dd">
                                            </PropertiesDateEdit>
                                            <CellStyle HorizontalAlign="Center">
                                            </CellStyle>
                                        </dx:GridViewDataDateColumn>
                                    </Columns>
                                    <SettingsBehavior AllowDragDrop="False" AllowGroup="False" AllowSort="False" />
                                    <Settings ShowFilterRow="True" ShowFilterRowMenu="True" />
                                    <Styles>
                                        <Cell ForeColor="Black" HorizontalAlign="Left" VerticalAlign="Middle">
                                        </Cell>
                                        <Header HorizontalAlign="Center">
                                        </Header>
                                        <AlternatingRow Enabled="True">
                                        </AlternatingRow>
                                    </Styles>
                                    <Templates>
                                        <EditForm>
                                            <table width="100%">
                                                <tr>
                                                    <td align="right" width="8%">
                                                        标题：
                                                    </td>
                                                    <td align="left">
                                                        <dx:ASPxTextBox ID="txtTitle" runat="server" Font-Bold="True" Font-Size="Large" ToolTip="请填写新闻标题"
                                                            Width="100%" ClientInstanceName="cl_txtTitle" NullText="必填" 
                                                            Text='<%# Bind("新闻标题") %>'>
                                                            <ValidationSettings Display="Dynamic" SetFocusOnError="True" ValidationGroup="btnSaveNews">
                                                                <RequiredField ErrorText="不能为空" IsRequired="True" />
                                                            </ValidationSettings>
                                                        </dx:ASPxTextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" valign="top">
                                                        正文：
                                                    </td>
                                                    <td align="left">
                                                        <dx:ASPxHtmlEditor ID="hedNews" runat="server" Html='<%# Bind("新闻内容") %>'
                                                            ClientInstanceName="cl_hedNews" Width="100%" Font-Names="宋体" Font-Size="10pt">
                                                            <Toolbars>
                                                                <dx:HtmlEditorToolbar Name="StandardToolbar1">
                                                                    <Items>
                                                                        <dx:ToolbarCutButton>
                                                                        </dx:ToolbarCutButton>
                                                                        <dx:ToolbarCopyButton>
                                                                        </dx:ToolbarCopyButton>
                                                                        <dx:ToolbarPasteButton>
                                                                        </dx:ToolbarPasteButton>
                                                                        <dx:ToolbarPasteFromWordButton>
                                                                        </dx:ToolbarPasteFromWordButton>
                                                                        <dx:ToolbarUndoButton BeginGroup="True">
                                                                        </dx:ToolbarUndoButton>
                                                                        <dx:ToolbarRedoButton>
                                                                        </dx:ToolbarRedoButton>
                                                                        <dx:ToolbarRemoveFormatButton BeginGroup="True">
                                                                        </dx:ToolbarRemoveFormatButton>
                                                                        <dx:ToolbarSuperscriptButton BeginGroup="True">
                                                                        </dx:ToolbarSuperscriptButton>
                                                                        <dx:ToolbarSubscriptButton>
                                                                        </dx:ToolbarSubscriptButton>
                                                                        <dx:ToolbarInsertOrderedListButton BeginGroup="True">
                                                                        </dx:ToolbarInsertOrderedListButton>
                                                                        <dx:ToolbarInsertUnorderedListButton>
                                                                        </dx:ToolbarInsertUnorderedListButton>
                                                                        <dx:ToolbarIndentButton BeginGroup="True">
                                                                        </dx:ToolbarIndentButton>
                                                                        <dx:ToolbarOutdentButton>
                                                                        </dx:ToolbarOutdentButton>
                                                                        <dx:ToolbarInsertLinkDialogButton BeginGroup="True">
                                                                        </dx:ToolbarInsertLinkDialogButton>
                                                                        <dx:ToolbarUnlinkButton>
                                                                        </dx:ToolbarUnlinkButton>
                                                                        <dx:ToolbarInsertImageDialogButton>
                                                                        </dx:ToolbarInsertImageDialogButton>
                                                                        <dx:ToolbarTableOperationsDropDownButton BeginGroup="True">
                                                                            <Items>
                                                                                <dx:ToolbarInsertTableDialogButton BeginGroup="True">
                                                                                </dx:ToolbarInsertTableDialogButton>
                                                                                <dx:ToolbarTablePropertiesDialogButton BeginGroup="True">
                                                                                </dx:ToolbarTablePropertiesDialogButton>
                                                                                <dx:ToolbarTableRowPropertiesDialogButton>
                                                                                </dx:ToolbarTableRowPropertiesDialogButton>
                                                                                <dx:ToolbarTableColumnPropertiesDialogButton>
                                                                                </dx:ToolbarTableColumnPropertiesDialogButton>
                                                                                <dx:ToolbarTableCellPropertiesDialogButton>
                                                                                </dx:ToolbarTableCellPropertiesDialogButton>
                                                                                <dx:ToolbarInsertTableRowAboveButton BeginGroup="True">
                                                                                </dx:ToolbarInsertTableRowAboveButton>
                                                                                <dx:ToolbarInsertTableRowBelowButton>
                                                                                </dx:ToolbarInsertTableRowBelowButton>
                                                                                <dx:ToolbarInsertTableColumnToLeftButton>
                                                                                </dx:ToolbarInsertTableColumnToLeftButton>
                                                                                <dx:ToolbarInsertTableColumnToRightButton>
                                                                                </dx:ToolbarInsertTableColumnToRightButton>
                                                                                <dx:ToolbarSplitTableCellHorizontallyButton BeginGroup="True">
                                                                                </dx:ToolbarSplitTableCellHorizontallyButton>
                                                                                <dx:ToolbarSplitTableCellVerticallyButton>
                                                                                </dx:ToolbarSplitTableCellVerticallyButton>
                                                                                <dx:ToolbarMergeTableCellRightButton>
                                                                                </dx:ToolbarMergeTableCellRightButton>
                                                                                <dx:ToolbarMergeTableCellDownButton>
                                                                                </dx:ToolbarMergeTableCellDownButton>
                                                                                <dx:ToolbarDeleteTableButton BeginGroup="True">
                                                                                </dx:ToolbarDeleteTableButton>
                                                                                <dx:ToolbarDeleteTableRowButton>
                                                                                </dx:ToolbarDeleteTableRowButton>
                                                                                <dx:ToolbarDeleteTableColumnButton>
                                                                                </dx:ToolbarDeleteTableColumnButton>
                                                                            </Items>
                                                                        </dx:ToolbarTableOperationsDropDownButton>
                                                                        <dx:ToolbarExportDropDownButton BeginGroup="True" SelectedItemIndex="1">
                                                                            <Items>
                                                                                <dx:ToolbarExportDropDownItem Format="Rtf" Text="RTF 文件(.rtf)">
                                                                                </dx:ToolbarExportDropDownItem>
                                                                                <dx:ToolbarExportDropDownItem Format="Pdf" Text="PDF 文件(.pdf)">
                                                                                </dx:ToolbarExportDropDownItem>
                                                                                <dx:ToolbarExportDropDownItem Format="Txt" Text="纯文本文件(.txt)">
                                                                                </dx:ToolbarExportDropDownItem>
                                                                                <dx:ToolbarExportDropDownItem Format="Docx" Text="Word 文档(.docx)">
                                                                                </dx:ToolbarExportDropDownItem>
                                                                                <dx:ToolbarExportDropDownItem Format="Odt" Text="OpenDocument 文本(.odt)">
                                                                                </dx:ToolbarExportDropDownItem>
                                                                                <dx:ToolbarExportDropDownItem Format="Mht" Text="单个网页文件(.mht)">
                                                                                </dx:ToolbarExportDropDownItem>
                                                                            </Items>
                                                                        </dx:ToolbarExportDropDownButton>
                                                                        <dx:ToolbarPrintButton>
                                                                        </dx:ToolbarPrintButton>
                                                                        <dx:ToolbarFullscreenButton BeginGroup="True" ToolTip="全屏 (Ctrl+F11)">
                                                                        </dx:ToolbarFullscreenButton>
                                                                    </Items>
                                                                </dx:HtmlEditorToolbar>
                                                                <dx:HtmlEditorToolbar Name="StandardToolbar2">
                                                                    <Items>
                                                                        <dx:ToolbarParagraphFormattingEdit Width="120px" ToolTip="样式" DefaultCaption="(样式)">
                                                                            <Items>
                                                                                <dx:ToolbarListEditItem Text="正文" Value="p" Selected="True" />
                                                                                <dx:ToolbarListEditItem Text="普通" Value="div" />
                                                                                <dx:ToolbarListEditItem Text="地址" Value="address" />
                                                                                <dx:ToolbarListEditItem Text="标题 1" Value="h1" />
                                                                                <dx:ToolbarListEditItem Text="标题 2" Value="h2" />
                                                                                <dx:ToolbarListEditItem Text="标题 3" Value="h3" />
                                                                                <dx:ToolbarListEditItem Text="标题 4" Value="h4" />
                                                                                <dx:ToolbarListEditItem Text="标题 5" Value="h5" />
                                                                                <dx:ToolbarListEditItem Text="标题 6" Value="h6" />
                                                                            </Items>
                                                                        </dx:ToolbarParagraphFormattingEdit>
                                                                        <dx:ToolbarFontNameEdit>
                                                                            <Items>
                                                                                <dx:ToolbarListEditItem Text="宋体" Value="宋体" />
                                                                                <dx:ToolbarListEditItem Text="黑体" Value="黑体" />
                                                                                <dx:ToolbarListEditItem Text="楷体" Value="楷体_GB2312" />
                                                                                <dx:ToolbarListEditItem Text="隶书" Value="隶书" />
                                                                                <dx:ToolbarListEditItem Text="微软雅黑" Value="微软雅黑" />
                                                                                <dx:ToolbarListEditItem Text="Times New Roman" Value="Times New Roman" />
                                                                                <dx:ToolbarListEditItem Text="Tahoma" Value="Tahoma" />
                                                                                <dx:ToolbarListEditItem Text="Verdana" Value="Verdana" />
                                                                                <dx:ToolbarListEditItem Text="Arial" Value="Arial" />
                                                                                <dx:ToolbarListEditItem Text="MS Sans Serif" Value="MS Sans Serif" />
                                                                                <dx:ToolbarListEditItem Text="Courier" Value="Courier" />
                                                                            </Items>
                                                                        </dx:ToolbarFontNameEdit>
                                                                        <dx:ToolbarFontSizeEdit>
                                                                            <Items>
                                                                                <dx:ToolbarListEditItem Text="1 (8pt)" Value="1" />
                                                                                <dx:ToolbarListEditItem Text="2 (10pt)" Value="2" />
                                                                                <dx:ToolbarListEditItem Text="3 (12pt)" Value="3" />
                                                                                <dx:ToolbarListEditItem Text="4 (14pt)" Value="4" />
                                                                                <dx:ToolbarListEditItem Text="5 (18pt)" Value="5" />
                                                                                <dx:ToolbarListEditItem Text="6 (24pt)" Value="6" />
                                                                                <dx:ToolbarListEditItem Text="7 (36pt)" Value="7" />
                                                                            </Items>
                                                                        </dx:ToolbarFontSizeEdit>
                                                                        <dx:ToolbarBoldButton BeginGroup="True" ToolTip="Bold (Ctrl+B)">
                                                                        </dx:ToolbarBoldButton>
                                                                        <dx:ToolbarItalicButton>
                                                                        </dx:ToolbarItalicButton>
                                                                        <dx:ToolbarUnderlineButton>
                                                                        </dx:ToolbarUnderlineButton>
                                                                        <dx:ToolbarStrikethroughButton>
                                                                        </dx:ToolbarStrikethroughButton>
                                                                        <dx:ToolbarJustifyLeftButton BeginGroup="True">
                                                                        </dx:ToolbarJustifyLeftButton>
                                                                        <dx:ToolbarJustifyCenterButton>
                                                                        </dx:ToolbarJustifyCenterButton>
                                                                        <dx:ToolbarJustifyRightButton>
                                                                        </dx:ToolbarJustifyRightButton>
                                                                        <dx:ToolbarJustifyFullButton>
                                                                        </dx:ToolbarJustifyFullButton>
                                                                        <dx:ToolbarBackColorButton BeginGroup="True">
                                                                        </dx:ToolbarBackColorButton>
                                                                        <dx:ToolbarFontColorButton>
                                                                        </dx:ToolbarFontColorButton>
                                                                    </Items>
                                                                </dx:HtmlEditorToolbar>
                                                            </Toolbars>
                                                            <Shortcuts>
                                                                <dx:HtmlEditorShortcut ActionName="fullscreen" Shortcut="Ctrl+F11" />
                                                            </Shortcuts>
                                                            <SettingsHtmlEditing EnterMode="p" />
                                                            <SettingsImageUpload UploadImageFolder="~/SysManager/pic/">
                                                            </SettingsImageUpload>
                                                            <SettingsResize AllowResize="True" />
                                                            <SettingsValidation ValidationGroup="btnSaveNews">
                                                                <RequiredField ErrorText="不能为空" IsRequired="True" />
                                                            </SettingsValidation>
                                                            <SettingsDocumentSelector Enabled="True">
                                                                <CommonSettings InitialFolder="~/DeanManager/新闻附件" 
                                                                    RootFolder="~/DeanManager/新闻附件" />
                                                                <ToolbarSettings ShowDownloadButton="True" />
                                                                <UploadSettings AllowedFolder="SpecificOnly" 
                                                                    AllowedFolderPath="~/DeanManager/新闻附件" Enabled="True">
                                                                    <AdvancedModeSettings EnableMultiSelect="True" />
                                                                </UploadSettings>
                                                            </SettingsDocumentSelector>
                                                        </dx:ASPxHtmlEditor>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2">
                                                        <table width="100%">
                                                            <tr>
                                                                <td align="right">
                                                                    发布者：
                                                                </td>
                                                                <td align="left" width="20%">
                                                                    <dx:ASPxTextBox ID="txtPublisher" runat="server" ToolTip="请填写发布者" Width="120px" ClientInstanceName="cl_txtPublisher" 
                                                                    Text='<%# Bind("发布者") %>' NullText="必填">
                                                                    <ValidationSettings Display="Dynamic" SetFocusOnError="True" ValidationGroup="btnSaveNews">
                                                                <RequiredField ErrorText="不能为空" IsRequired="True" />
                                                            </ValidationSettings>
                                                                    </dx:ASPxTextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="right">
                                                                    发布时间：
                                                                </td>
                                                                <td align="left">
                                                                    <dx:ASPxLabel ID="lblDate" runat="server" Text='<%# Convert.ToString(Eval("发布时间")) == ""?"未发布":Convert.ToDateTime(Eval("发布时间")).ToString("yyyy年MM月dd日") %>'>
                                                                    </dx:ASPxLabel>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                </table>
                                                <table width="900px">
                                <tr>
                                    <td colspan="3" align="center">
                                        <dx:ASPxLabel ID="lblErrorTip" runat="server" Text="*" Visible="False" ForeColor="Red">
                                        </dx:ASPxLabel>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                       <dx:ASPxButton ID="btnSaveNews" runat="server" OnClick="btnSave_Click" Text="保 存"
                                                            ToolTip="保存此则新闻" ValidationGroup="btnSaveNews" Width="70px">
                                                        </dx:ASPxButton>
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        <dx:ASPxButton ID="btnCancelCourse" runat="server" Text="取消" CausesValidation="False"
                                            Width="60px" ToolTip="取消修改">
                                            <ClientSideEvents Click="function(s, e) { cancelEditInfo(cl_gvNews,e); }" />
                                        </dx:ASPxButton>
                                    </td>
                                </tr>
                            </table>
                                        </EditForm>
                                    </Templates>
                                </dx:ASPxGridView>
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </asp:UpdatePanel>
        </center>
        <asp:ObjectDataSource ID="odsNews" runat="server" DeleteMethod="Delete" InsertMethod="InsertNews"
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetAllNews" TypeName="MainDataSetTableAdapters.TA_新闻表TableAdapter"
            UpdateMethod="UpdateNews">
            <DeleteParameters>
                <asp:Parameter Name="Original_新闻ID" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="新闻标题" Type="String" />
                <asp:Parameter Name="发布者" Type="String" />
                <asp:Parameter Name="最后更新时间" Type="DateTime" />
                <asp:Parameter Name="新闻内容" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="新闻标题" Type="String" />
                <asp:Parameter Name="发布者" Type="String" />
                <asp:Parameter Name="最后更新时间" Type="DateTime" />
                <asp:Parameter Name="新闻内容" Type="String" />
                <asp:Parameter Name="Original_新闻ID" Type="String" />
            </UpdateParameters>
        </asp:ObjectDataSource>
    </div>
    </form>
</body>
</html>
