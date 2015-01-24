<%@ Page Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="ViewNews.aspx.cs" Inherits="ViewNews" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
    <%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <title>课程总览</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
            <%--2013.22.29加上访问量—任俊伟--%>

        <div class="body" align="center">
            <a name='top'></a>
            <br />
            <br />
            <br />
            <asp:Repeater ID="rptNews" runat="server" DataSourceID="odsNews">
                <ItemTemplate>
                    <table width="65%" style="text-align: left; line-height: 200%;">
                        <tr>
                            <td style="font-size: x-large; color:black; font-weight: bold;" align="center">
                                <%# Eval("新闻标题") %>
                            </td>
                        </tr>
                        <tr>
                            <td style="font-size: small; color: #808080;" align="center">
                                最后更新时间：<%# Eval("最后更新时间") %>&nbsp;浏览次数：<%# Eval("浏览次数")%>&nbsp;发布者：<%# Eval("发布者")%>&nbsp;发布时间：<%# Convert.ToDateTime(Eval("发布时间")).ToString("yyyy年MM月dd日")%></td>
                        </tr>
                        <tr>
                            <td>
                                <hr />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <%# Eval("新闻内容") %>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                               
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                
                            </td>
                        </tr>
                        <tr>
                            <td>
                                附件下载：无
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:Repeater>
            <br />
            <%--<a href="#top">返回顶部</a>--%>
            <asp:ObjectDataSource ID="odsNews" runat="server" OldValuesParameterFormatString="original_{0}"
                SelectMethod="GetOneNews" TypeName="MainDataSetTableAdapters.TA_新闻表TableAdapter">
                <SelectParameters>
                    <asp:QueryStringParameter Name="新闻ID" QueryStringField="NewsID" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
     
</asp:Content>