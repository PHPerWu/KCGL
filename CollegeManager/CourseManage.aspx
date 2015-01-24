<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CourseManage.aspx.cs" Inherits="CollegeManager_CourseManage" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxCallbackPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxLoadingPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxHiddenField" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxUploadControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script language="javascript" type="text/javascript" src="../Scripts/GridViewJs/gridView.js"></script>
    <script type="text/javascript" src="../Scripts/My97DatePicker/WdatePicker.js">  </script>
    <script language="javascript" type="text/javascript">
        function delConfirm(index) {
            if (confirm("确定删除此门课程？")) {
                cl_gvCourseInfo.DeleteRow(index);
                alert("删除成功");
            }
        }

        function selCollege(ckbCollege) {
            if (ckbCollege.GetItemCount() == ckbCollege.GetSelectedIndices().length) {
                cl_ckbForCollege.SetChecked(true);
            }
            else {
                cl_ckbForCollege.SetChecked(false);
            }
            cl_cbplCollege.PerformCallback(ckbCollege.GetSelectedValues().toString());
        }

        function selMajor(ckbMajor) {
            if (ckbMajor.GetItemCount() == ckbMajor.GetSelectedIndices().length) {
                cl_ckbForMajor.SetChecked(true);
            }
            else {
                cl_ckbForMajor.SetChecked(false);
            }
        }

        function sumCredit() {
            cl_txtTotalCredit.SetText(cl_speTeachCredit.GetNumber() + cl_spePracticeCredit.GetNumber() + cl_speTestCredit.GetNumber());
        }

        //        function setWebsite() {
        //            if (cl_ckbVideo.GetChecked() || cl_ckbResource.GetChecked()) {
        //                cl_txtWebsite.SetEnabled(true);
        //            }
        //            else {
        //                cl_txtWebsite.SetEnabled(false);
        //            }
        //        }

        function setCollege(s, sAim) {
            if (s.GetChecked()) {
                sAim.SelectAll();
            }
            else {
                sAim.UnselectAll();
                //cl_ckbForMajor.SetChecked(false);
            }
            cl_cbplCollege.PerformCallback(cl_ckbSelectCollege.GetSelectedValues().toString());
        }

        function setMajor(s, sAim) {
            if (!s.GetChecked()) {
                sAim.UnselectAll();
            }
            else {
                sAim.SelectAll();
            }
        }

        function setAllCollege(s) {
            if (s.GetValue() == "1") {
                cl_ckbForCollege.SetChecked(true);
                cl_ckbForMajor.SetChecked(true);
                cl_ckbSelectCollege.SelectAll();
                cl_cbplCollege.PerformCallback(cl_ckbSelectCollege.GetSelectedValues().toString() + "#$");
            }
            else {
                cl_cbplCollege.PerformCallback(cl_ckbSelectCollege.GetSelectedValues().toString());
            }
        }

        function trimStr(str) {
            return str.replace(/(^\s*)|(\s*$)/g, "");
        }

        function goUrl(s) {
            if (trimStr(s.GetText()) == "") {
                alert("请填写网址");
            }
            else {
                window.open(s.GetText());
            }
        }

        function frontIsBehind(s) {
            if (cl_cmbBehindCourse.GetSelectedIndex() != 0 && cl_cmbFrontCourse.GetSelectedIndex() != 0 && cl_cmbBehindCourse.GetValue() == cl_cmbFrontCourse.GetValue()) {
                cl_lblFBCourseErr.SetVisible(true);
                s.SetSelectedIndex(0);
            }
            else {
                cl_lblFBCourseErr.SetVisible(false);
            }
        }

        function ValidateCourse(s) {
            var str = s.GetText();
            if (str == "") {
                return;
            }
            //定义一个bool型变量
            var chk = true;
            if (chk) {
                //输入可能含有中文,所以将其解码
                var courseid = escape(str);
                //用于验证的后台页面
                var usrurl = "../Validate.aspx?CourseNewID=" + courseid;  // 注意url格式，有个“.”
                //获取从验证页面中异步传输过来的值
                var sta = GetResponseText(usrurl);
                //如果异步传输失败         
                if (sta == false) {
                    chk = true;
                    s.SetIsValid(true);
                    cl_btnSaveCourse.SetEnabled(true);
                }
                //异步传输成功
                else {
                    //假如传过来的值的开始位置是"regok",这个值是在验证页面Response.Write出来的值,如果是regok则表示验证通过,否则的话就是验证失败.
                    if (sta.indexOf("regok") != -1) {
                        //验证通过
                        chk = true;
                        //用于显示验证是否通过的详细信息加上刚刚所定义正确时的样式
                        s.SetIsValid(true);
                        cl_btnSaveCourse.SetEnabled(true);
                    }
                    else {
                        //验证未通过
                        chk = false;
                        //用于显示验证是否通过的详细信息加上刚刚所定义错误时的样式
                        s.SetIsValid(false);
                        s.SetErrorText("已存在");
                        cl_btnSaveCourse.SetEnabled(false);
                    }
                }
            } else {
                s.SetIsValid(false);
                s.SetErrorText("错误");
                cl_btnSaveCourse.SetEnabled(false);
            }
            return chk;
        }

        function GetResponseText(url) {
            //定义一个http_request变量
            var http_request;
            if (window.XMLHttpRequest) {
                //对于Mozilla、Netscape、Safari等浏览器，创建XMLHttpRequest对象
                http_request = new XMLHttpRequest();
                if (http_request.overrideMimeType) {
                    //如果服务器响应的header不是text/xml，可以调用其它方法修改该header
                    http_request.overrideMimeType('text/xml');
                }
            } else if (window.ActiveXObject) {
                // 对于Internet Explorer浏览器，创建XMLHttpRequest
                try {
                    http_request = new ActiveXObject("Msxml2.XMLHTTP");
                } catch (e) {
                    try {
                        http_request = new ActiveXObject("Microsoft.XMLHTTP");
                    } catch (e) { }
                }
            }
            //打开验证页面的地址
            http_request.open('GET', url, false);
            http_request.send(null);
            var requestdoc;
            if (http_request.readyState == 4) {
                // 收到完整的服务器响应
                if (http_request.status == 200 || http_request.status == 0) {
                    //HTTP服务器响应的值OK
                    requestdoc = http_request.responseText;  // responseText，注意大小写，千万不要写错
                }
                else {
                    requestdoc = "error";
                }
            }
            return requestdoc;
        }

        function selFBCollege(s) {
            cl_cbpFBCourse.PerformCallback(s.GetValue().toString());
        }

        function cl_btnSelect_Click(s, e) {
            if (cl_gvCourseInfo.IsCustomizationWindowVisible())
                cl_gvCourseInfo.HideCustomizationWindow();
            else
                cl_gvCourseInfo.ShowCustomizationWindow();
            UpdateButtonText();
        }
        function grid_CustomizationWindowCloseUp(s, e) {
            UpdateButtonText();
        }
        function UpdateButtonText() {
            var text = cl_gvCourseInfo.IsCustomizationWindowVisible() ? "隐藏" : "显示";
            text += "字段选择器";
            cl_btnSelect.SetText(text);
        }
    </script>
    <script type="text/javascript" language="javascript">
        //2014.1.8---Added By 任俊伟
        function xsInit(cmbXSType) {
            var t = cl_cmbXSType.GetValue();
            if (t == "学时") {
                cl_lblXSTitle.SetText("课程学时");
                cl_lblSum.SetText("总学时");
                cl_lblTeach.SetText("讲授学时");
                cl_lblTest.SetText("实验学时");
                cl_lblPrac.SetText("实践学时");
            }
            else {
                cl_lblXSTitle.SetText("课程周数");
                cl_lblSum.SetText("总周数");
                cl_lblTeach.SetText("讲授周数");
                cl_lblTest.SetText("实验周数");
                cl_lblPrac.SetText("实践周数");
            }
        }

        function changeXSType() {
            var xsSum = cl_txtTotalCredit.GetValue();
            if (xsSum != 0 && xsSum <= 18)  //学时类型为周
            {
                cl_cmbXSType.SetSelectedIndex(1);
                cl_lblXSTitle.SetText("课程周数");
                cl_lblSum.SetText("总周数");
                cl_lblTeach.SetText("讲授周数");
                cl_lblTest.SetText("实验周数");
                cl_lblPrac.SetText("实践周数");
            }
            else {
                cl_cmbXSType.SetSelectedIndex(0);
            }
        }
    </script>
    <style type="text/css">
        a
        {
            text-decoration: none;
            color: #585FFF;
        }
        a:hover
        {
            text-decoration: underline;
        }
        a:visited
        {
            color: #585FFF;
        }
        .style1
        {
            height: 40px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" 
        EnablePartialRendering="False">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel" runat="server">
        <ContentTemplate>
            <table>
                <tr>
                    <td>
                        <div>
                            <table width="100%">
                                <tr>
                                    <td align="right">
                                        <dx:ASPxButton ID="btnSelect" runat="server" Text="显示字段选择器" AutoPostBack="False"
                                            ClientInstanceName="cl_btnSelect">
                                            <ClientSideEvents Click="cl_btnSelect_Click" />
                                        </dx:ASPxButton>
                                    </td>
                                    <td align="right" width="80px">
                                        <dx:ASPxButton ID="btnExport" runat="server" Text="导出Excel" OnClick="btnExport_Click"
                                            AutoPostBack="true">
                                        </dx:ASPxButton>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div>
                            <dx:ASPxLoadingPanel ID="ldpalLoading" runat="server" ClientInstanceName="cl_ldpalLoading"
                                HorizontalAlign="Center" Text="加载中&amp;hellip;" VerticalAlign="Middle">
                            </dx:ASPxLoadingPanel>
                            <dx:ASPxHiddenField ID="hfdMajor" runat="server" ClientInstanceName="cl_hfdMajor">
                            </dx:ASPxHiddenField>
                            <dx:ASPxLabel ID="lblFile" runat="server" Text="ASPxLabel" Visible="False">
                            </dx:ASPxLabel>
                        </div>
                        <div>
                            <dx:ASPxGridView ID="gvCourseInfo" runat="server" Width="100%" AutoGenerateColumns="False"
                                ClientInstanceName="cl_gvCourseInfo" KeyFieldName="课程代码" OnInitNewRow="gvCourseInfo_InitNewRow"
                                OnRowInserting="gvCourseInfo_RowInserting" OnStartRowEditing="gvCourseInfo_StartRowEditing"
                                OnRowUpdating="gvCourseInfo_RowUpdating" DataSourceID="odsCourseInfo" 
                                Theme="Glass">
                                <Columns>
                                    <dx:GridViewDataTextColumn VisibleIndex="0" Caption="序号" Width="3px">
                                        <DataItemTemplate>
                                            <%# Container.ItemIndex+1 %>
                                        </DataItemTemplate>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="基本操作" VisibleIndex="0" Width="15%">
                                        <DataItemTemplate>
                                            <table>
                                                <tr>
                                                    <td>
                                                        <dx:ASPxButton ID="btnEditCourse" runat="server" CausesValidation="False" Text="修改"
                                                            ToolTip="修改当前课程信息" Width="50px" 
                                                            ClientSideEvents-Click='<%# "function(s, e) {cl_gvCourseInfo.StartEditRow(" + Container.VisibleIndex + ");e.processOnServer = false;}" %>' 
                                                            Theme="Default">
                                                        </dx:ASPxButton>
                                                    </td>
                                                    <td>
                                                        <dx:ASPxButton ID="btnFileManage" runat="server" CausesValidation="False" CommandArgument='<%# Eval("课程代码") %>'
                                                            Text="附件" ToolTip="上传教学计划和教学大纲" Width="50px" 
                                                            OnCommand="btnFileManage_Command" Theme="Default" AutoPostBack="false">
                                                            <ClientSideEvents Click="function(s, e) {
	cl_popupFile.Show();
}" />
                                                        </dx:ASPxButton>
                                                    </td>
                                                    <td width="70px">
                                                        <dx:ASPxButton ID="btnDeleteCourse" runat="server" CausesValidation="False" Text="删除"
                                                            ToolTip="删除该门课程" Width="50px" 
                                                            ClientSideEvents-Click='<%# "function(s, e) {delConfirm(" + Container.VisibleIndex + ");e.processOnServer = false;}" %>' 
                                                            Theme="Default">
                                                        </dx:ASPxButton>
                                                    </td>
                                                </tr>
                                            </table>
                                        </DataItemTemplate>
                                        <CellStyle HorizontalAlign="Center">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn VisibleIndex="0" FieldName="课程代码" ReadOnly="True" Settings-AllowSort="True">
                                        <Settings AllowSort="True" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn VisibleIndex="1" FieldName="开课学院名称" Visible="True" Caption="开课学院">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn VisibleIndex="0" FieldName="先修课程名称" Visible="False">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn VisibleIndex="0" FieldName="后续课程名称" Visible="False">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataComboBoxColumn FieldName="课程性质" VisibleIndex="5">
                                        <PropertiesComboBox DataSourceID="odsCourseProperty" TextField="代码含义" ValueField="代码ID">
                                        </PropertiesComboBox>
                                        <Settings AllowHeaderFilter="True" HeaderFilterMode="CheckedList" />
                                    </dx:GridViewDataComboBoxColumn>
                                    <dx:GridViewDataComboBoxColumn FieldName="课程类别" VisibleIndex="3">
                                        <PropertiesComboBox DataSourceID="odsCourseType" TextField="代码含义" ValueField="代码ID">
                                        </PropertiesComboBox>
                                        <Settings AllowHeaderFilter="True" HeaderFilterMode="CheckedList" />
                                    </dx:GridViewDataComboBoxColumn>
                                    <dx:GridViewDataCheckColumn FieldName="双学位课程" VisibleIndex="14">
                                        <PropertiesCheckEdit DisplayTextChecked="是" DisplayTextUnchecked="否" ValueChecked="1"
                                            ValueType="System.Int32" ValueUnchecked="0">
                                        </PropertiesCheckEdit>
                                        <Settings AllowHeaderFilter="True" HeaderFilterMode="CheckedList" />
                                    </dx:GridViewDataCheckColumn>
                                    <dx:GridViewDataTextColumn FieldName="总学时" VisibleIndex="10">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="讲授学时" VisibleIndex="11">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="实践学时" VisibleIndex="12">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="精品课程网址" VisibleIndex="17">
                                        <DataItemTemplate>
                                            <a href='<%# Eval("精品课程网址") %>' target="_blank" style="font-size: small" title='<%#Eval("精品课程网址")%>'>
                                                <%# Eval("精品课程网址").ToString().Length < 30 ? Eval("精品课程网址") : Eval("精品课程网址").ToString().Substring(0, 30) + "..."%></a>
                                        </DataItemTemplate>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="开课学院" VisibleIndex="23" Visible="False">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataComboBoxColumn FieldName="开课学期" VisibleIndex="9">
                                        <PropertiesComboBox DataSourceID="odsOpenTerm" TextField="代码含义" ValueField="代码ID">
                                        </PropertiesComboBox>
                                        <Settings AllowHeaderFilter="True" HeaderFilterMode="CheckedList" />
                                    </dx:GridViewDataComboBoxColumn>
                                    <dx:GridViewDataTextColumn FieldName="先修课程" VisibleIndex="24" Visible="False">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="使用教材" VisibleIndex="25" Visible="False">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataCheckColumn FieldName="精品视频公开课" VisibleIndex="15">
                                        <PropertiesCheckEdit DisplayTextChecked="是" DisplayTextUnchecked="否" ValueChecked="1"
                                            ValueType="System.Int32" ValueUnchecked="0">
                                        </PropertiesCheckEdit>
                                        <Settings AllowHeaderFilter="True" HeaderFilterMode="CheckedList" />
                                    </dx:GridViewDataCheckColumn>
                                    <dx:GridViewDataTextColumn FieldName="课程图片" VisibleIndex="0">
                                        <DataItemTemplate>
                                                        <dx:ASPxImage ID="ASPxImage1" runat="server" Height="45px" ImageUrl='<%# Eval("课程图片").ToString()!=""?Eval("课程图片"):"~/image/public/noup.jpg" %>'
                                                            Width="45px">
                                                        </dx:ASPxImage>
                                        </DataItemTemplate>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="课程名称" VisibleIndex="0">
                                    <DataItemTemplate>
                                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text='<%# Eval("课程名称") %>'>
                                    </dx:ASPxLabel>
                                    </DataItemTemplate>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="后续课程" VisibleIndex="26" Visible="False">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="课程学分" VisibleIndex="2">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataComboBoxColumn FieldName="考核方式" VisibleIndex="7">
                                        <PropertiesComboBox DataSourceID="odsTestType" TextField="代码含义" ValueField="代码ID">
                                        </PropertiesComboBox>
                                        <Settings AllowHeaderFilter="True" HeaderFilterMode="CheckedList" />
                                    </dx:GridViewDataComboBoxColumn>
                                    <dx:GridViewDataComboBoxColumn FieldName="教学方式" VisibleIndex="8">
                                        <PropertiesComboBox DataSourceID="odsTeachType" TextField="代码含义" ValueField="代码ID">
                                        </PropertiesComboBox>
                                        <Settings AllowHeaderFilter="True" HeaderFilterMode="CheckedList" />
                                    </dx:GridViewDataComboBoxColumn>
                                    <dx:GridViewDataTextColumn FieldName="主要参考书目" VisibleIndex="27" Visible="False">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataCheckColumn FieldName="精品资源共享课" VisibleIndex="16">
                                        <PropertiesCheckEdit DisplayTextChecked="是" DisplayTextUnchecked="否" ValueChecked="1"
                                            ValueType="System.Int32" ValueUnchecked="0">
                                        </PropertiesCheckEdit>
                                        <Settings AllowHeaderFilter="True" HeaderFilterMode="CheckedList" />
                                    </dx:GridViewDataCheckColumn>
                                    <dx:GridViewDataTextColumn FieldName="评分" VisibleIndex="28" Visible="False">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="已评分人数" VisibleIndex="29" Visible="False">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="实验学时" VisibleIndex="13">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="课程点击量" VisibleIndex="30" Visible="False">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataComboBoxColumn FieldName="课程级别" VisibleIndex="4">
                                        <PropertiesComboBox DataSourceID="odsCourseLevel" TextField="代码含义" ValueField="代码ID">
                                        </PropertiesComboBox>
                                        <Settings AllowHeaderFilter="True" HeaderFilterMode="CheckedList" />
                                    </dx:GridViewDataComboBoxColumn>
                                    <dx:GridViewDataComboBoxColumn FieldName="面向对象" VisibleIndex="6">
                                        <PropertiesComboBox DataSourceID="odsCourseOO" TextField="代码含义" ValueField="代码ID">
                                        </PropertiesComboBox>
                                        <Settings AllowHeaderFilter="True" HeaderFilterMode="CheckedList" />
                                    </dx:GridViewDataComboBoxColumn>
                                    <dx:GridViewDataTextColumn FieldName="立项级别" Visible="False" VisibleIndex="19">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="立项年度" Visible="False" VisibleIndex="20">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="课程负责人" Visible="False" VisibleIndex="21">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="课程描述" Visible="False" VisibleIndex="22">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="课程图片" FieldName="课程图片" Visible="False" VisibleIndex="18">
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                <SettingsBehavior AllowSort="False" AllowGroup="False" EnableCustomizationWindow="True" />
                                <SettingsPager>
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
                                </SettingsPager>
                                <Settings ShowTitlePanel="True" ShowFilterRow="True" ShowFilterRowMenu="True" />
                                <SettingsText HeaderFilterCancelButton="取消" HeaderFilterOkButton="确定" HeaderFilterSelectAll="选择全部"
                                    HeaderFilterShowAll="显示全部" HeaderFilterShowBlanks="显示空数据" HeaderFilterShowNonBlanks="显示非空数据" />
                                <SettingsLoadingPanel Text="加载中&amp;hellip;" />
                                <SettingsDetail AllowOnlyOneMasterRowExpanded="True" />
                                <SettingsPopup>
                                    <HeaderFilter Height="180px" MinHeight="180px" />
                                    <EditForm AllowResize="True" HorizontalAlign="WindowCenter" VerticalAlign="WindowCenter"
                                        Modal="True" MinWidth="900px" MinHeight="600px" />
                                </SettingsPopup>
                                <Styles>
                                    <Header HorizontalAlign="Center">
                                    </Header>
                                    <AlternatingRow Enabled="True">
                                    </AlternatingRow>
                                    <Cell HorizontalAlign="Center">
                                    </Cell>
                                    <TitlePanel Font-Bold="True" Font-Size="Medium">
                                    </TitlePanel>
                                </Styles>
                                <Templates>
                                    <TitlePanel>
                                        <table width="100%">
                                            <tr>
                                                <td align="left" width="100px">
                                                    <dx:ASPxButton ID="btnAddCourse" runat="server" CausesValidation="False" Text="新增课程信息"
                                                        ToolTip="新增一门课程信息" Width="100px">
                                                        <ClientSideEvents Click="function(s, e) {addInfo(cl_gvCourseInfo, e); }" />
                                                    </dx:ASPxButton>
                                                </td>
                                                <td align="center">
                                                    课程信息管理
                                                </td>
                                                <td width="100px">
                                                    &nbsp;
                                                </td>
                                            </tr>
                                        </table>
                                    </TitlePanel>
                                    <EditForm>
                                        <table width="900px">
                                            <tr>
                                                <td colspan="6">
                                                    &nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" style="font-weight: bold;" width="100px">
                                                    课程代码：
                                                </td>
                                                <td>
                                                    <dx:ASPxTextBox ID="txtCourseID" runat="server" Width="170px" NullText="必填" ToolTip="请输入课程代码"
                                                        Text='<%# Bind("课程代码") %>' ClientInstanceName="cl_txtCourseID">
                                                        <ValidationSettings Display="Dynamic" SetFocusOnError="True" ValidationGroup="btnSaveCourse">
                                                            <RequiredField ErrorText="不能为空" IsRequired="True" />
                                                        </ValidationSettings>
                                                        <ClientSideEvents LostFocus="function(s, e) {ValidateCourse(s);}" />
                                                    </dx:ASPxTextBox>
                                                </td>
                                                <td align="right" style="font-weight: bold;" width="100px">
                                                    课程名称：
                                                </td>
                                                <td>
                                                    <dx:ASPxTextBox ID="txtCourseName" runat="server" Width="170px" NullText="必填" ToolTip="请输入课程名称"
                                                        Text='<%# Bind("课程名称") %>'>
                                                        <ValidationSettings Display="Dynamic" SetFocusOnError="True" ValidationGroup="btnSaveCourse">
                                                            <RequiredField ErrorText="不能为空" IsRequired="True" />
                                                        </ValidationSettings>
                                                    </dx:ASPxTextBox>
                                                </td>
                                                <td align="right" style="font-weight: bold;" width="100px">
                                                    课程学分：
                                                </td>
                                                <td>
                                                    <dx:ASPxSpinEdit ID="speCredit" runat="server" Height="21px" Value='<%# Bind("课程学分") %>'
                                                        AllowNull="False" ToolTip="请输入正实数" Increment="0.5">
                                                        <ValidationSettings ValidationGroup="btnSaveCourse" SetFocusOnError="True" Display="Dynamic">
                                                            <RegularExpression ErrorText="请输入正实数" ValidationExpression="^(\+)?[0-9]{1}\.5|^(\+)?[1-9]{1}$" />
                                                            <RequiredField IsRequired="True" ErrorText="不能为空" />
                                                        </ValidationSettings>
                                                    </dx:ASPxSpinEdit>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" style="font-weight: bold;" width="100px">
                                                    学时类型：
                                                </td>
                                                <td>
                                                    <dx:ASPxComboBox ID="cmbXSType" runat="server" ToolTip="请选择学时类型" ClientInstanceName="cl_cmbXSType">
                                                        <ClientSideEvents SelectedIndexChanged="function(s, e) {
	xsInit(s);
}" />
                                                        <Items>
                                                            <dx:ListEditItem Text="学时" Value="学时" />
                                                            <dx:ListEditItem Text="周" Value="周" />
                                                        </Items>
                                                    </dx:ASPxComboBox>
                                                </td>
                                                <td align="right" style="font-weight: bold;" width="100px">
                                                    开课学期：
                                                </td>
                                                <td>
                                                    <dx:ASPxComboBox ID="cmbOpenTerm" runat="server" DataSourceID="odsOpenTerm" DropDownRows="9"
                                                        TextField="代码含义" ToolTip="请选择开课学期" Value='<%# Bind("开课学期") %>' ValueField="代码ID"
                                                        ValueType="System.String">
                                                        <ValidationSettings Display="Dynamic" SetFocusOnError="True" ValidationGroup="btnSaveCourse">
                                                            <RequiredField ErrorText="请选择具体项" IsRequired="True" />
                                                        </ValidationSettings>
                                                    </dx:ASPxComboBox>
                                                </td>
                                                <td align="right" style="font-weight: bold;" width="100px">
                                                    &nbsp;
                                                </td>
                                                <td>
                                                    &nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right">
                                                    <table cellpadding="0" cellspacing="0">
                                                        <tr>
                                                            <td width="100px">
                                                                &nbsp;
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right" style="font-weight: bold;">
                                                                <dx:ASPxLabel ID="lblXSTitle" runat="server" Text="课程学时：" Font-Bold="True" Font-Size="12px"
                                                                    ClientInstanceName="cl_lblXSTitle">
                                                                </dx:ASPxLabel>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                &nbsp;
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                                <td colspan="3">
                                                    <table cellpadding="0" cellspacing="0">
                                                        <tr>
                                                            <td align="center">
                                                                <dx:ASPxLabel ID="lblSum" runat="server" Text="总学时" ClientInstanceName="cl_lblSum">
                                                                </dx:ASPxLabel>
                                                            </td>
                                                            <td>
                                                                &nbsp;
                                                            </td>
                                                            <td align="center">
                                                                <dx:ASPxLabel ID="lblTeach" runat="server" Text="讲授学时" ClientInstanceName="cl_lblTeach">
                                                                </dx:ASPxLabel>
                                                            </td>
                                                            <td>
                                                                &nbsp;
                                                            </td>
                                                            <td align="center">
                                                                <dx:ASPxLabel ID="lblTest" runat="server" Text="实验学时" ClientInstanceName="cl_lblTest">
                                                                </dx:ASPxLabel>
                                                            </td>
                                                            <td>
                                                                &nbsp;
                                                            </td>
                                                            <td align="center">
                                                                <dx:ASPxLabel ID="lblPrac" runat="server" Text="实践学时" ClientInstanceName="cl_lblPrac">
                                                                </dx:ASPxLabel>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td rowspan="2" valign="top" align="center">
                                                                <dx:ASPxTextBox ID="txtTotalCredit" runat="server" Width="50px" ClientInstanceName="cl_txtTotalCredit"
                                                                    Text='<%# Bind("总学时") %>' ToolTip="无需填写，由后3项累加所得" ReadOnly="True" Border-BorderColor="Black"
                                                                    BackColor="#F7F7F7">
                                                                    <ClientSideEvents Init="function(s, e) {
	changeXSType();
}" />
                                                                    <ValidationSettings Display="Dynamic" ErrorTextPosition="Bottom" SetFocusOnError="True"
                                                                        ValidationGroup="btnSaveCourse">
                                                                        <RegularExpression ErrorText="请确保为正数" ValidationExpression="^[1-9]\d*$" />
                                                                    </ValidationSettings>
                                                                    <Border BorderColor="Black" />
                                                                </dx:ASPxTextBox>
                                                            </td>
                                                            <td align="center" style="width: 30px;">
                                                                =
                                                            </td>
                                                            <td rowspan="2" valign="top">
                                                                <dx:ASPxSpinEdit ID="speTeachCredit" runat="server" AllowNull="False" ClientInstanceName="cl_speTeachCredit"
                                                                    Height="21px" Value='<%# Bind("讲授学时") %>' NumberType="Integer" ToolTip="请输入非负整数"
                                                                    Width="100px">
                                                                    <ClientSideEvents NumberChanged="function(s, e) {
	sumCredit();
}" />
                                                                    <ValidationSettings Display="Dynamic" ErrorTextPosition="Bottom" SetFocusOnError="True"
                                                                        ValidationGroup="btnSaveCourse">
                                                                        <RegularExpression ErrorText="请输入非负整数" ValidationExpression="^[1-9]\d*|0$" />
                                                                        <RequiredField ErrorText="不能为空" IsRequired="True" />
                                                                    </ValidationSettings>
                                                                </dx:ASPxSpinEdit>
                                                            </td>
                                                            <td align="center" style="width: 30px;">
                                                                +
                                                            </td>
                                                            <td align="center" rowspan="2" valign="top">
                                                                <dx:ASPxSpinEdit ID="speTestCredit" runat="server" AllowNull="False" ClientInstanceName="cl_speTestCredit"
                                                                    Height="21px" Value='<%# Bind("实验学时") %>' NumberType="Integer" ToolTip="请输入非负整数"
                                                                    Width="100px">
                                                                    <ClientSideEvents NumberChanged="function(s, e) {
	sumCredit();
}" />
                                                                    <ValidationSettings Display="Dynamic" ErrorTextPosition="Bottom" SetFocusOnError="True"
                                                                        ValidationGroup="btnSaveCourse">
                                                                        <RegularExpression ErrorText="请输入非负整数" ValidationExpression="^[1-9]\d*|0$" />
                                                                        <RequiredField ErrorText="不能为空" IsRequired="True" />
                                                                    </ValidationSettings>
                                                                </dx:ASPxSpinEdit>
                                                            </td>
                                                            <td align="center" style="width: 30px;">
                                                                +
                                                            </td>
                                                            <td align="center" rowspan="2" valign="top">
                                                                <dx:ASPxSpinEdit ID="spePracticeCredit" runat="server" AllowNull="False" ClientInstanceName="cl_spePracticeCredit"
                                                                    Height="21px" Value='<%# Bind("实践学时") %>' NumberType="Integer" ToolTip="请输入非负整数"
                                                                    Width="100px">
                                                                    <ClientSideEvents NumberChanged="function(s, e) {
	sumCredit();
}" />
                                                                    <ValidationSettings Display="Dynamic" ErrorTextPosition="Bottom" SetFocusOnError="True"
                                                                        ValidationGroup="btnSaveCourse">
                                                                        <RegularExpression ErrorText="请输入非负整数" ValidationExpression="^[1-9]\d*|0$" />
                                                                        <RequiredField ErrorText="不能为空" IsRequired="True" />
                                                                    </ValidationSettings>
                                                                </dx:ASPxSpinEdit>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                &nbsp;
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                                <td align="right" style="font-weight: bold;" width="110px">
                                                    &nbsp;
                                                </td>
                                                <td>
                                                    &nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" style="font-weight: bold;" width="100px">
                                                    课程性质：
                                                </td>
                                                <td>
                                                    <dx:ASPxComboBox ID="cmbCourseProperty" runat="server" ToolTip="请选择课程性质" DataSourceID="odsCourseProperty"
                                                        Value='<%# Bind("课程性质") %>' TextField="代码含义" ValueField="代码ID" ValueType="System.String">
                                                        <ValidationSettings Display="Dynamic" SetFocusOnError="True" ValidationGroup="btnSaveCourse">
                                                            <RequiredField ErrorText="请选择具体项" IsRequired="True" />
                                                        </ValidationSettings>
                                                    </dx:ASPxComboBox>
                                                </td>
                                                <td align="right" style="font-weight: bold;" width="100px">
                                                    考核方式：
                                                </td>
                                                <td>
                                                    <dx:ASPxComboBox ID="cmbTestType" runat="server" ToolTip="请选择考核方式" DataSourceID="odsTestType"
                                                        Value='<%# Bind("考核方式") %>' TextField="代码含义" ValueField="代码ID" ValueType="System.String">
                                                        <ValidationSettings Display="Dynamic" SetFocusOnError="True" ValidationGroup="btnSaveCourse">
                                                            <RequiredField ErrorText="请选择具体项" IsRequired="True" />
                                                        </ValidationSettings>
                                                    </dx:ASPxComboBox>
                                                </td>
                                                <td align="right" style="font-weight: bold;" width="100px">
                                                    课程级别：
                                                </td>
                                                <td>
                                                    <dx:ASPxComboBox ID="cmbCourseLevel" runat="server" ToolTip="请选择课程级别" DataSourceID="odsCourseLevel"
                                                        Value='<%# Bind("课程级别") %>' TextField="代码含义" ValueField="代码ID" ValueType="System.String">
                                                        <ValidationSettings Display="Dynamic" SetFocusOnError="True" ValidationGroup="btnSaveCourse">
                                                            <RequiredField ErrorText="请选择具体项" IsRequired="True" />
                                                        </ValidationSettings>
                                                    </dx:ASPxComboBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" style="font-weight: bold;" width="100px">
                                                    课程类别：
                                                </td>
                                                <td>
                                                    <dx:ASPxComboBox ID="cmbCourseType" runat="server" ToolTip="请选择课程类别" DataSourceID="odsCourseType"
                                                        Value='<%# Bind("课程类别") %>' TextField="代码含义" ValueField="代码ID" ValueType="System.String">
                                                        <ValidationSettings Display="Dynamic" SetFocusOnError="True" ValidationGroup="btnSaveCourse">
                                                            <RequiredField ErrorText="请选择具体项" IsRequired="True" />
                                                        </ValidationSettings>
                                                        <ClientSideEvents SelectedIndexChanged="function(s, e) {
	setAllCollege(s);
}" />
                                                    </dx:ASPxComboBox>
                                                </td>
                                                <td align="right" style="font-weight: bold;" width="100px">
                                                    教学方式：
                                                </td>
                                                <td>
                                                    <dx:ASPxComboBox ID="cmbTeachType" runat="server" ToolTip="请选择教学方式" DataSourceID="odsTeachType"
                                                        Value='<%# Bind("教学方式") %>' TextField="代码含义" ValueField="代码ID" ValueType="System.String">
                                                        <ValidationSettings Display="Dynamic" SetFocusOnError="True" ValidationGroup="btnSaveCourse">
                                                            <RequiredField ErrorText="请选择具体项" IsRequired="True" />
                                                        </ValidationSettings>
                                                    </dx:ASPxComboBox>
                                                </td>
                                                <td align="right" style="font-weight: bold;" width="100px">
                                                    面向对象：
                                                </td>
                                                <td>
                                                    <dx:ASPxComboBox ID="cmbCourseOO" runat="server" ToolTip="请选择面向对象" DataSourceID="odsCourseOO"
                                                        Value='<%# Bind("面向对象") %>' TextField="代码含义" ValueField="代码ID" ValueType="System.String">
                                                        <ValidationSettings Display="Dynamic" SetFocusOnError="True" ValidationGroup="btnSaveCourse">
                                                            <RequiredField ErrorText="请选择具体项" IsRequired="True" />
                                                        </ValidationSettings>
                                                    </dx:ASPxComboBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="6">
                                                    &nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" style="font-weight: bold;" width="100px">
                                                    使用教材：
                                                </td>
                                                <td rowspan="2">
                                                    <dx:ASPxMemo ID="memoTeachBook" runat="server" Height="71px" Width="170px" ToolTip="请填写使用教材"
                                                        Text='<%# Bind("使用教材") %>'>
                                                        <ValidationSettings Display="Dynamic" SetFocusOnError="True" ValidationGroup="btnSaveCourse">
                                                            <RequiredField ErrorText="不能为空" />
                                                        </ValidationSettings>
                                                    </dx:ASPxMemo>
                                                    <td align="right" style="font-weight: bold;" width="100px">
                                                        开课学院：
                                                    </td>
                                                    <td>
                                                        <dx:ASPxComboBox ID="cmbOpenCollege" runat="server" DataSourceID="odsCollege" DropDownRows="10"
                                                            TextField="学院名称" ToolTip="请选择开课学院" Value='<%# Bind("开课学院") %>' ValueField="学院ID">
                                                            <ClientSideEvents SelectedIndexChanged="function(s, e) {
	selFBCollege(s);
}" />
                                                            <ValidationSettings Display="Dynamic" SetFocusOnError="True" ValidationGroup="btnSaveCourse">
                                                                <RequiredField ErrorText="请选择具体项" IsRequired="True" />
                                                            </ValidationSettings>
                                                        </dx:ASPxComboBox>
                                                    </td>
                                                </td>
                                                <td rowspan="3" colspan="2">
                                                    <dx:ASPxCallbackPanel ID="cbpFBCourse" runat="server" ClientInstanceName="cl_cbpFBCourse"
                                                        OnCallback="cbpFBCourse_Callback">
                                                        <PanelCollection>
                                                            <dx:PanelContent ID="PanelContent1" runat="server" SupportsDisabledAttribute="True">
                                                                <table width="100%" cellpadding="0" cellspacing="0">
                                                                    <tr>
                                                                        <td align="right" style="font-weight: bold;" width="100px">
                                                                            先修课程：
                                                                        </td>
                                                                        <td>
                                                                            <dx:ASPxComboBox ID="cmbFrontCourse" runat="server" ToolTip="请选择先修课程，没有则不选" DataSourceID="odsFBCourse"
                                                                                TextField="课程名称" ValueField="课程代码" ClientInstanceName="cl_cmbFrontCourse" ValueType="System.String"
                                                                                OnDataBound="cmbFrontCourse_DataBound">
                                                                                <ClientSideEvents SelectedIndexChanged="function(s, e) { frontIsBehind(s); }" />
                                                                            </dx:ASPxComboBox>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td colspan="2" align="center">
                                                                            &nbsp;<dx:ASPxLabel ID="lblFBCourseErr" runat="server" Text="*先修课程和后续课程不能相同" ForeColor="Red"
                                                                                ClientInstanceName="cl_lblFBCourseErr" ClientVisible="False">
                                                                            </dx:ASPxLabel>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="right" style="font-weight: bold;" width="100px">
                                                                            后续课程：
                                                                        </td>
                                                                        <td>
                                                                            <dx:ASPxComboBox ID="cmbBehindCourse" runat="server" ToolTip="请选择后续课程，没有则不选" DataSourceID="odsFBCourse"
                                                                                TextField="课程名称" ValueField="课程代码" ClientInstanceName="cl_cmbBehindCourse" ValueType="System.String"
                                                                                OnDataBound="cmbBehindCourse_DataBound">
                                                                                <ClientSideEvents SelectedIndexChanged="function(s, e) { frontIsBehind(s); }" />
                                                                            </dx:ASPxComboBox>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </dx:PanelContent>
                                                        </PanelCollection>
                                                    </dx:ASPxCallbackPanel>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    &nbsp;
                                                </td>
                                                <td colspan="2">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" style="font-weight: bold;" width="100px" class="style1">
                                                    主要参考书目：
                                                </td>
                                                <td rowspan="2">
                                                    <dx:ASPxMemo ID="memoRefeBook" runat="server" Height="71px" Width="170px" ToolTip="请填写主要参考书目"
                                                        Text='<%# Bind("主要参考书目") %>'>
                                                        <ValidationSettings Display="Dynamic" SetFocusOnError="True" ValidationGroup="btnSaveCourse">
                                                            <RequiredField ErrorText="不能为空" />
                                                        </ValidationSettings>
                                                    </dx:ASPxMemo>
                                                </td>
                                                <td colspan="4" class="style1">
                                                    <table cellpadding="0" cellspacing="0" width="100%">
                                                        <tr>
                                                            <td width="6%">
                                                                &nbsp;
                                                            </td>
                                                            <td width="30%">
                                                                <dx:ASPxCheckBox ID="ckbVideo" runat="server" CheckState="Unchecked" ClientInstanceName="cl_ckbVideo"
                                                                    Font-Bold="True" Text="是否为精品视频公开课" ToolTip="是-选中，否-不选" Value='<%# Bind("精品视频公开课") %>'
                                                                    ValueChecked="1" ValueType="System.Int32" ValueUnchecked="0">
                                                                </dx:ASPxCheckBox>
                                                            </td>
                                                            <td align="left" style="font-weight: bold;" width="30%">
                                                                <dx:ASPxCheckBox ID="ckbResource" runat="server" CheckState="Unchecked" Text="是否为精品资源共享课"
                                                                    ClientInstanceName="cl_ckbResource" ValueChecked="1" ValueType="System.Int32"
                                                                    ValueUnchecked="0" Font-Bold="True" ToolTip="是-选中，否-不选" Value='<%# Bind("精品资源共享课") %>'>
                                                                </dx:ASPxCheckBox>
                                                            </td>
                                                            <td align="left" style="font-weight: bold;">
                                                                <dx:ASPxCheckBox ID="ckbDDegree" runat="server" CheckState="Unchecked" Font-Bold="True"
                                                                    Text="是否为双学位课程" ToolTip="是-选中，否-不选" Value='<%# Bind("双学位课程") %>' ValueChecked="1"
                                                                    ValueType="System.Int32" ValueUnchecked="0">
                                                                </dx:ASPxCheckBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="4">
                                                                <table runat="server" class="style1">
                                                                    <tr>
                                                                        <td align="right">
                                                                            <strong>立项级别:</strong>
                                                                        </td>
                                                                        <td>
                                                                            <dx:ASPxComboBox ID="ASPxComboBox1" runat="server" DataSourceID="odsLXJB" TextField="代码含义"
                                                                                ValueField="代码ID" Width="150px" Value='<%# Bind("立项级别") %>'>
                                                                                <ClientSideEvents Validation="function(s, e) {
	if((cl_ckbVideo.GetChecked()==true||cl_ckbResource.GetChecked()==true)&amp;&amp;s.GetText()==&quot;&quot;)
    e.isValid=false;
    else
    e.isValid=true;
}" />
                                                                                <ValidationSettings ValidationGroup="btnSaveCourse">
                                                                                    <RequiredField ErrorText="请选择" IsRequired="True" />
                                                                                </ValidationSettings>
                                                                            </dx:ASPxComboBox>
                                                                        </td>
                                                                        <td align="right">
                                                                            <strong>立项年度:</strong>
                                                                        </td>
                                                                        <td>
                                                                            <dx:ASPxTextBox ID="startTime" runat="server" ClientInstanceName="startTime" Width="150px"
                                                                                Value='<%# Bind("立项年度") %>'>
                                                                                <ClientSideEvents GotFocus="function(s, e) {
