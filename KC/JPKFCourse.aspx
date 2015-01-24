<%@ Page Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="JPKFCourse.aspx.cs" Inherits="KC_JPKFCourse" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
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
                </div>--%>                    <%--<div style="float: right; width: 80%">--%>
                    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="odsJPKC"
                        KeyFieldName="课程代码" Width="100%" Theme="Glass">
                        <Columns>
                            <dx:GridViewDataTextColumn FieldName="课程代码" VisibleIndex="0" ReadOnly="True" 
                                Visible="False">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="精品课程网址" VisibleIndex="8">
                                <DataItemTemplate>
                                    <dx:ASPxButton ID="btn_Website" runat="server" Text="点击进入>>" 
                                        EnableTheming="True" Theme="Aqua" CommandArgument='<%# Container.VisibleIndex %>' 
                                        oncommand="btn_Website_Command" >
                                    <Border BorderStyle="None" />
                                    </dx:ASPxButton>
                               <%-- <a href="<%# Eval("精品课程网址") %>" target="_blank"><%# Eval("精品课程网址") %></a>--%>
                                </DataItemTemplate>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="课程名称" VisibleIndex="1">
                                <Settings AllowHeaderFilter="True" HeaderFilterMode="CheckedList" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="课程点击量" VisibleIndex="6">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="开课学院名称" VisibleIndex="5" Caption="开课学院">
                                <Settings AllowHeaderFilter="True" HeaderFilterMode="CheckedList" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="立项级别" VisibleIndex="2">
                                <Settings AllowHeaderFilter="True" HeaderFilterMode="CheckedList" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="立项年度" VisibleIndex="3" Caption="立项时间">
                                <Settings AllowHeaderFilter="True" HeaderFilterMode="CheckedList" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="课程负责人" VisibleIndex="4">
                                <Settings AllowHeaderFilter="True" HeaderFilterMode="CheckedList" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn VisibleIndex="7" Caption="查看详情">
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
                        <SettingsText Title="精品开放课程" />
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
                    <asp:ObjectDataSource ID="odsJPKC" runat="server" OldValuesParameterFormatString="original_{0}"
                        SelectMethod="GetDataJPKC" 
                        TypeName="MainDataSetTableAdapters.TA_课程信息表TableAdapter">
                    </asp:ObjectDataSource>
                </div>
</asp:Content>
