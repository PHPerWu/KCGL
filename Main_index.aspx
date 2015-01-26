<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Main_index.aspx.cs" Inherits="Main_index" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
    <asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   <title>首页</title>
   <link href="Styles/homepage.css" rel="stylesheet" type="text/css" />
   <style>
        .hide
        {
            display:none;
            }
   </style>
   
   <script type="text/javascript">
       //以下是图片切换函数代码
       window.onload = function () {
           tab("tab_t", "li", "tab_c", "div", "onmouseover")
           function tab(tab_t, tab_t_tag, tab_c, tag_c_tag, evt) {
               tab_t = document.getElementById("tab_t");
               var tab_t_li = tab_t.getElementsByTagName("li");
               tab_c = document.getElementById("tab_c");
               var tab_c_li = tab_c.getElementsByTagName("div");
               var len = tab_t_li.length;
               var i = 0;
               var timer = null;
               var num = 0;
               for (i = 0; i < len; i++) {
                   tab_t_li[i].index = i;
                   tab_t_li[i].onmouseover = function () {
                       clearInterval(timer);
                       num = this.index;
                       tab_change()
                   }
                   tab_t_li[i].onmouseout = function () {
                       autoplay();
                   }
               }

               function tab_change() {
                   for (i = 0; i < len; i++) {
                       tab_t_li[i].className = '';
                       tab_c_li[i].className = 'hide';
                   }
                   tab_t_li[num].className = 'act';
                   tab_c_li[num].className = '';
               }

               function autoplay() {
                   timer = setInterval(function () {
                       num--;
                       if (num < 0) num = len - 1;
                       tab_change();
                   }, 2000);
               }
               autoplay();
           }
       }

       function ddl_change() {
           window.open(document.getElementById("ddlYouqinglianjie").value);
       }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
       <div>
                <table width="100%">
                    <tr valign="top" style="height: 100px;">
                        <td width="100%" valign="top">
                            <table width="100%">
                                <tr>
                                    <td width="25%" valign="top">
                                        <table width="100%" style="height: 100px; line-height: 25px">
                                            <tr>
                                                <td valign="top">
                                                <div id="frame">
                            <div class="wrap">
                                  <ul id="tab_t">  
                                    <li class="act">4</li>    
                                    <li>3</li>
                                    <li>2</li>
                                    <li>1</li>  
                                  </ul>
                                <asp:ObjectDataSource ID="odsLunbo" runat="server" InsertMethod="Insert" 
                                      OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                                      TypeName="ImageTableAdapters.TA_轮播图片表TableAdapter">
                                    <InsertParameters>
                                        <asp:Parameter Name="图片ID" Type="String" />
                                        <asp:Parameter Name="图片名称" Type="String" />
                                        <asp:Parameter Name="上传时间" Type="String" />
                                        <asp:Parameter Name="上传人IP" Type="String" />
                                    </InsertParameters>
                                  </asp:ObjectDataSource>
                                  
                                    <div>
                                                       
                                                        <div id="tab_c">
                                                        <asp:Repeater ID="rptLunbo" runat="server" DataSourceID="odsLunbo">

                                                                     <ItemTemplate>
                                                                        <div><a href="<%#Eval("图片链接") %>"><img alt="" src="image/<%#Eval("图片名称") %>" style="width: 230px;height:200px;"  /></a></div>
                                                                     </ItemTemplate>
                                                        </asp:Repeater>
                                                            <%-- <div id="divrmkc">
                                                        
                                                    </div>--%>
                                                     </div>
                                                        
                                     </div>
                              </div>
                        </div>
                                                    
                                                </td>
                                                <td valign="top">
                                                    &nbsp;
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td width="75%" valign="top">
                                        <table width="100%" style="height: 100px; line-height: 25px">
                                            <tr>
                                                <td valign="top">
                                                    <div>
                                                        <b class="b1"></b><b class="b2 d1"></b><b class="b3 d1"></b><b class="b4 d1"></b>
                                                        <div class="b d1 k">
                                                            <center>
                                                                <table width="95%">
                                                                    <tr>
                                                                        <td align="left">
                                                                            <font size="4"><strong>新闻公告栏 </strong></font>
                                                                        </td>
                                                                        <td align="center" width="15%">
                                                                            <a href="KC/News.aspx" style="color: Black">更多>></a>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td colspan="2">
                                                                            <hr />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="center" colspan="2">
                                                                            <dx:ASPxGridView ID="gvNews" class="gvclass" runat="server" AutoGenerateColumns="False"
                                                                                DataSourceID="odsNews" KeyFieldName="新闻ID" Width="100%" EnableTheming="False"
                                                                                ClientInstanceName="cl_gvNews" SettingsPager-PageSize="7" Font-Names="华文细黑" Font-Size="Smaller">
                                                                                <SettingsBehavior AllowDragDrop="False" AllowGroup="False" AllowSort="False" />
                                                                                <Columns>
                                                                                    <dx:GridViewDataTextColumn FieldName="新闻标题" VisibleIndex="0">
                                                                                        <DataItemTemplate>
                                                                                            <li style="list-style-type: none;">●<a class="ahover" href='<%# "./KC/ViewNews.aspx?NewsID=" +  Eval("新闻ID") %>'
                                                                                                target="_blank" style="font-size: 15px; color: #698B22" title='<%#Eval("新闻标题")%>'>
                                                                                                <%# Eval("新闻标题").ToString().Length < 30 ? Eval("新闻标题") : Eval("新闻标题").ToString().Substring(0, 30) + "..."%></a>
                                                                                            </li>
                                                                                        </DataItemTemplate>
                                                                                    </dx:GridViewDataTextColumn>
                                                                                    <dx:GridViewDataDateColumn FieldName="最后更新时间" VisibleIndex="1" Width="15%">
                                                                                        <PropertiesDateEdit DisplayFormatString="[yyyy-MM-dd]">
                                                                                        </PropertiesDateEdit>
                                                                                        <CellStyle Font-Size="Larger">
                                                                                        </CellStyle>
                                                                                    </dx:GridViewDataDateColumn>
                                                                                </Columns>
                                                                                <SettingsPager PageSize="6" Visible="False">
                                                                                    <AllButton>
                                                                                        <Image ToolTip="显示全部">
                                                                                        </Image>
                                                                                    </AllButton>
                                                                                    <FirstPageButton>
                                                                                        <Image AlternateText="首页" ToolTip="首页">
                                                                                        </Image>
                                                                                    </FirstPageButton>
                                                                                    <LastPageButton>
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
                                                                                    <Summary Text="" />
                                                                                </SettingsPager>
                                                                                <Settings GridLines="None" ShowColumnHeaders="False"></Settings>
                                                                                <SettingsText EmptyDataRow="暂无新闻" />
                                                                                <Styles>
                                                                                    <EmptyDataRow BackColor="#F7F8F9">
                                                                                    </EmptyDataRow>
                                                                                    <Cell ForeColor="Black" HorizontalAlign="Left" VerticalAlign="Middle" BackColor="#F7F8F9">
                                                                                        <Border BorderStyle="None" />
                                                                                    </Cell>
                                                                                    <PagerBottomPanel BackColor="#F7F8F9" HorizontalAlign="Center">
                                                                                        <Border BorderStyle="None" />
                                                                                    </PagerBottomPanel>
                                                                                </Styles>
                                                                                <Border BorderStyle="None"></Border>
                                                                            </dx:ASPxGridView>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </center>
                                                            <asp:ObjectDataSource ID="odsNews" runat="server" OldValuesParameterFormatString="original_{0}"
                                                                SelectMethod="GetPubNews" TypeName="MainDataSetTableAdapters.TA_新闻表TableAdapter">
                                                            </asp:ObjectDataSource>
                                                        </div>
                                                        <b class="b4b d1"></b><b class="b3b d1"></b><b class="b2b d1"></b><b class="b1b">
                                                        </b>
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
                            <div>
                                <b class="b1"></b><b class="b2 d1"></b><b class="b3 d1"></b><b class="b4 d1"></b>
                                <div class="b d1">
                                    <table width="100%">
                                        <tr>
                                            <td width="25%" valign="top">
                                                <div class="pillar">
                                                    <b class="b1"></b><b class="b2"></b><b class="b3"></b><b class="b2"></b><b class="b4">
                                                    </b>
                                                    <div class="boxcontent">
                                                        <center>
                                                            <b><a style="color: white" href="KC/RMCourse.aspx">热门课程</a></b></center>
                                                    </div>
                                                    <b class="b4"></b><b class="b2"></b><b class="b3"></b><b class="b2"></b><b class="b1">
                                                    </b>
                                                </div>
                                                <%-- <a href='KC/KCinfo.aspx?KCID=<%#Eval("课程代码")%>'> <%#Eval("课程名称")%>
                                                        </a>--%>
                                                <div align="center">
                                                    <asp:Repeater ID="rptRMKC" runat="server" DataSourceID="odsRMKC" OnItemCommand="rptRMKC_ItemCommand">
                                                        <HeaderTemplate>
                                                            <table width="95%">
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <tr>
                                                                <td width="100%" style="font-size: small">
                                                                    <%-- <a href='KC/KCinfo.aspx?KCID=<%#Eval("课程代码")%>'> <%#Eval("课程名称")%>
                                                        </a>--%><center>
                                                            <asp:LinkButton ID="LinkButton1" Width="100%" runat="server" BorderColor="#6B8E23"
                                                                BorderWidth="1px" BackColor="#D9D9D9" CommandArgument='<%#Eval("课程代码")%>' ForeColor="#333333"
                                                                Height="18px"><%#Eval("课程名称")%></asp:LinkButton></center>
                                                                </td>
                                                            </tr>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <tr>
                                                                <td width="100%" style="font-size: small;">
                                                                    <center>
                                                                        <asp:LinkButton ID="LinkButton1" Width="100%" runat="server" BorderColor="#6B8E23"
                                                                            BorderWidth="1px" BackColor="#D9D9D9" PostBackUrl='~/KC/RMCourse.aspx' ForeColor="#333333"
                                                                            Height="18px">更多>></asp:LinkButton></center>
                                                                </td>
                                                            </tr>
                                                            </table><asp:Label ID="lblNull" runat="server" Text="" Visible='<%#bool.Parse((rptRMKC.Items.Count==0).ToString()) %>'></asp:Label></FooterTemplate>
                                                    </asp:Repeater>
                                                </div>
                                            </td>
                                            <td width="25%" valign="top">
                                                <div class="pillar">
                                                    <b class="b1"></b><b class="b2"></b><b class="b3"></b><b class="b2"></b><b class="b4">
                                                    </b>
                                                    <div class="boxcontent">
                                                        <center>
                                                            <b><a style="color: white" href="KC/JPKFCourse.aspx">精品开放课程</a></b></center>
                                                    </div>
                                                    <b class="b4"></b><b class="b2"></b><b class="b3"></b><b class="b2"></b><b class="b1">
                                                    </b>
                                                </div>
                                                <%#Eval("课程名称")%>
                                                <div align="center">
                                                    <asp:Repeater ID="rptJPKC" runat="server" DataSourceID="odsMooc" 
                                                        OnItemCommand="rptJPKC_ItemCommand">
                                                        <HeaderTemplate>
                                                            <table width="95%">
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                           
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <tr>
                                                                <td width="100%" style="font-size: small">
                                                                    <center>
                                                                        <asp:LinkButton ID="LinkButton1" Width="100%" runat="server" BorderColor="#6B8E23"
                                                                            BorderWidth="1px" BackColor="#D9D9D9" PostBackUrl='x.hubu.edu.cn' ForeColor="#333333"
                                                                            Height="18px">更多>></asp:LinkButton></center>
                                                                </td>
                                                            </tr>
                                                            </table><asp:Label ID="lblNull" runat="server" Text="" Visible='<%#bool.Parse((rptJPKC.Items.Count==0).ToString()) %>'></asp:Label></FooterTemplate>
                                                    </asp:Repeater>
                                            </td>
                                            <td width="25%" valign="top">
                                                <div class="pillar">
                                                    <b class="b1"></b><b class="b2"></b><b class="b3"></b><b class="b2"></b><b class="b4">
                                                    </b>
                                                    <div class="boxcontent">
                                                        <center>
                                                            <b><a style="color: white" href="KC/TSJYCourse.aspx">通识教育选修课</a></b></center>
                                                    </div>
                                                    <b class="b4"></b><b class="b2"></b><b class="b3"></b><b class="b2"></b><b class="b1">
                                                    </b>
                                                </div>
                                                <%-- <a href='KC/KCinfo.aspx?KCID=<%#Eval("课程代码")%>'> <%#Eval("课程名称")%>
                                                        </a>--%>
                                                <div align="center">
                                                    <asp:Repeater ID="rptTSKC" runat="server" DataSourceID="odsTSKC" OnItemCommand="rptTSKC_ItemCommand">
                                                        <HeaderTemplate>
                                                            <table width="95%">
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <tr>
                                                                <td width="100%" style="font-size: small">
                                                                    <%--<a href='KC/KCinfo.aspx?KCID=<%#Eval("课程代码")%>'> <%#Eval("课程名称")%>
                                                        </a>>--%><center>
                                                            <asp:LinkButton ID="LinkButton1" Width="100%" runat="server" BorderColor="#6B8E23"
                                                                BorderWidth="1px" BackColor="#D9D9D9" CommandArgument='<%#Eval("课程代码")%>' ForeColor="#333333"
                                                                Height="18px"><%#Eval("课程名称")%></asp:LinkButton></center>
                                                                </td>
                                                            </tr>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <tr>
                                                                <td width="100%" style="font-size: small">
                                                                    <center>
                                                                        <asp:LinkButton ID="LinkButton1" Width="100%" runat="server" BorderColor="#6B8E23"
                                                                            BorderWidth="1px" BackColor="#D9D9D9" PostBackUrl='~/KC/TSJYCourse.aspx' ForeColor="#333333"
                                                                            Height="18px">更多>></asp:LinkButton></center>
                                                                </td>
                                                            </tr>
                                                            </table><asp:Label ID="lblNull" runat="server" Text="" Visible='<%#bool.Parse((rptTSKC.Items.Count==0).ToString()) %>'></asp:Label></FooterTemplate>
                                                    </asp:Repeater>
                                                </div>
                                            </td>
                                            <td width="25%" valign="top">
                                                <div class="pillar">
                                                    <b class="b1"></b><b class="b2"></b><b class="b3"></b><b class="b2"></b><b class="b4">
                                                    </b>
                                                    <div class="boxcontent">
                                                        <center>
                                                            <b><a style="color: white" href="KC/XWYZCourse.aspx">校外优质课程</a></b></center>
                                                    </div>
                                                    <b class="b4"></b><b class="b2"></b><b class="b3"></b><b class="b2"></b><b class="b1">
                                                    </b>
                                                </div>
                                                <div align="center">
                                                    <asp:Repeater ID="rptJPSP" runat="server" DataSourceID="odsJPSP" OnItemCommand="rptJPSP_ItemCommand">
                                                        <HeaderTemplate>
                                                            <table width="95%">
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <tr>
                                                                <td width="100%" style="font-size: small">
                                                                    <center>
                                                                        <asp:LinkButton ID="LinkButton1" Width="100%" runat="server" BorderColor="#6B8E23"
                                                                            BorderWidth="1px" BackColor="#D9D9D9" CommandArgument='<%#Eval("优质课程代码")%>' ForeColor="#333333"
                                                                            Height="18px"><%#Eval("优质课程名称")%></asp:LinkButton>
                                                                        <%--<asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%#Eval("优质课程网址") %>' style=" border-color:#6B8E23; border-width:1px; background-color:#7bba35; color:#333333; width:100%"><%#Eval("优质课程名称")%></asp:HyperLink>
                                                                <a href='<%#Eval("优质课程网址") %>' style=" border-color:#6B8E23; border-width:1px; background-color:#7bba35; color:Black; width:150px"><%#Eval("优质课程名称")%></a>--%>
                                                                    </center>
                                                                </td>
                                                            </tr>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <tr>
                                                                <td width="100%" style="font-size: small">
                                                                    <center>
                                                                        <asp:LinkButton ID="LinkButton1" Width="100%" runat="server" BorderColor="#6B8E23"
                                                                            BorderWidth="1px" BackColor="#D9D9D9" PostBackUrl='~/KC/XWYZCourse.aspx' ForeColor="#333333"
                                                                            Height="18px">更多>></asp:LinkButton></center>
                                                                </td>
                                                            </tr>
                                                            </table><asp:Label ID="lblNull" runat="server" Text="" Visible='<%#bool.Parse((rptJPSP.Items.Count==0).ToString()) %>'></asp:Label></FooterTemplate>
                                                    </asp:Repeater>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <b class="b4b d1"></b><b class="b3b d1"></b><b class="b2b d1"></b><b class="b1b">
                                </b>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        <asp:ObjectDataSource ID="odsRMKC" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetRMKC" TypeName="MainDataSetTableAdapters.TA_课程信息表TableAdapter"
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
        <asp:ObjectDataSource ID="odsMooc" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetDataByCatID" 
            TypeName="ImageTableAdapters.TA_栏目图片表TableAdapter">
            <SelectParameters>
                <asp:Parameter DefaultValue="1" Name="id" Type="Object" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="odsTSKC" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetTSKC" TypeName="MainDataSetTableAdapters.TA_课程信息表TableAdapter">
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="odsJPSP" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="Gettop5Data" TypeName="DMDataSetTableAdapters.DM_优质课程TableAdapter">
        </asp:ObjectDataSource>
    </div>
   </asp:Content>