WdatePicker({dateFmt:'yyyy'});
}" Validation="function(s, e) {
	if((cl_ckbVideo.GetChecked()==true||cl_ckbResource.GetChecked()==true)&amp;&amp;s.GetText()==&quot;&quot;)
    e.isValid=false;
    else
    e.isValid=true;
}" />
                                                                                <ValidationSettings ValidationGroup="btnSaveCourse">
                                                                                    <RequiredField ErrorText="请选择" IsRequired="True" />
                                                                                </ValidationSettings>
                                                                            </dx:ASPxTextBox>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="right">
                                                                            <strong>课程负责人:</strong>
                                                                        </td>
                                                                        <td>
                                                                            <dx:ASPxTextBox ID="ASPxTextBox2" runat="server" Width="150px" Text='<%# Bind("课程负责人") %>'>
                                                                                <ClientSideEvents Validation="function(s, e) {
	if((cl_ckbVideo.GetChecked()==true||cl_ckbResource.GetChecked()==true)&amp;&amp;s.GetText()==&quot;&quot;)
    e.isValid=false;
    else
    e.isValid=true;
}" />
                                                                                <ValidationSettings ValidationGroup="btnSaveCourse">
                                                                                    <RequiredField ErrorText="请填写" IsRequired="True" />
                                                                                </ValidationSettings>
                                                                            </dx:ASPxTextBox>
                                                                        </td>
                                                                        <td align="right">
                                                                            <strong>课程描述:</strong>
                                                                        </td>
                                                                        <td>
                                                                            <dx:ASPxMemo ID="ASPxMemo1" runat="server" Height="71px" Width="150px" Text='<%# Bind("课程描述") %>'>
                                                                                <ValidationSettings ValidationGroup="btnSaveCourse">
                                                                                </ValidationSettings>
                                                                            </dx:ASPxMemo>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    &nbsp;
                                                </td>
                                                <td align="right" style="font-weight: bold;" width="100px">
                                                    精品课程网址：
                                                </td>
                                                <td colspan="3">
                                                    <dx:ASPxButtonEdit ID="btnWebsite" runat="server" Width="450px" NullText="只有勾选为精品课才需填写网址，否则填写无效"
                                                        ToolTip="只有勾选为精品课才需填写网址，否则填写无效" Text='<%# Bind("精品课程网址") %>' MaxLength="500">
                                                        <Buttons>
                                                            <dx:EditButton Text="看看去" ToolTip="点击打开左侧网址">
                                                            </dx:EditButton>
                                                        </Buttons>
                                                        <ClientSideEvents ButtonClick="function(s, e) {	goUrl(s);}" />
                                                        <ClientSideEvents GotFocus="function(s, e) {if(trimStr(s.GetText())==''){s.SetText('http://');s.SetCaretPosition(8);}}" />
                                                        <ValidationSettings Display="Dynamic" SetFocusOnError="True" ValidationGroup="btnSaveCourse">
                                                            <RegularExpression ErrorText="请输入合法网址" ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?" />
                                                        </ValidationSettings>
                                                    </dx:ASPxButtonEdit>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="6">
                                                    <table>
                                                        <tr>
                                                            <td>
                                                                <strong>课程图片：</strong>
                                                            </td>
                                                            <td>
                                                                <dx:ASPxUploadControl ID="upImage" runat="server" UploadMode="Advanced" 
                                                                    Width="280px">
                                                                </dx:ASPxUploadControl>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                        <dx:ASPxCallbackPanel ID="cbplCollege" runat="server" Width="900px" ClientInstanceName="cl_cbplCollege"
                                            OnCallback="cbplCollege_Callback">
                                            <PanelCollection>
                                                <dx:PanelContent runat="server" SupportsDisabledAttribute="True">
                                                    <table width="100%">
                                                        <tr>
                                                            <td align="right" style="font-weight: bold;" width="100px">
                                                                <dx:ASPxCheckBox ID="ckbForCollege" runat="server" CheckState="Unchecked" Text="适用学院："
                                                                    ClientInstanceName="cl_ckbForCollege" Font-Bold="True" ToolTip="全选则打钩">
                                                                    <ClientSideEvents CheckedChanged="function(s, e) {
	setCollege(s,cl_ckbSelectCollege);
}" />
                                                                </dx:ASPxCheckBox>
                                                            </td>
                                                            <td>
                                                                <dx:ASPxCheckBoxList ID="ckbSelectCollege" runat="server" RepeatColumns="5" RepeatDirection="Horizontal"
                                                                    DataSourceID="odsCollege" TextField="学院名称" ValueField="学院ID" ClientInstanceName="cl_ckbSelectCollege"
                                                                    OnDataBound="ckbSelectCollege_DataBound" AutoPostBack="False">
                                                                    <ValidationSettings Display="Dynamic" SetFocusOnError="True" ValidationGroup="btnSaveCourse">
                                                                        <RequiredField ErrorText="请至少选择一项" IsRequired="True" />
                                                                    </ValidationSettings>
                                                                    <ClientSideEvents SelectedIndexChanged="function(s, e) { selCollege(s);}" />
                                                                </dx:ASPxCheckBoxList>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right" style="font-weight: bold;" width="100px">
                                                                <dx:ASPxCheckBox ID="ckbForMajor" runat="server" CheckState="Unchecked" Text="适用专业："
                                                                    ClientInstanceName="cl_ckbForMajor" Font-Bold="True" ToolTip="全选则打钩">
                                                                    <ClientSideEvents CheckedChanged="function(s, e) {
	setMajor(s,cl_ckbSelectMajor);
}" />
                                                                </dx:ASPxCheckBox>
                                                            </td>
                                                            <td>
                                                                <dx:ASPxCheckBoxList ID="ckbSelectMajor" runat="server" RepeatColumns="5" RepeatDirection="Horizontal"
                                                                    ClientInstanceName="cl_ckbSelectMajor" DataSourceID="odsMajor" TextField="专业名称"
                                                                    ValueField="专业ID" OnDataBound="ckbSelectMajor_DataBound">
                                                                    <ValidationSettings Display="Dynamic" SetFocusOnError="True" ValidationGroup="btnSaveCourse">
                                                                        <RequiredField ErrorText="请至少选择一项" IsRequired="True" />
                                                                    </ValidationSettings>
                                                                    <ClientSideEvents SelectedIndexChanged="function(s, e) { selMajor(s); }" />
                                                                </dx:ASPxCheckBoxList>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </dx:PanelContent>
                                            </PanelCollection>
                                        </dx:ASPxCallbackPanel>
                                        <table width="900px">
                                            <tr>
                                                <td colspan="3" align="center">
                                                    <dx:ASPxLabel ID="lblErrorTip" runat="server" Text="*" Visible="False" ForeColor="Red">
                                                    </dx:ASPxLabel>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right">
                                                    <dx:ASPxButton ID="btnSaveCourse" runat="server" Text="保存" Width="60px" ToolTip="保存该课程信息"
                                                        ValidationGroup="btnSaveCourse" OnClick="btnSaveCourse_Click" ClientInstanceName="cl_btnSaveCourse">
                                                        <ClientSideEvents Click="function(s, e) { cl_hfdMajor.Set('major',cl_ckbSelectMajor.GetSelectedValues()); }" />
                                                    </dx:ASPxButton>
                                                </td>
                                                <td>
                                                    &nbsp;
                                                </td>
                                                <td>
                                                    <dx:ASPxButton ID="btnCancelCourse" runat="server" Text="取消" CausesValidation="False"
                                                        Width="60px" ToolTip="取消修改">
                                                        <ClientSideEvents Click="function(s, e) { cancelEditInfo(cl_gvCourseInfo,e); }" />
                                                    </dx:ASPxButton>
                                                </td>
                                            </tr>
                                        </table>
                                    </EditForm>
                                </Templates>
                            </dx:ASPxGridView>
                            <asp:ObjectDataSource ID="odsCourseInfo" runat="server" DeleteMethod="Delete" OldValuesParameterFormatString="original_{0}"
                                SelectMethod="GetDataByOpenCollege" TypeName="MainDataSetTableAdapters.TA_课程信息表TableAdapter"
                                InsertMethod="InsertCollege" UpdateMethod="UpdateCollege">
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
                                    <asp:Parameter Name="实验学时" Type="Decimal" />
                                    <asp:Parameter Name="课程级别" Type="String" />
                                    <asp:Parameter Name="面向对象" Type="String" />
                                    <asp:Parameter Name="创建时间" Type="DateTime" />
                                    <asp:Parameter Name="创建人" Type="String" />
                                    <asp:Parameter Name="立项年度" Type="String" />
                                    <asp:Parameter Name="课程负责人" Type="String" />
                                    <asp:Parameter Name="立项级别" Type="String" />
                                    <asp:Parameter Name="课程描述" Type="String" />
                                </InsertParameters>
                                <SelectParameters>
                                    <asp:SessionParameter DefaultValue="-1" Name="开课学院" SessionField="XYID" 
                                        Type="String" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="课程代码" Type="String" />
                                    <asp:Parameter Name="开课学期" Type="String" />
                                    <asp:Parameter Name="开课学院" Type="String" />
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
                                    <asp:Parameter Name="课程名称" Type="String" />
                                    <asp:Parameter Name="后续课程" Type="String" />
                                    <asp:Parameter Name="课程学分" Type="Decimal" />
                                    <asp:Parameter Name="考核方式" Type="String" />
                                    <asp:Parameter Name="教学方式" Type="String" />
                                    <asp:Parameter Name="主要参考书目" Type="String" />
                                    <asp:Parameter Name="教学计划" Type="Object" />
                                    <asp:Parameter Name="教学大纲" Type="Object" />
                                    <asp:Parameter Name="精品资源共享课" Type="Decimal" />
                                    <asp:Parameter Name="实验学时" Type="Decimal" />
                                    <asp:Parameter Name="课程点击量" Type="Decimal" />
                                    <asp:Parameter Name="课程级别" Type="String" />
                                    <asp:Parameter Name="面向对象" Type="String" />
                                    <asp:Parameter Name="立项级别" Type="String" />
                                    <asp:Parameter Name="立项年度" Type="String" />
                                    <asp:Parameter Name="课程负责人" Type="String" />
                                    <asp:Parameter Name="课程描述" Type="String" />
                                    <asp:Parameter Name="Original_课程代码" Type="String" />
                                </UpdateParameters>
                            </asp:ObjectDataSource>
                            <asp:ObjectDataSource ID="odsCourseProperty" runat="server" OldValuesParameterFormatString="original_{0}"
                                SelectMethod="GetDataByQYBZ" TypeName="DMDataSetTableAdapters.DM_课程性质表TableAdapter">
                            </asp:ObjectDataSource>
                            <asp:ObjectDataSource ID="odsCourseType" runat="server" OldValuesParameterFormatString="original_{0}"
                                SelectMethod="GetDataByQYBZ" TypeName="DMDataSetTableAdapters.DM_课程类别表TableAdapter">
                            </asp:ObjectDataSource>
                            <asp:ObjectDataSource ID="odsTestType" runat="server" OldValuesParameterFormatString="original_{0}"
                                SelectMethod="GetDataByQYBZ" TypeName="DMDataSetTableAdapters.DM_考核方式表TableAdapter">
                            </asp:ObjectDataSource>
                            <asp:ObjectDataSource ID="odsTeachType" runat="server" OldValuesParameterFormatString="original_{0}"
                                SelectMethod="GetDataByQYBZ" TypeName="DMDataSetTableAdapters.DM_教学方式表TableAdapter">
                            </asp:ObjectDataSource>
                            <asp:ObjectDataSource ID="odsCourseLevel" runat="server" OldValuesParameterFormatString="original_{0}"
                                SelectMethod="GetDataByQYBZ" TypeName="DMDataSetTableAdapters.DM_课程级别表TableAdapter">
                            </asp:ObjectDataSource>
                            <asp:ObjectDataSource ID="odsCourseOO" runat="server" OldValuesParameterFormatString="original_{0}"
                                SelectMethod="GetDataByQYBZ" TypeName="DMDataSetTableAdapters.DM_面向对象表TableAdapter">
                            </asp:ObjectDataSource>
                            <asp:ObjectDataSource ID="odsOpenTerm" runat="server" OldValuesParameterFormatString="original_{0}"
                                SelectMethod="GetDataByQYBZ" TypeName="DMDataSetTableAdapters.DM_学期表TableAdapter">
                            </asp:ObjectDataSource>
                            <asp:ObjectDataSource ID="odsCollege" runat="server" OldValuesParameterFormatString="original_{0}"
                                SelectMethod="GetDataByID" TypeName="MainDataSetTableAdapters.TA_学院信息表TableAdapter">
                            </asp:ObjectDataSource>
                            <asp:ObjectDataSource ID="odsMajor" runat="server" OldValuesParameterFormatString="original_{0}"
                                SelectMethod="GetDataByCollege" TypeName="MainDataSetTableAdapters.TA_专业信息表TableAdapter"
                                DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update">
                                <DeleteParameters>
                                    <asp:Parameter Name="Original_专业ID" Type="String" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="专业ID" Type="String" />
                                    <asp:Parameter Name="专业名称" Type="String" />
                                    <asp:Parameter Name="所属学院" Type="String" />
                                    <asp:Parameter Name="专业英文名称" Type="String" />
                                    <asp:Parameter Name="专业学制" Type="String" />
                                    <asp:Parameter Name="专业简介" Type="Object" />
                                </InsertParameters>
                                <SelectParameters>
                                    <asp:SessionParameter DefaultValue="0" Name="CONDITION" SessionField="SelectCollegeID"
                                        Type="String" />
                                    <asp:Parameter Direction="Output" Name="P_RESSET" Type="Object" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="专业名称" Type="String" />
                                    <asp:Parameter Name="所属学院" Type="String" />
                                    <asp:Parameter Name="专业英文名称" Type="String" />
                                    <asp:Parameter Name="专业学制" Type="String" />
                                    <asp:Parameter Name="专业简介" Type="String" />
                                    <asp:Parameter Name="Original_专业ID" Type="String" />
                                </UpdateParameters>
                            </asp:ObjectDataSource>
                            <asp:ObjectDataSource ID="odsFBCourse" runat="server" OldValuesParameterFormatString="original_{0}"
                                SelectMethod="GetFBCollege" TypeName="MainDataSetTableAdapters.TA_课程信息表TableAdapter">
                                <SelectParameters>
                                    <asp:SessionParameter DefaultValue="0" Name="开课学院" SessionField="CollegeID" Type="String" />
                                    <asp:SessionParameter DefaultValue="0" Name="课程代码" SessionField="CourseID" Type="String" />
                                </SelectParameters>
                            </asp:ObjectDataSource>
                            <dx:ASPxGridViewExporter ID="gv_Export" runat="server" OnRenderBrick="gv_Export_RenderBrick">
                            </dx:ASPxGridViewExporter>
                            <asp:ObjectDataSource ID="odsLXJB" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
                                OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataBy启用标志" TypeName="DMDataSetTableAdapters.DM_立项级别TableAdapter"
                                UpdateMethod="Update">
                                <DeleteParameters>
                                    <asp:Parameter Name="Original_代码ID" Type="String" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="代码ID" Type="String" />
                                    <asp:Parameter Name="代码含义" Type="String" />
                                    <asp:Parameter Name="启用标志" Type="String" />
                                    <asp:Parameter Name="备注" Type="String" />
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="代码含义" Type="String" />
                                    <asp:Parameter Name="启用标志" Type="String" />
                                    <asp:Parameter Name="备注" Type="String" />
                                    <asp:Parameter Name="Original_代码ID" Type="String" />
                                </UpdateParameters>
                            </asp:ObjectDataSource>
                        </div>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
    <dx:ASPxPopupControl ID="popupFile" runat="server" AllowDragging="True" ClientInstanceName="cl_popupFile"
        CloseAction="CloseButton" HeaderText="上传教学大纲或教学计划" PopupAction="None" PopupHorizontalAlign="WindowCenter"
        PopupVerticalAlign="WindowCenter" RenderMode="Lightweight" Theme="Aqua" AppearAfter="100"
        Modal="True">
        <ContentCollection>
            <dx:PopupControlContentControl runat="server" SupportsDisabledAttribute="True">
                <table class="dxflInternalEditorTable_Aqua" width="100%">
                    <tr>
                        <td align="center" width="35%">
                            <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="请选择文件类型" Theme="Aqua" Width="100px">
                            </dx:ASPxLabel>
                        </td>
                        <td align="left" width="65%">
                            <dx:ASPxComboBox ID="cmbFileType" runat="server" EnableTheming="True" Theme="Aqua">
                                <Items>
                                    <dx:ListEditItem Text="教学大纲" Value="教学大纲" />
                                    <dx:ListEditItem Text="教学计划" Value="教学计划" />
                                </Items>
                                <DropDownButton Text="请选择">
                                </DropDownButton>
                                <ValidationSettings CausesValidation="True" SetFocusOnError="True">
                                    <RequiredField ErrorText="请选择文件类型！" IsRequired="True" />
                                </ValidationSettings>
                            </dx:ASPxComboBox>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="left">
                            <dx:ASPxUploadControl ID="uploadFile" runat="server" Theme="Aqua" UploadMode="Auto"
                                Width="280px">
                                <BrowseButton Text="浏览...">
                                </BrowseButton>
                            </dx:ASPxUploadControl>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="left">
                            <dx:ASPxLabel ID="lblTip" runat="server" Text="注：教学计划和教学大纲都只能上传pdf格式！" Theme="Aqua">
                            </dx:ASPxLabel>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="left">
                            <dx:ASPxLabel ID="lblError" runat="server" Theme="Aqua" ForeColor="Red">
                            </dx:ASPxLabel>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" width="50%">
                            <dx:ASPxButton ID="btnUp" runat="server" Text="上传" Theme="Aqua" OnClick="btnUp_Click">
                            </dx:ASPxButton>
                        </td>
                        <td align="left">
                            <dx:ASPxButton ID="btnCancel" runat="server" CausesValidation="False" EnableTheming="True"
                                Text="取消" Theme="Aqua" AutoPostBack="False">
                                <ClientSideEvents Click="function(s, e) {
	cl_popupFile.Hide();
}" />
                            </dx:ASPxButton>
                        </td>
                    </tr>
                </table>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>
    </form>
</body>
</html>
