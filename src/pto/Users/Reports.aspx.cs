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
                    LoadReport(Convert.ToInt32(Request.QueryString["rid"]));
                }
            }
        }

        private void LoadPTODetailsToDate()
        {
            connString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            data = new DBAccess(connString);
            int userid = (int)Session["userid"];
            string name = (string)Session["username"];
            lblUserName.Text = name;

            DateTime startDate = new DateTime(DateTime.Now.Year, 1, 1);
            DateTime endDate = DateTime.Today;
            lblRange.Text = "as of " + endDate.ToShortDateString();
            gvReport.DataSource = data.Report_EmployeeDetail(userid, startDate, endDate);
            gvReport.DataBind();
        }
        private void LoadPTORequestsRemaining()
        {
            connString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            data = new DBAccess(connString);
            int userid = (int)Session["userid"];
            string name = (string)Session["username"];
            lblUserName.Text = name;

            DateTime startDate = DateTime.Today;
            DateTime endDate = new DateTime(DateTime.Now.Year, 12, 31);
            lblRange.Text = "as of " + startDate.ToShortDateString();
            DataTable myTable = data.Report_EmployeeDetail(userid, startDate, endDate);
            gvReport.DataSource = myTable;
            gvReport.DataBind();
        }

        int runningTotal = 0;
        protected void gvReport_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DataRowView dr = (DataRowView)e.Row.DataItem;
                int hours = int.Parse(dr["hours"].ToString());
                bool credit = bool.Parse(dr["credit"].ToString());
                Label total = e.Row.FindControl("lblBalance") as Label;
                int subtotal = 0;
                if (credit)
                {
                    subtotal = runningTotal + hours;
                } else
                {
                    subtotal = runningTotal - hours;
                }

                total.Text = subtotal.ToString();
                runningTotal = subtotal;
            }

        }
        private void LoadReport(int selection = 1)
        {
            switch (selection)
            {
                case 1:
                    pnl_ptoRequests.Visible = true;
                    lblReportHeader.Text = "Employee Detail Report: PTO Taken";
                    LoadPTODetailsToDate();
                    break;
                case 2:
                    pnl_ptoRequests.Visible = true;
                    lblReportHeader.Text = "Employee Detail Report: PTO Remaining";
                    LoadPTORequestsRemaining();
                    break;
                default:
                    pnl_ptoRequests.Visible = false;
                    break;
            }
        }
        protected void ddlReports_SelectedIndexChanged(object sender, EventArgs e)
        {
            int selection = int.Parse(ddlReports.SelectedItem.Value);
            LoadReport(selection);
        }
    }
}