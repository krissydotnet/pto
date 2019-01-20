using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataLayer;
using System.Data;

namespace pto.Admin
{
    public partial class Reports : System.Web.UI.Page
    {


        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userid"] == null)
            {
                Response.Redirect("../Default.aspx");
            } 

            if (!IsPostBack)
            {
                pnl_ptoRequests.Visible = true;
                Admin_Reports.LoadEmployeeBalanceReport();
            }
        }

       
        
    }
}