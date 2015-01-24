<%@ Page Language="C#" AutoEventWireup="true" CodeFile="JPKCInfo.aspx.cs" Inherits="KC_JPKCInfo" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <script src="../Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
    <link href="../Styles/master.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/KCinfo.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/ScoreTop.js" type="text/javascript"></script>
    <style type="text/css">
        .rptb
        {
        }
        .rptb tr td
        {
            font-size: small;
            vertical-align: middle;
            height: 35px;
            width: 8%;
        }
        .rptb a
        {
            color: #7FFFAA;
        }
        .rptb a:hover
        {
            color: #698B22;
        }
        .tabright tr td
        {
            width: 12%;
            font-size: small;
            vertical-align: middle;
            height: 35px;
        }
        .tdleft
        {
            text-align: right;
            font-weight: bold;
        }
        .tdright
        {
            text-align: left;
        }
        .returntop
        {
            background: url(../images/returntop1.jpg);
            display: none;
            position: fixed;
            bottom: 50px;
            right: 100px;
            cursor: pointer;
        }
        
        /*2013.22.29--任俊伟加上*/
        /*将评价的table再嵌套在一个table中，在用css控制一下边框*/
        .pjTable
        {
            border: 1px solid #6B8E23;
            border-top: none;
        }
    </style>
    <script type="text/javascript">
        //下拉菜单
        $(document).ready(function () {
            $("ul.subnav").parent().append("<span></span>");
            //给下拉按钮添加事件
            $("ul.topnav li span").click(function () {
                $(this).parent().find("ul.subnav").slideDown('fast').show();
                $(this).parent().hover(function () {
                }, function () {
                    $(this).parent().find("ul.subnav").slideUp('slow');
                });
            }).hover(function () {
                $(this).addClass("subhover");
            }, function () {
                $(this).removeClass("subhover");
            });
        });

        //喜欢不喜欢一般点评
        $(function () {
            //喜欢
            $("#imgyes").click(function () {
                var kcid = $("#<%=lblkcid.ClientID %>").text();
                $.get("pjcl.ashx?kcid=" + kcid + "&type=yes", function (data, status) {
                    if (data == "ok") {
                        //成功
                        $("#<%=lblyes.ClientID %>").text(parseInt($("#<%=lblyes.ClientID %>").text()) + 1);
                        alert("谢谢您的参与！");
                    }
                    else if (data == "no") {
                        //已投过
                        alert("您已发表过感受了！");
                    }
                    else {
                        //参数出错
                    }
                });
            });
            //不喜欢
            $("#imgno").click(function () {
                var kcid = $("#<%=lblkcid.ClientID %>").text();
                $.get("pjcl.ashx?kcid=" + kcid + "&type=no", function (data, status) {
                    if (data == "ok") {
                        //成功
                        $("#<%=lblno.ClientID %>").text(parseInt($("#<%=lblno.ClientID %>").text()) + 1);
                        alert("谢谢您的参与！");
                    }
                    else if (data == "no") {
                        //已投过
                        alert("您已发表过感受了！");
                    }
                    else {
                        //参数出错
                    }
                });
            });
            //一般点评
            $("#imgyiban").click(function () {
                var kcid = $("#<%=lblkcid.ClientID %>").text();
                $.get("pjcl.ashx?kcid=" + kcid + "&type=yiban", function (data, status) {
                    if (data == "ok") {
                        //成功
                        $("#<%=lblyiban.ClientID %>").text(parseInt($("#<%=lblyiban.ClientID %>").text()) + 1);
                        alert("谢谢您的参与！");
                    }
                    else if (data == "no") {
                        //已投过
                        alert("您已发表过感受了！");
                    }
                    else {
                        //参数出错
                    }
                });
            });
        })

        //2014.1.9  Added By RJW
        function xsInit() {
            var xsCount = document.getElementById("xsCount").innerText;
            var xs = xsCount.substring(0, xsCount.length - 2);
            if (xs <= 18)   //学时类型为周
            {
                document.getElementById("sum").innerText = "总周数：";
                document.getElementById("teach").innerText = "讲授周数：";
                document.getElementById("prac").innerText = "实践周数：";
                document.getElementById("test").innerText = "实验周数：";
                var xsCount = document.getElementById("xsCount");
                xsCount.innerText = xsCount.innerText.substring(0, xsCount.innerText.length - 2) + "周";
                var xsTeach = document.getElementById("xsTeach");
                if (xsTeach.innerText == "学时") {
                    xsTeach.innerText = "0周";
                }
                else {
                    xsTeach.innerText = xsTeach.innerText.substring(0, xsTeach.innerText.length - 2) + "周";
                }
                var xsPrac = document.getElementById("xsPrac");
                if (xsPrac.innerText == "学时") {
                    xsPrac.innerText = "0周";
                }
                else {
                    xsPrac.innerText = xsPrac.innerText.substring(0, xsPrac.innerText.length - 2) + "周";
                }
                var xsTest = document.getElementById("xsTest");
                if (xsTest.innerText == "学时") {
                    xsTest.innerText = "0周";
                }
                else {
                    xsTest.innerText = xsTest.innerText.substring(0, xsTest.innerText.length - 2) + "周";
                }
            }    //学时类型默认是为学时，但当学时为空时，应显示为0学时
            else {
                var xsTeach = document.getElementById("xsTeach");
                if (xsTeach.innerText == "学时") {
                    xsTeach.innerText = "0学时";
                }
                var xsPrac = document.getElementById("xsPrac");
                if (xsPrac.innerText == "学时") {
                    xsPrac.innerText = "0学时";
                }
                var xsTest = document.getElementById("xsTest");
                if (xsTest.innerText == "学时") {
                    xsTest.innerText = "0学时";
                }
            }

            //教学大纲的处理
            var jsdg = document.getElementById("jxdg");
            var lblhref = $("#<%=lblhref.ClientID %>").text();
            if (lblhref == "") {
                jxdg.innerHTML = "暂无教学大纲"
            }
            else {
                var href = "/kcgl" + lblhref.toString().substring(1);
                jxdg.innerHTML = "<a href=" + href + ">点击查看教学大纲</a>";
            }

            //学期的处理
            var xq = document.getElementById("xq");
            var xqnum = xq.innerText.toString();
            if (xqnum != "")   //开课学期不为空，加上相关文字
            {
                xq.innerText = "第" + xq.innerText + "学期";
            }
            else    //开课学期为空，显示相关提示文字
            {
                xq.innerText = "暂未确定";
            }
        }
    </script>
