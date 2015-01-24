<%@ Page Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="TeacherFamousInfo.aspx.cs"
    Inherits="KC_TeacherFamous" %>

<%@ Register Assembly="DevExpress.Web.ASPxHtmlEditor.v13.2, Version=13.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxHtmlEditor" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxSpellChecker.v13.2, Version=13.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxSpellChecker" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <title>课程总览</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
            <div class="body">
            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="odsTeacherInfo" OnItemDataBound="Repeater1_ItemDataBound">
                    <HeaderTemplate>
                        <table width="100%" class="repMSJX">
                            <tr>
                                <td align="center" colspan="6">
                                    <h2>
                                        名师简介</h2>
                            </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                    <tr><td>
                    <table>
                    <tr>
                    <td rowspan="2" width="25%" align="right" style="vertical-align: middle;"> 
                    <asp:Image ID="Image1" runat="server" Height="120px" Width="96px" ImageUrl='<%# Eval("教师图片").ToString()!=""?Eval("教师图片"):"~/image/public/noup.jpg" %>' />
                    </td>
                    <td align="right" width="120px" height="40px">
                                <strong>教师姓名:</strong>
                            </td>
                            <td align="left" width="150px">
                                <%#Eval("教师姓名") %>
                            </td>
                     <td align="right" width="100px">
                                <strong>所属学院:</strong>
                            </td>
                            <td width="350px" align="left">
                                <asp:Label ID="lblSchool" runat="server" Text=""></asp:Label>
                            </td>
                    </tr>
                    <tr>
                    <td align="right" height="40px">
                                <strong>获奖级别:</strong>
                            </td>
                            <td>
                                <asp:Label ID="lblWinning" runat="server" Text=""></asp:Label>
                            </td>
                            <td align="right">
                                <strong>获奖年度:</strong>
                            </td>
                            <td>
                                <%#Eval("获奖年度") %>
                            </td>
                    </tr>
                    <tr>
                    <td align="right" height="40px">
                                <strong>点击量:</strong>
                            </td>
                            <td>
                                <%#Eval("点击量") %>
                            </td>
                    <td> &nbsp;</td>
                    <td> &nbsp;</td>
                    <td> &nbsp;</td>
                    </tr>
                    </table> 
                        <table width="100%">
                        <tr>
                            <td align="center" valign="top" width="100%">
                                <strong>教师简介:</strong>
                            </td>  
                        </tr>
                        <tr>
                        <td align="center">
                        <table width="80%">
                        <tr>
                        <td align="left">
                        <%#Eval("教师简介") %>
                        </td>
                        </tr>
                        </table>
                                
                            </td>
                        </tr>
                        </table>
                        <table width="100%">
                        <tr><td align="right" style=" font-size:13px; padding-right:60px;"><a style="color:#698B22" href="TeacherFamous.aspx">返回上一页</a></td></tr>
                        </table>
                    </td>
                    </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                        </table>
                    </FooterTemplate>
                </asp:Repeater>
            </div>

    <asp:ObjectDataSource ID="odsTeacherInfo" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetData教师信息ByID" TypeName="MainDataSetTableAdapters.TA_教师信息表TableAdapter">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="-1" Name="教师ID" SessionField="TeacherID" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>