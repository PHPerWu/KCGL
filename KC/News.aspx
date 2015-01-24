<%@ Page Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="News.aspx.cs" Inherits="KC_News" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.Web.v13.2, Version=13.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <title>课程总览</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
                <div>
                    <center>
                        <font size="4"><strong>新闻公告</strong></font></center>
                </div>
                <div class="body" align="center">
                    <dx:ASPxGridView ID="gvNews" class="gvclass" runat="server" AutoGenerateColumns="False"
                        DataSourceID="odsNews" KeyFieldName="新闻ID" Width="80%" EnableTheming="False"
                        ClientInstanceName="cl_gvNews" SettingsPager-PageSize="7" 
                        Font-Names="华文细黑" Font-Size="Smaller" style="text-align: center">
                        <SettingsBehavior AllowDragDrop="False" AllowGroup="False" AllowSort="False" />
                        <Columns>
                            <dx:GridViewDataTextColumn FieldName="新闻标题" VisibleIndex="0" Width="85%">
                                <DataItemTemplate>
                                <li style=" line-height:20px; list-style-type:none;border-bottom-width:1px;
                                         border-bottom-style:dashed; border-bottom-color:#C0C0C0; ">
                                         ●
                                         <a class="ahover" href='<%# "ViewNews.aspx?NewsID=" +  Eval("新闻ID") %>' target="_blank"
                                        style="font-size: 15px; color: Black;" title='<%#Eval("新闻标题")%>'>
                                        <%# Eval("新闻标题").ToString().Length < 30 ? Eval("新闻标题") : Eval("新闻标题").ToString().Substring(0, 30) + "..."%></a>
                                    </li>        
                                </DataItemTemplate>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataDateColumn FieldName="最后更新时间" VisibleIndex="2" Width="15%">
                            <DataItemTemplate>
                            <li style=" line-height:20px; list-style-type:none;border-bottom-width:1px;
                                         border-bottom-style:dashed; border-bottom-color:#C0C0C0; ">
                                         <%#Eval("最后更新时间", "{0:yyyy/MM/dd}")%>
                            </li>
                            </DataItemTemplate>
                                <PropertiesDateEdit DisplayFormatString="[yyyy-MM-dd]" >
                                </PropertiesDateEdit>
                            </dx:GridViewDataDateColumn>
                        </Columns>
                        <SettingsPager AlwaysShowPager="True" PageSize="8" ShowNumericButtons="False">
                            <AllButton>
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
                            <Summary Text="第{0}页/共{1}页(共{2}条)" Visible="False" />
                        </SettingsPager>
                        <Settings GridLines="None" ShowColumnHeaders="False"></Settings>
                        <SettingsText EmptyDataRow="暂无新闻" />
                        <Styles>
                            <EmptyDataRow BackColor="#F7F8F9">
                            </EmptyDataRow>
                            <Cell ForeColor="Black" HorizontalAlign="Left" VerticalAlign="Middle" BackColor="#F7F8F9">
                                <Paddings PaddingBottom="10px" />
                                <Border BorderStyle="None" />
                            </Cell>
                            <PagerBottomPanel BackColor="#F7F8F9" HorizontalAlign="Center">
                                <Border BorderStyle="None" />
                            </PagerBottomPanel>
                        </Styles>
                        <Border BorderStyle="None"></Border>
                    </dx:ASPxGridView>
                    <asp:ObjectDataSource ID="odsNews" runat="server" OldValuesParameterFormatString="original_{0}"
                        SelectMethod="GetPubNews" TypeName="MainDataSetTableAdapters.TA_新闻表TableAdapter">
                    </asp:ObjectDataSource>
</asp:Content>