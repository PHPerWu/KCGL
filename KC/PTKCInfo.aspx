<%@ Page Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="PTKCInfo.aspx.cs" Inherits="KC_PTKCInfo" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <title>课程总览</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
            <div class="body">
                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="odsKCXX" 
                    onitemdatabound="Repeater1_ItemDataBound">
                    <HeaderTemplate>
                        <table width="100%" class="rptb">
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td style="width: 30%;">
                            </td>
                            <td colspan="2" style="width: 500px;">
                                <h1 style=" border-bottom:1px solid Green; width:500px; " >
                                    <%#Eval("课程名称")%></h1>
                            </td>
                        </tr>
                        <tr>
                            <td rowspan="4" style="width: 30%; padding-left: 120px">
                                <asp:ImageButton ID="ImageButton1" runat="server" Width="120px" Height="160px" ImageUrl='<%# Eval("课程图片").ToString()!=""?Eval("课程图片"):"~/image/public/noup.jpg" %>' />
                            </td>
                            <td style="width: 10%;" align="right">
                                课程类别：
                            </td>
                            <td align="left" style="width: 60%;">
                                <%#Eval("课程类别名") %>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                开课学院：
                            </td>
                            <td>
                                <%#Eval("开课学院名") %>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                课程学分：
                            </td>
                            <td>
                                <%#Eval("课程学分").ToString().Length>3? Eval("课程学分").ToString().Substring(0,3):Eval("课程学分").ToString() %>学分
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                总学时：
                            </td>
                            <td>
                                <%#Eval("总学时") %>
                                学时
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                讲授<%#Eval("讲授学时") %>学时 实践<%#Eval("实践学时") %>学时 实验<%#Eval("实验学时") %>学时
                            </td>
                        </tr>
                        <tr>
                            <td style="padding-left: 150px">
                                点击量：<%#Eval("课程点击量") %></td>
                            <td align="right">
                                面向对象：
                            </td>
                            <td>
                                <%#Eval("面向对象名") %>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td align="right">
                                教学方式：
                            </td>
                            <td>
                                <%#Eval("教学方式名") %>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td align="right">
                                考核方式：
                            </td>
                            <td>
                                <%#Eval("考核方式名") %>
                            </td>
                        </tr>
                          <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td align="right">
                                课程网址：
                            </td>
                            <td>
                                <dx:ASPxHyperLink ID="hlKcWeb" runat="server" Text="" Target="_blank">
                                </dx:ASPxHyperLink>
                            </td>
                        </tr>
                       <%-- <tr>
                            <td rowspan="3">
                            </td>
                            <td align="right">
                                课程负责人：
                            </td>
                            <td>
                                <%#Eval("课程负责人")%>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                立项级别：
                            </td>
                            <td>
                                <%#Eval("立项年度") %>年
                                <%#Eval("立项级别名")%>
                                <%#Eval("精品视频公开课").ToString() == "1" ? "精品视频公开课" : ""%>
                                <%#Eval("精品资源共享课").ToString() == "1" ? "精品资源共享课" : ""%>
                            </td>
                        </tr>--%>
                       <tr>
                       <td>&nbsp;</td>
                        <td align="right">
                            教学大纲：
                        </td>
                        <td>
                         <dx:ASPxHyperLink ID="hlJXDG" runat="server" Text="" Cursor="pointer"  Target="_blank">
                                </dx:ASPxHyperLink>
                        </td>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                        </table></FooterTemplate>
                </asp:Repeater>
                <table width="100%" class="pjTable">
                    <tr>
                        <td>
                            <center>
                                <table>
                                    <tr>
                                        <td colspan="3">
                                            <b>看完此课程介绍，您心情如何？</b>           
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3" height="10px">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="font-size: 13px; text-align:center;">
                                            <asp:Label ID="lblyes" runat="server" Text="0"></asp:Label>票<br />
                                            <img id="imgyes" alt="赞" style="cursor: pointer;" src="../image/yes.jpg" />
                                        </td>
                                        <td style="font-size: 13px;text-align:center;">
                                            <asp:Label ID="lblyiban" runat="server" Text="0"></asp:Label>票<br />
                                            <img id="imgyiban" alt="一般" style="cursor: pointer;" src="../image/yiban.jpg" />
                                        </td>
                                        <td style="font-size: 13px;text-align:center;">
                                            <asp:Label ID="lblno" runat="server" Text="0"></asp:Label>票<br />
                                            <img id="imgno" alt="差" style="cursor: pointer;" src="../image/no.jpg" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="font-size: 13px;text-align:center;">
                                            <b>喜欢</b>
                                        </td>
                                        <td style="font-size: 13px;text-align:center;">
                                            <b>一般</b>
                                        </td>
                                        <td style="font-size: 13px;text-align:center;">
                                            <b>不喜欢</b>
                                        </td>
                                    </tr>
                                </table>
                            </center>
                        </td>
                    </tr>
                     <tr><td align="right" style=" font-size:13px; padding-right:60px;"><a style="color:#698B22" href="javascript:history.go(-1);">返回上一页</a></td></tr>
                </table>
                <asp:Label ID="lblkcid" runat="server" Text="" Style="display: none;"></asp:Label>
                <asp:Label ID="lblhref" runat="server" Text="" Style="display: none;"></asp:Label>
              
            <center style="font-size: 12px">
            </center>
        </div>
        <asp:ObjectDataSource ID="odsKCXX" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetKCInfoByKCDM" TypeName="MainDataSetTableAdapters.VI_KCINFOTableAdapter">
            <SelectParameters>
                <asp:QueryStringParameter Name="课程代码" QueryStringField="KCID" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
</asp:Content>