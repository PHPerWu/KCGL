using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

///（ 王时绘， 2012-02-15， 武汉 ）
///一、目的：
///  类HubuXMLeSiteMapProvider继承XMLSiteMapProvider并重载其方法IsAccessibleToUser，使得：
///1、ASPxSiteMapDataSource(或SiteMapDataSource）在使用HubuXMLSiteMapProvider后具有用户、角色的权限功能，可直接支持导航控件（如aspxTreeView,aspxMenu,ASPxSiteMapControl，TreeView,Menu等控件）
///2、HubuXMLSiteMapProvider可直接支持各个aspx页面的权限， 使得导航控件在使用HubuXMLSiteMapProvider后的权限与每个aspx页面的权限是一致的。
/// 
/// 二、使用：
///  
/// 1--在web.config文件的system.web节中增加：
///	<siteMap defaultProvider="MY_HubuXMLSiteMapProvider" enabled="true">
///			<providers>
///				<clear/>
///				<add name="MY_HubuXMLSiteMapProvider" description="Default SiteMap provider." type="HubuXMLSiteMapProvider" siteMapFile="Web.sitemap" securityTrimmingEnabled="true"/>
///			</providers>
///		</siteMap>
/// 
/// 2--把ASPxSiteMapDataSource控件的SieMapProvider设置为:MY_HubuXMLSiteMapProvider

/// <summary>
///Class_HubuXMLSiteMapProvider 的摘要说明
/// </summary>
public class HubuXMLSiteMapProvider : XmlSiteMapProvider
{
    public override bool IsAccessibleToUser(HttpContext context, SiteMapNode node)
    {
        //If Security Trimming is not enabled return true
        if (!SecurityTrimmingEnabled)
            return true;

        //该节点的没有定义roles定义部分，则为(node.Roles != null && node.Roles.Count == 0)的情形，表示任何用户（含匿名用户）均可访问
        if (node.Roles != null && node.Roles.Count == 0)
            return true;

        //check each role, if the user is in any of the roles return true
        foreach (string role in node.Roles)
        {
            if (System.Web.Security.Roles.IsUserInRole(role))
                return true;
        }
        // 视对roles=*理解为是否含匿名用户而取舍，如果认为roles=* 包括匿名用户,则注释到下面1条语句(if (context.User.Identity.IsAuthenticated))
        // 一般认为roles=* 不包括匿名用户，role=空 则包括匿名用户。
        if (context.User.Identity.IsAuthenticated)
            foreach (string role in node.Roles)
            {
                if (String.Equals(role, "*", StringComparison.InvariantCultureIgnoreCase))
                    return true;
            }
        return false;
    }
}