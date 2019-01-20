using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataLayer;
using System.Data;

namespace pto.Users
{
    public partial class Reports : System.Web.UI.Page
    {
        string connString;
        DBAccess data;
 

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userid"] == null)
            {
                Response.Redirect("../Account/Login.aspx");
            }

            if (!IsPostBack)
            {
                if (!String.IsNullOrEmpty(Request.QueryString["rid"]))
                {
                    //Update PTORequest if rid in querystring
                    int userid = Convert.ToInt32(Session["userid"]);
                    string username = Session["username"].ToString();
                    User_Reports.LoadReport(userid, username, Convert.ToInt32(Request.QueryString["rid"]));
                }
            }
        }

        
    }
}