</head>
<body onload="xsInit();">
    <form id="form1" runat="server">
    <div>
        <div class="returntop">
            <img alt="回顶部" id="img1" src="../image/returntop1.jpg" />
            <img alt="回顶部" id="img2" style="display: none;" src="../image/returntop2.jpg" /></div>
        <div class="container">
            <div id="header">
                <div class="headFunc">
                    <div class="function">
                        <a href="#" onclick="this.style.behavior='url(#default#homepage)'; this.setHomePage(document.location.href);event.returnValue=false;">
                            设为首页</a>&nbsp;&nbsp;|&nbsp; <a href="Javascript:window.external.addFavorite(document.location.href,document.title)">
                                加入收藏</a>
                    </div>
                    <div class="search">
                    <table>
                    <tr>
                    <td><dx:ASPxTextBox ID="txtSearch" runat="server" Width="150px"  
                             class="txtSearch" Height="17px" NullText="请输入课程名称" 
                            Theme="Office2003Olive">
                            <NullTextStyle ForeColor="#999999">
                            </NullTextStyle>
                        </dx:ASPxTextBox></td>
                    <td><asp:Button ID="btnSearch" runat="server" Text="搜索" class="btnSearch" BackColor="#598F30"
                            BorderStyle="None" ForeColor="White" Width="40px" Height="20px" 
                            onclick="btnSearch_Click" /></td>
                    </tr>
                    </table>
                        
                        <%--<asp:TextBox ID="txtSearch" runat="server" BorderColor="#13683D" BorderStyle="Solid"
                            BorderWidth="1px" class="txtSearch" Height="17px"></asp:TextBox>--%>
                        
                    </div>
                </div>
            </div>
            <div>
                <ul class="topnav">
                    <li style="font-size: 13px;"><a href="../Main_index.aspx">首页</a>
                        <%--<ul class="subnav">
                                <li><a href="">添加标题</a></li>
                                <li><a href="">添加标题</a></li>
                            </ul>--%>
                    </li>
                    <li style="font-size: 13px;"><a href="KCfaculty.aspx">课程总览</a>
                        <ul class="subnav">
                            <li><a href="CourseView.aspx">所有课程</a></li>
                            <li><a href="RMCourse.aspx">热门课程</a></li>
                            <li><a href="JPKFCourse.aspx">精品开放课程</a></li>
                            <li><a href="TSJYCourse.aspx">通识教育选修课</a></li>
                            <li><a href="XWYZCourse.aspx">校外优质课程</a></li>
                        </ul>
                    </li>
                    <li style="font-size: 13px;"><a href="MajorView.aspx?majortype=4">专业设置</a>
                        <ul class="subnav">
                            <li><a href="MajorView.aspx?majortype=1">品牌(特色)专业</a></li>
                            <li><a href="MajorView.aspx?majortype=2">战略支柱产业专业</a></li>
                            <li><a href="MajorView.aspx?majortype=3">综合改革试点专业</a></li>
                        </ul>
                    </li>
                    <li style="font-size: 13px;"><a href="TeacherFamous.aspx?tchtype=4">优秀教师</a>
                        <ul class="subnav">
                            <li><a href="TeacherFamous.aspx?tchtype=1">教学名师</a></li>
                            <li><a href="TeacherFamous.aspx?tchtype=2">教学质量优秀奖教师</a></li>
                            <li><a href="TeacherFamous.aspx?tchtype=3">教学技能大赛获奖教师</a></li>
                        </ul>
                    </li>
                    <li style="font-size: 13px;"><a href="News.aspx">新闻公告</a>
                        <%-- <ul class="subnav">
                                <li><a href="">添加标题</a></li>
                                <li><a href="">添加标题</a></li>
                            </ul>--%>
                    </li>
                    <%--2013.22.29加上友情链接 By张敏 --%>
                    <li style="font-size: 13px;"><a>友情链接</a>
                        <ul class="subnav">
                            <li><a href="http://www.hubu.edu.cn/" target="_blank">湖北大学</a></li>
                            <li><a href="http://jwc.hubu.edu.cn/" target="_blank">湖北大学教务处</a></li>
                            <li><a href="http://www.jingpinke.com/" target="_blank">国家精品课程资源网</a></li>
                            <li><a href="http://kczx.whu.edu.cn/G2S/ShowSystem/Index.aspx" target="_blank">武汉大学课程中心</a></li>
                            <li><a href="http://curriculum.hust.edu.cn/" target="_blank">华中科技大学课程中心</a></li>
                            <li><a href="http://www.icourses.cn/home/" target="_blank">爱课程网站</a></li>
                                <li><a href="http://www.xuetangx.com/" target="_blank">学堂在线</a></li>
                        </ul>
                    </li>
                </ul>
                <%--2013.22.29加上访问量—任俊伟--%>
                <div class="visit">
                    <span>
                        <asp:Label ID="lblOnline" runat="server" Text="Label"></asp:Label>
                        <asp:Label ID="lblTotal" runat="server" Text="Label"></asp:Label></span></div>
            </div>
            <div style="height: 10px; float: left;">
                &nbsp;</div>
            <div style="text-align: center">
                <img alt="湖北大学" src="../image/banner.jpg" /></div>
            <div style="height: 10px">
                &nbsp;</div>
            <div class="body">
                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="odsKCXX" 
                    onitemdatabound="Repeater1_ItemDataBound">
                    <HeaderTemplate>
                        <table width="100%" class="rptb">
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td style="width: 30%;">
                            </td>
                            <td colspan="2" style="width: 500px;">
                                <h1 style=" border-bottom:1px solid Green; width:500px; " >
                                    <%#Eval("课程名称")%></h1>
                            </td>
                        </tr>
                        <tr>
                            <td rowspan="4" style="width: 30%; padding-left: 120px">
                                <asp:ImageButton ID="ImageButton1" runat="server" Width="120px" Height="160px" ImageUrl='<%# Eval("课程图片").ToString()!=""?Eval("课程图片"):"~/image/public/noup.jpg" %>' />
                            </td>
                            <td style="width: 10%;" align="right">
                                课程类别：
                            </td>
                            <td align="left" style="width: 60%;">
                                <%#Eval("课程类别名") %>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                开课学院：
                            </td>
                            <td>
                                <%#Eval("开课学院名") %>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                课程学分：
                            </td>
                            <td>
                                <%#Eval("课程学分").ToString().Length>3? Eval("课程学分").ToString().Substring(0,3):Eval("课程学分").ToString() %>学分
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                总学时：
                            </td>
                            <td>
                                <%#Eval("总学时") %>
                                学时
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                讲授<%#Eval("讲授学时") %>学时 实践<%#Eval("实践学时") %>学时 实验<%#Eval("实验学时") %>学时
                            </td>
                        </tr>
                        <tr>
                            <td style="padding-left: 150px">
                                点击量：<%#Eval("课程点击量") %></td>
                            <td align="right">
                                面向对象：
                            </td>
                            <td>
                                <%#Eval("面向对象名") %>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td align="right">
                                教学方式：
                            </td>
                            <td>
                                <%#Eval("教学方式名") %>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td align="right">
                                考核方式：
                            </td>
                            <td>
                                <%#Eval("考核方式名") %>
                            </td>
                        </tr>
                         <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td align="right">
                                课程网址：
                            </td>
                            <td>
                              <a href="<%#Eval("精品课程网址")%>" target="_blank">点击进入</a>
                            </td>
                        </tr>
                        <tr>
                            <td rowspan="3">
                            </td>
                            <td align="right">
                                课程负责人：
                            </td>
                            <td>
                                <%#Eval("课程负责人")%>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                立项级别：
                            </td>
                            <td>
                                <%#Eval("立项年度") %>年
                                <%#Eval("立项级别名")%>
                                <%#Eval("精品视频公开课").ToString() == "1" ? "精品视频公开课" : ""%>
                                <%#Eval("精品资源共享课").ToString() == "1" ? "精品资源共享课" : ""%>
                            </td>
                        </tr>
                       <tr>
                        <td align="right">
                            教学大纲：
                        </td>
                        <td>
                         <dx:ASPxHyperLink ID="hlJXDG" runat="server" Text="" Cursor="pointer" Target="_blank">
                                </dx:ASPxHyperLink>
                        </td>
                        </tr>
                        <%--  <tr>
                            <td>
                                <table>
                                    <tr>
                                        <td>
                                            <center>
                                                看完此课程介绍，您心情如何？</center>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="font-size: 13px; text-align: center;">
                                            <asp:Label ID="lblyes" runat="server" Text="0"></asp:Label>票<br />
                                            <img id="imgyes" alt="赞" style="cursor: pointer;" src="../image/yes.jpg" />
                                        </td>
                                        <td style="font-size: 13px; text-align: center;">
                                            <asp:Label ID="lblyiban" runat="server" Text="0"></asp:Label>票<br />
                                            <img id="imgyiban" alt="一般" style="cursor: pointer;" src="../image/yiban.jpg" />
                                        </td>
                                        <td style="font-size: 13px; text-align: center;">
                                            <asp:Label ID="lblno" runat="server" Text="0"></asp:Label>票<br />
                                            <img id="imgno" alt="差" style="cursor: pointer;" src="../image/no.jpg" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="font-size: 13px; text-align: center;">
                                            <b>喜欢</b>
                                        </td>
                                        <td style="font-size: 13px; text-align: center;">
                                            <b>一般</b>
                                        </td>
                                        <td style="font-size: 13px; text-align: center;">
                                            <b>不喜欢</b>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>--%>
                    </ItemTemplate>
                    <FooterTemplate>
                        </table></FooterTemplate>
                </asp:Repeater>
                <table width="100%" class="pjTable">
                    <tr>
                        <td>
                            <center>
                                <table>
                                    <tr>
                                        <td colspan="3">
                                            <b>看完此课程介绍，您心情如何？</b>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3" height="10px">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="font-size: 13px; text-align: center;">
                                            <asp:Label ID="lblyes" runat="server" Text="0"></asp:Label>票<br />
                                            <img id="imgyes" alt="赞" style="cursor: pointer;" src="../image/yes.jpg" />
                                        </td>
                                        <td style="font-size: 13px; text-align: center;">
                                            <asp:Label ID="lblyiban" runat="server" Text="0"></asp:Label>票<br />
                                            <img id="imgyiban" alt="一般" style="cursor: pointer;" src="../image/yiban.jpg" />
                                        </td>
                                        <td style="font-size: 13px; text-align: center;">
                                            <asp:Label ID="lblno" runat="server" Text="0"></asp:Label>票<br />
                                            <img id="imgno" alt="差" style="cursor: pointer;" src="../image/no.jpg" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="font-size: 13px; text-align: center;">
                                            <b>喜欢</b>
                                        </td>
                                        <td style="font-size: 13px; text-align: center;">
                                            <b>一般</b>
                                        </td>
                                        <td style="font-size: 13px; text-align: center;">
                                            <b>不喜欢</b>
                                        </td>
                                    </tr>
                                </table>
                            </center>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" style="font-size: 13px; padding-right: 60px;">
                            <a style="color: #698B22" href="javascript:history.go(-1);">返回上一页</a>
                        </td>
                    </tr>
                </table>
                <asp:Label ID="lblkcid" runat="server" Text="" Style="display: none;"></asp:Label>
                <asp:Label ID="lblhref" runat="server" Text="" Style="display: none;"></asp:Label>
                <div>
                    &nbsp;</div>
                <div style="background-color: #6B8E23; height: 5px">
                    &nbsp;</div>
            </div>
            <asp:ObjectDataSource ID="odsKCXX" runat="server" OldValuesParameterFormatString="original_{0}"
                SelectMethod="GetKCInfoByKCDM" TypeName="MainDataSetTableAdapters.VI_KCINFOTableAdapter">
                <SelectParameters>
                    <asp:QueryStringParameter Name="课程代码" QueryStringField="KCID" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </div>
    </div>
    </form>
</body>
</html>
