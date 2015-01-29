<%@ Page Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="ZYGXCourse.aspx.cs" Inherits="KC_JPKFCourse" %>

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
                    <%-- <a href="<%# Eval("精品课程网址") %>" target="_blank"><%# Eval("精品课程网址") %></a>--%><%--  </div>--%>
                    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="odsZYGX"
                        KeyFieldName="课程代码" Width="100%" Theme="Youthful" EnableTheming="True">
                        <Columns>
                            <dx:GridViewCommandColumn ShowClearFilterButton="True" VisibleIndex="0">
                            </dx:GridViewCommandColumn>
                            <dx:GridViewDataTextColumn FieldName="课程代码" VisibleIndex="1" ReadOnly="True" 
                                Visible="False">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="精品课程网址" VisibleIndex="11">
                                <DataItemTemplate>
                                    <dx:ASPxButton ID="btn_Website" runat="server" Text="点击进入>>" 
                                        EnableTheming="True" Theme="Aqua" CommandArgument='<%# Container.VisibleIndex %>' 
                                        oncommand="btn_Website_Command" >
                                    <Border BorderStyle="None" />
                                    </dx:ASPxButton>
                               <%-- <a href="<%# Eval("精品课程网址") %>" target="_blank"><%# Eval("精品课程网址") %></a>--%>
                                </DataItemTemplate>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="课程名称" VisibleIndex="2">
                                <Settings AllowHeaderFilter="False" HeaderFilterMode="CheckedList" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="课程点击量" VisibleIndex="9">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="立项级别" VisibleIndex="3">
                                <Settings AllowHeaderFilter="False" HeaderFilterMode="CheckedList" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="立项年度" VisibleIndex="4" Caption="立项时间">
                                <Settings AllowHeaderFilter="False" HeaderFilterMode="CheckedList" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataComboBoxColumn Caption="开课学院" FieldName="开课学院名称" 
                                VisibleIndex="8">
                                <PropertiesComboBox DataSourceID="odsKKXY" TextField="学院名称" ValueField="学院名称">
                            </PropertiesComboBox>
                                <Settings AllowHeaderFilter="False" HeaderFilterMode="CheckedList" />
                            </dx:GridViewDataComboBoxColumn>
                            <dx:GridViewDataTextColumn FieldName="课程负责人" VisibleIndex="7">
                                <Settings AllowHeaderFilter="False" HeaderFilterMode="CheckedList" />
                            </dx:GridViewDataTextColumn>
                        </Columns>
                        <SettingsPager PageSize="20">
                            <Summary Text="第{0}页/共{1}页(共{2}条)" />
                        </SettingsPager>
                        <Settings ShowTitlePanel="True" ShowFilterRow="True" />
                        <SettingsText Title="资源共享课" />
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
                    <asp:ObjectDataSource ID="odsZYGX" runat="server" OldValuesParameterFormatString="original_{0}"
                        SelectMethod="GetDataByZYGX" 
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
                <asp:ObjectDataSource ID="odsKKXY" runat="server" DeleteMethod="Delete" 
                    InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
                    SelectMethod="GetData" TypeName="DMComboxTableAdapters.TA_学院信息表TableAdapter" 
                    UpdateMethod="Update">
                    <DeleteParameters>
                        <asp:Parameter Name="Original_学院ID" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="学院ID" Type="String" />
                        <asp:Parameter Name="学院名称" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="学院名称" Type="String" />
                        <asp:Parameter Name="Original_学院ID" Type="String" />
                    </UpdateParameters>
                </asp:ObjectDataSource>
                    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server">
                    </asp:ObjectDataSource>
                </div>
</asp:Content>
