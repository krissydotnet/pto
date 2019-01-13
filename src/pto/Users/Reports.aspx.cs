using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataLayer;
using Business;

namespace pto.Users
{
    public partial class Reports : System.Web.UI.Page
    {
        string connString;
        DBAccess data;

        protected void Page_Load(object sender, EventArgs e)
        {
            connString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            data = new DBAccess(connString);

            gvReport.DataSource = data.Report_EmployeeDetail(1);
            gvReport.DataBind();

        }
    }
}