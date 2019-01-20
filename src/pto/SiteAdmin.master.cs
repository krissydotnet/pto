using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pto
{
    public partial class SiteAdmin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userid"] == null)
            {
                Response.Redirect("../Account/Login.aspx");
            }
            if ((Session["role"] != null))
            {
                if (Session["role"] != "admin")
                {
                    Response.Redirect("../Account/Login.aspx");
                }
            }
        }
    }
}