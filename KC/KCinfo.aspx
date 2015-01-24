<%@ Page Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="KCinfo.aspx.cs" Inherits="KC_KCinfo" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <title>课程总览</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
            <div class="body">
                <table width="100%">
                    <tr>
                        <td width="100%" valign="top">
                            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="odsKCXX">
                                <HeaderTemplate>
                                    <table width="100%" class="rptb">
                                </HeaderTemplate>
                                <FooterTemplate>
                                    </table></FooterTemplate>
                                <ItemTemplate>
                                    <tr>
                                        <td width="45%">
                                            &nbsp;&nbsp;<b>课程名称：</b><%#Eval("课程名称") %></td>
                                        <td>
                                            <b>点击量：</b><%#Eval("课程点击量") %></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;&nbsp;<b>课程级别：</b><%#Eval("课程级别名") %></td>
                                        <td>
                                            <b>评分：</b><%#Eval("评分") %></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;&nbsp;<b>总学时：</b><%#Eval("总学时") %>学时
                                        </td>
                                        <td>
                                            <b>讲授学时：</b><%#Eval("讲授学时") %>学时
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;&nbsp;<b>实践学时：</b><%#Eval("实践学时") %>学时
                                        </td>
                                        <td>
                                            <b>实验学时：</b><%#Eval("实验学时") %>学时
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;&nbsp;<b>课程类别：</b><%#Eval("课程类别名") %></td>
                                        <td>
                                            <b>课程性质：</b><%#Eval("课程性质名") %></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;&nbsp;<b>课程学分：</b><%#Eval("课程学分") %>学分
                                        </td>
                                        <td>
                                            <b>双学位课程：</b><%#Eval("双学位课程").Equals(1)?"是":"否" %></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;&nbsp;<b>教学方式：</b><%#Eval("教学方式名") %></td>
                                        <td>
                                            <b>考核方式：</b><%#Eval("考核方式名") %></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;&nbsp;<b>先修课程：</b><%#Eval("先修课程名称") %></td>
                                        <td>
                                            <b>后续课程：</b><%#Eval("后续课程名称")%></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;&nbsp;<b>开课学院：</b><%#Eval("开课学院名") %></td>
                                        <td>
                                            <b>面向对象：</b><%#Eval("面向对象名") %></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;&nbsp;<b>创建人：</b><%#Eval("创建人") %></td>
                                        <td>
                                            <b>创建时间：</b><%#Eval("创建时间","{0:yyyy年MM月dd日}") %></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;&nbsp;<b>精品视频公开课：</b><%#Eval("精品视频公开课").Equals(1) ? "是" : "否"%></td>
                                        <td>
                                            <b>精品资源共享课：</b><%#Eval("精品资源共享课").Equals(1) ? "是" : "否"%></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;&nbsp;<b>开课学期：</b><%#Eval("学期名") %></td>
                                        <td>
                                            <b>精品教程网址：</b><a href='<%#Eval("精品课程网址")%>' target="_blank"><%# Eval("精品课程网址").ToString().Length < 40 ? Eval("精品课程网址") : Eval("精品课程网址").ToString().Substring(0, 40) + "..."%></a></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;&nbsp;<b>使用教材:</b><%#Eval("使用教材") %></td>
                                        <td>
                                            <b>主要参考书目：</b><%#Eval("主要参考书目") %></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;&nbsp;<b>教学计划：</b><%#Eval("教学计划") %></td>
                                        <td>
                                            <b>教学大纲：</b><%#Eval("教学大纲") %></td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </td>
                    </tr>
                </table>
                <table class="table" width="100%">
                    <tr>
                        <td>
                            课程名称：
                        </td>
                        <td>
                            课程级别：
                        </td>
                        <td>
                            点击量：
                        </td>
                        <td rowspan="4">
                            图片
                        </td>
                    </tr>
                    <tr>
                        <td>
                            总学时：
                        </td>
                        <td>
                            实践学时：
                        </td>
                        <td>
                            课程类别：
                        </td>
                    </tr>
                    <tr>
                        <td>
                            课程学分：
                        </td>
                        <td>
                            教学方式：
                        </td>
                        <td>
                            先修课程：
                        </td>
                    </tr>
                    <tr>
                        <td>
                            创建人：
                        </td>
                        <td>
                            精品视频公开课：
                        </td>
                        <td>
                            开课学期：
                        </td>
                    </tr>
                    <tr>
                        <td>
                            教学计划：
                        </td>
                        <td>
                            主要参考书目：
                        </td>
                        <td>
                            开课学院：
                        </td>
                        <td>
                            使用教材:
                        </td>
                    </tr>
                    <tr>
                        <td>
                            主要参考书目：
                        </td>
                        <td>
                            教学大纲：
                        </td>
                        <td>
                            创建时间：
                        </td>
                        <td>
                            精品教程网址：
                        </td>
                    </tr>
                    <tr>
                        <td>
                            评分：
                        </td>
                        <td>
                            讲授学时：
                        </td>
                        <td>
                            实验学时：
                        </td>
                        <td>
                            课程性质：
                        </td>
                    </tr>
                    <tr>
                        <td>
                            双学位课程：
                        </td>
                        <td>
                            考核方式：
                        </td>
                        <td>
                            后续课程：
                        </td>
                        <td>
                            创建时间：
                        </td>
                    </tr>
                </table>
            </div>

        
        <asp:ObjectDataSource ID="odsKCXX" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetXXKCXXByKCDM" TypeName="MainDataSetTableAdapters.TA_课程信息表TableAdapter">
            <SelectParameters>
                <asp:QueryStringParameter Name="课程代码" QueryStringField="KCID" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
</asp:Content>