<%@ Page Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="XWYZCourse.aspx.cs" Inherits="KC_XWYZCourse" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <title>课程总览</title>
      <style>
         .dxeButtonEditButton_Youthful
         {
             background:#afc185 !important;
             
             }
         .dxgvTitlePanel_Youthful, .dxgvTable_Youthful caption
         {
             background-color:#fff;
             color:#000;
             font-weight:bold;
             }
        .dxb-hb,.dxb
         {
             background-color:#afc185 !important;
            color:#000;
           border:2px solid;
            border-radius:2px;
           -moz-border-radius:2px;
           
             }
         .dxgvHeader_Youthful
         {
            background-color:#afc185 !important;
             }
     </style>
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
                </div>--%>
                <%--<div style="float: right; width: 80%">--%>
                <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="odsXWYZKC"
                    KeyFieldName="优质课程代码" Width="100%" Theme="Youthful">
                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="优质课程名称" VisibleIndex="0">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="优质课程网址" VisibleIndex="1">
                            <DataItemTemplate>
                                <a href='<%#Eval("优质课程网址") %>'>
                                    <%#Eval("优质课程网址") %></a>
                            </DataItemTemplate>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="优质课程代码" VisibleIndex="2" ReadOnly="True" Visible="False">
                        </dx:GridViewDataTextColumn>
                    </Columns>
                    <SettingsPager PageSize="20">
                    </SettingsPager>
                    <Settings ShowTitlePanel="True" />
                    <SettingsText Title="校外优质课程" />
                    <Styles>
                        <Header HorizontalAlign="Center" VerticalAlign="Middle">
                        </Header>
                        <Row CssClass="xwyzkc">
                        </Row>
                        <Cell HorizontalAlign="Center" VerticalAlign="Middle">
                        </Cell>
                        <TitlePanel Font-Bold="True" ForeColor="Black" HorizontalAlign="Center" 
                            Font-Size="Medium">
                        </TitlePanel>
                    </Styles>
                </dx:ASPxGridView>
                <%--  </div>--%>
                <asp:ObjectDataSource ID="odsXWYZKC" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="DMDataSetTableAdapters.DM_优质课程TableAdapter">
                </asp:ObjectDataSource>
            </div>
</asp:Content>