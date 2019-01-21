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
                    int rid = Convert.ToInt32(Request.QueryString["rid"]);
                    //User_Reports.LoadReport(userid, username, rid);
                    LoadReports(rid, userid, username);
                }
            }
        }
        protected void LoadReports(int rid, int userid, string username)
        {
            switch (rid)
            {
                case 1:
                    lblDetailDate.Text = DateTime.Now.ToShortDateString();
                    pnl_EmployeeDetailReport.Visible = true;
                    EmployeeDetailReport.LoadPTODetailsToDate(userid, username);
                    break;
                case 2:
                    lblBalanceDate.Text = DateTime.Now.ToShortDateString();
                    pnl_EmployeeBalanceReport.Visible = true;
                    EmployeeBalanceReport.LoadEmployeeBalanceReport(userid);
                    break;
                case 3:
                    pnl_ScheduledPTO.Visible = true;
                    ScheduledPTO.LoadScheduledPTO(userid, username);
                    break;
                default:
                    break;

            }
        }


    }
}