<%@ Page Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="VideoList.aspx.cs" Inherits="VideoList" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxDataView" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <title>课程总览</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
            <div class="body" style="margin: 0px; padding: 0px">
                <%--<div id="vertmenu" style="float: left; width: 20%; margin: 0px; padding: 0px">
                    <dl class="label" width="100%" style="margin: 0px; padding: 0px">
                        <dt>学术交流</dt>
                        <dd>
                            <a href='../InlandCom.aspx'>所有课程</a></dd>
                        <dd>
                            <a href='../InterCom.aspx'>通识教育课程</a></dd>
                        <dd>
                            <a href='../GATCom.aspx'>精品开放课程</a></dd>
                        <dd>
                            <a href='../GATCom.aspx'>校外优质课程</a></dd>
                    </dl>
                </div>--%><%--<div style="float: right; width: 80%">--%>
                <div class="VideoTitle">
                    <asp:Label ID="lblTitle" runat="server" Text=""></asp:Label></div>
                <dx:ASPxDataView ID="dvVideo" runat="server" AlwaysShowPager="True" BackColor="White"
                    ColumnCount="4" RowPerPage="4" ItemSpacing="0px" EnableTheming="True" RightToLeft="False"
                    Theme="Glass" Width="1000px" DataSourceID="odsVideo">
                    <SettingsFlowLayout ItemsPerPage="16"></SettingsFlowLayout>
                    <SettingsTableLayout ColumnCount="4" RowsPerPage="4" />
                    <PagerSettings Position="Bottom">
                    </PagerSettings>
                    <ItemTemplate>
                        <table width="240px" class="VideoList">
                            <tr>
                                <td colspan="3" align="center">
                                    <a href="VideoView.aspx?url=<%#Eval("视频路径").ToString().Substring(9) %>&ID=<%#Eval("视频ID") %>"
                                        title='<%#Eval("视频名称") %>' target="_blank">
                                        <asp:Image ID="img" runat="server" ImageUrl='<%#Eval("图片路径") %>' Width="210px" Height="140px" />
                                    </a>
                                </td>
                            </tr>
                            <tr>
                                <td width="15px">
                                </td>
                                <td width="210px" align="left">
                                    <a href="VideoView.aspx?url=<%#Eval("视频路径").ToString().Substring(9) %>&ID=<%#Eval("视频ID") %>"
                                        title=" <%#Eval("视频名称")%>" target="_blank">
                                        <%#Eval("视频名称")%></a>
                                </td>
                                <td width="15px">
                                </td>
                            </tr>
                            <tr>
                                <td width="15px">
                                </td>
                                <td width="210px" align="right" class="time">
                                    [<%#Eval("视频上传时间", "{0:yyyy/MM/dd}")%>]
                                </td>
                                <td width="15px">
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                    <Paddings PaddingLeft="0px" PaddingRight="0px" PaddingTop="0px" />
                    <ItemStyle BackColor="White" HorizontalAlign="Center" VerticalAlign="Top">
                        <Paddings PaddingBottom="10px" PaddingLeft="0px" PaddingRight="0px" PaddingTop="0px" />
                        <Border BorderStyle="None" />
                    </ItemStyle>
                    <PagerSummaryStyle HorizontalAlign="Center">
                    </PagerSummaryStyle>
                    <Border BorderStyle="None" />
                </dx:ASPxDataView>
                <asp:ObjectDataSource ID="odsVideo" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="MainDataSetTableAdapters.TA_课程视频表TableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="hfdKCID" DefaultValue="-1" Name="课程ID" PropertyName="Value"
                            Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:HiddenField ID="hfdKCID" runat="server" />
            </div>
</asp:Content>
