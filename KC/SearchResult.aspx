<%@ Page Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="SearchResult.aspx.cs" Inherits="KC_SearchResult" %>

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
                <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False"
                    KeyFieldName="课程代码" Width="100%" Theme="Glass">
                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="课程代码" ReadOnly="True" Visible="False" 
                            VisibleIndex="0">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="总学时" VisibleIndex="17" Caption="总学时/周数">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="课程名称" VisibleIndex="1">
                            <Settings AllowHeaderFilter="True" HeaderFilterMode="CheckedList" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="课程学分" VisibleIndex="14">
                        <DataItemTemplate><%#Eval("课程学分").ToString().Length>3? Eval("课程学分").ToString().Substring(0,3):Eval("课程学分").ToString() %></DataItemTemplate>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="开课学院名称" VisibleIndex="20" Caption="开课学院">
                            <Settings AllowHeaderFilter="True" HeaderFilterMode="CheckedList" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="课程性质名" VisibleIndex="6" Caption="课程性质">
                            <Settings AllowHeaderFilter="True" HeaderFilterMode="CheckedList" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="课程类别名" VisibleIndex="18" Caption="课程类别">
                            <Settings AllowHeaderFilter="True" HeaderFilterMode="CheckedList" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="查看详情" VisibleIndex="22">
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
                        <Summary Text="第{0}页/共{1}页(共{2}条)" />
                    </SettingsPager>
                    <Settings ShowTitlePanel="True" />
                    <SettingsText Title="课程查询结果表" />
                    <Styles>
                        <Header HorizontalAlign="Center">
                        </Header>
                        <Cell HorizontalAlign="Center">
                        </Cell>
                        <TitlePanel Font-Size="Medium">
                        </TitlePanel>
                    </Styles>
                </dx:ASPxGridView>
                <%--  </div>--%>
                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataByAllCollege" TypeName="MainDataSetTableAdapters.TA_课程信息表TableAdapter">
                </asp:ObjectDataSource>
</asp:Content>