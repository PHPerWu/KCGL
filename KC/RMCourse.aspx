<%@ Page Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="RMCourse.aspx.cs" Inherits="KC_RMCourse" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
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
                </div>--%>                <%--<div style="float: right; width: 80%">--%>
                <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="odsRMKC"
                    KeyFieldName="课程代码" Width="100%" Theme="Glass">
                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="课程代码" VisibleIndex="0" ReadOnly="True" 
                            Visible="False">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="课程名称" VisibleIndex="1">
                            <Settings AllowHeaderFilter="True" HeaderFilterMode="CheckedList" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="课程点击量" VisibleIndex="4">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="开课学院名称" VisibleIndex="3" Caption="开课学院">
                            <Settings AllowHeaderFilter="True" HeaderFilterMode="CheckedList" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="课程类别名" VisibleIndex="2" Caption="课程类别">
                            <Settings AllowHeaderFilter="True" HeaderFilterMode="CheckedList" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="查看详情" VisibleIndex="5">
                            <DataItemTemplate>
                                <dx:ASPxButton ID="btnInfo" runat="server" 
                                    CommandArgument='<%# Eval("课程代码") %>' EnableTheming="True" 
                                    oncommand="btnInfo_Command" Text="查看详情&gt;&gt;" Theme="Aqua">
                                    <Border BorderStyle="None" />
                                </dx:ASPxButton>
                            </DataItemTemplate>
                        </dx:GridViewDataTextColumn>
                    </Columns>
                    <SettingsPager PageSize="20">
                    </SettingsPager>
                    <Settings ShowTitlePanel="True" />
                    <SettingsText Title="热门课程" />
                    <Styles>
                        <Header HorizontalAlign="Center" VerticalAlign="Middle">
                        </Header>
                        <Cell HorizontalAlign="Center" VerticalAlign="Middle">
                        </Cell>
                        <TitlePanel Font-Bold="True" ForeColor="Black" HorizontalAlign="Center" 
                            Font-Size="Medium">
                        </TitlePanel>
                    </Styles>
                </dx:ASPxGridView>
                <%--  </div>--%>
                <asp:ObjectDataSource ID="odsRMKC" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataHotKC" 
                    TypeName="MainDataSetTableAdapters.TA_课程信息表TableAdapter" 
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
</asp:Content>