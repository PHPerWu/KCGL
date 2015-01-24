using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MainDataSetTableAdapters;

public partial class KC_XWYZCourse : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }
    protected void btnImage_Command(object sender, CommandEventArgs e)
    {
       
            Response.Redirect( e.CommandArgument.ToString());
      
    }
    
}