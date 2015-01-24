<%@ Page Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="KCfaculty.aspx.cs" Inherits="KC_KCFaculty" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxDataView" TagPrefix="dx" %>

      <asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   <title>所有课程</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>

            <div style="height: 2px">
                &nbsp;</div>
            <div class="body">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <table width="100%">
                            <tr valign="top">
                                <td width="100%" valign="top">
                                    <table width="100%">
                                        <tr>
                                            <td width="75%" valign="top">
                                                <table width="100%">
                                                    <tr>
                                                        <td valign="top">
                                                            <%--style="border-right: 2px solid #333" class="style1"--%>
                                                            <div>
                                                                <div id="divXY">
                                                                    <b>湖北大学院系总览</b>
                                                                </div>
                                                                <div>
                                                                    <asp:DataList ID="dltXY" runat="server" RepeatColumns="6" Width="100%" DataKeyField="学院ID"
                                                                        DataSourceID="odsXY" OnItemCommand="dltXY_ItemCommand" ForeColor="black">
                                                                        <HeaderTemplate>
                                                                            <table>
                                                                        </HeaderTemplate>
                                                                        <FooterTemplate>
                                                                            </table></FooterTemplate>
                                                                        <ItemTemplate>
                                                                            <asp:Button ID="Button1" runat="server" Text='<%# Eval("学院名称") %>' Width="160px"
                                                                                Height="30px" ToolTip="点击查看学院下的专业和课程" BorderColor="#6B8E23" BorderWidth="1px"
                                                                                BackColor="#A2CD5A" ForeColor="black" Font-Size="15px" CssClass="lbxy" CommandName="XY"
                                                                                CommandArgument='<%#Eval("学院ID")+"|"+Eval("学院名称") %>' />
                                                                        </ItemTemplate>
                                                                    </asp:DataList>
                                                                </div>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>

                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr valign="top">
                                <td width="100%" valign="top">
                                    <table width="100%">
                                        <tr>
                                            <td width="100%" valign="top" style="border-top: 2px solid #333">
                                                <div>
                                                    <div id="divKC" style="">
                                                        <b>
                                                            <asp:Label ID="lblKCname" runat="server" Text="课程名称"></asp:Label></b>
                                                    </div>
                                                    <div>
                                                        <dx:ASPxDataView ID="dvKC" runat="server" ColumnCount="6" ToolTip="点击课程查看详情" Width="100%"
                                                            EmptyDataText="暂无相关课程" DataSourceID="odsKC" Theme="Glass">
                                                            <ItemTemplate>
                                                                <asp:LinkButton ID="LinkButton1" runat="server" Text='<%# Eval("课程名称").ToString().Length>12?Eval("课程名称").ToString().Substring(0,12):Eval("课程名称") %>'
                                                                    Height="35px" Style="line-height:35px;" ToolTip='<%# Eval("课程名称")%>'  BorderColor="#6B8E23"
                                                                    ForeColor="black" BorderWidth="1px" BackColor="#A2CD5A" Font-Size="13px" CssClass="lbxy"
                                                                    PostBackUrl='<%# "~/KC/PTKCInfo.aspx?KCID=" + Eval("课程代码") %>' Width="100%" Font-Strikeout="False"
                                                                    Font-Underline="False" >
                                                                </asp:LinkButton>
                                                            </ItemTemplate>
                                                            <SettingsFlowLayout ItemsPerPage="16" />
                                                            <SettingsTableLayout ColumnCount="6" RowsPerPage="10" />
                                                            <PagerSettings Position="Bottom"> 
                                                                <FirstPageButton Text="第一页">
                                                                </FirstPageButton>
                                                                <LastPageButton Text="最后一页">
                                                                </LastPageButton>
                                                                <Summary Text="当前第{0}页/共{1}页" />
                                                            </PagerSettings>
                                                            <ItemStyle Height="20px" HorizontalAlign="Center" VerticalAlign="Middle">
                                                                <Paddings PaddingBottom="0px" PaddingLeft="0px" PaddingRight="0px" PaddingTop="0px" />
                                                            </ItemStyle>
                                                            <PagerPageSizeItemStyle Width="20px">
                                                            </PagerPageSizeItemStyle>
                                                            <EmptyDataStyle ForeColor="Black">
                                                            </EmptyDataStyle>
                                                        </dx:ASPxDataView>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        
        </div>
        <asp:ObjectDataSource ID="odsXY" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetDataByID" TypeName="MainDataSetTableAdapters.TA_学院信息表TableAdapter">
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="odsZY" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetDataByXYID" TypeName="MainDataSetTableAdapters.TA_专业信息表TableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="hdfXYID" DefaultValue="-1" Name="所属学院" PropertyName="Value"
                    Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:HiddenField ID="hdfXYID" runat="server" />
        <asp:ObjectDataSource ID="odsKC" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetKCByYX" TypeName="MainDataSetTableAdapters.TA_课程信息表TableAdapter"
            DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update">
            <DeleteParameters>
                <asp:Parameter Name="Original_课程代码" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="课程代码" Type="String" />
                <asp:Parameter Name="开课学期" Type="String" />
                <asp:Parameter Name="课程性质" Type="String" />
                <asp:Parameter Name="课程类别" Type="String" />
                <asp:Parameter Name="先修课程" Type="String" />
                <asp:Parameter Name="使用教材" Type="String" />
                <asp:Parameter Name="双学位课程" Type="Decimal" />
                <asp:Parameter Name="总学时" Type="Decimal" />
                <asp:Parameter Name="讲授学时" Type="Decimal" />
                <asp:Parameter Name="实践学时" Type="Decimal" />
                <asp:Parameter Name="精品视频公开课" Type="Decimal" />
                <asp:Parameter Name="精品课程网址" Type="String" />
                <asp:Parameter Name="开课学院" Type="String" />
                <asp:Parameter Name="课程名称" Type="String" />
                <asp:Parameter Name="后续课程" Type="String" />
                <asp:Parameter Name="课程学分" Type="Decimal" />
                <asp:Parameter Name="考核方式" Type="String" />
                <asp:Parameter Name="教学方式" Type="String" />
                <asp:Parameter Name="主要参考书目" Type="String" />
                <asp:Parameter Name="教学计划" Type="Object" />
                <asp:Parameter Name="教学大纲" Type="Object" />
                <asp:Parameter Name="精品资源共享课" Type="Decimal" />
                <asp:Parameter Name="评分" Type="Decimal" />
                <asp:Parameter Name="已评分人数" Type="Decimal" />
                <asp:Parameter Name="实验学时" Type="Decimal" />
                <asp:Parameter Name="课程点击量" Type="Decimal" />
                <asp:Parameter Name="课程级别" Type="String" />
                <asp:Parameter Name="面向对象" Type="String" />
                <asp:Parameter Name="创建时间" Type="DateTime" />
                <asp:Parameter Name="创建人" Type="String" />
                <asp:Parameter Name="课程描述" Type="Object" />
                <asp:Parameter Name="立项级别" Type="String" />
                <asp:Parameter Name="立项年度" Type="String" />
                <asp:Parameter Name="课程负责人" Type="String" />
                <asp:Parameter Name="课程图片" Type="String" />
                <asp:Parameter Name="喜欢" Type="Decimal" />
                <asp:Parameter Name="一般喜欢" Type="Decimal" />
                <asp:Parameter Name="不喜欢" Type="Decimal" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter DefaultValue="-1" Name="YX" SessionField="SYYX" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="开课学期" Type="String" />
                <asp:Parameter Name="课程性质" Type="String" />
                <asp:Parameter Name="课程类别" Type="String" />
                <asp:Parameter Name="先修课程" Type="String" />
                <asp:Parameter Name="使用教材" Type="String" />
                <asp:Parameter Name="双学位课程" Type="Decimal" />
                <asp:Parameter Name="总学时" Type="Decimal" />
                <asp:Parameter Name="讲授学时" Type="Decimal" />
                <asp:Parameter Name="实践学时" Type="Decimal" />
                <asp:Parameter Name="精品视频公开课" Type="Decimal" />
                <asp:Parameter Name="精品课程网址" Type="String" />
                <asp:Parameter Name="开课学院" Type="String" />
                <asp:Parameter Name="课程名称" Type="String" />
                <asp:Parameter Name="后续课程" Type="String" />
                <asp:Parameter Name="课程学分" Type="Decimal" />
                <asp:Parameter Name="考核方式" Type="String" />
                <asp:Parameter Name="教学方式" Type="String" />
                <asp:Parameter Name="主要参考书目" Type="String" />
                <asp:Parameter Name="教学计划" Type="Object" />
                <asp:Parameter Name="教学大纲" Type="Object" />
                <asp:Parameter Name="精品资源共享课" Type="Decimal" />
                <asp:Parameter Name="评分" Type="Decimal" />
                <asp:Parameter Name="已评分人数" Type="Decimal" />
                <asp:Parameter Name="实验学时" Type="Decimal" />
                <asp:Parameter Name="课程点击量" Type="Decimal" />
                <asp:Parameter Name="课程级别" Type="String" />
                <asp:Parameter Name="面向对象" Type="String" />
                <asp:Parameter Name="创建时间" Type="DateTime" />
                <asp:Parameter Name="创建人" Type="String" />
                <asp:Parameter Name="课程描述" Type="String" />
                <asp:Parameter Name="立项级别" Type="String" />
                <asp:Parameter Name="立项年度" Type="String" />
                <asp:Parameter Name="课程负责人" Type="String" />
                <asp:Parameter Name="Original_课程代码" Type="String" />
            </UpdateParameters>
        </asp:ObjectDataSource>
        <asp:HiddenField ID="hdfSYYX" runat="server" />
        <asp:HiddenField ID="hdfSYZY" runat="server" />

    </asp:Content>