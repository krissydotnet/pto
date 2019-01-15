using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataLayer;
using Business;
using System.Data;

namespace pto.Admin
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
                pnl_ptoRequests.Visible = true;
                lblReportHeader.Text = "Overall Employee Balance (as of " + DateTime.Now.ToShortDateString() + ")";
                LoadEmployeeBalance();
            }
        }

       
        private void LoadEmployeeBalance()
        {
            connString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            data = new DBAccess(connString);


            //DataTable myTable = data.Report_EmployeeBalance();
            DataTable myTable = data.Report_EmployeeNextScheduledPTO();
            gvReport.DataSource = myTable;
            gvReport.DataBind();

        }

        int runningTotal = 0;

        protected void gvReport_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DataRowView dr = (DataRowView)e.Row.DataItem;
                string nextEvtText = "[none]";
        
                if (dr["start_date"] != DBNull.Value)
                {
                    nextEvtText = Convert.ToDateTime(dr["start_date"]).ToShortDateString();
                }

                if (dr["end_date"] != DBNull.Value)
                {
                    nextEvtText += " - " + Convert.ToDateTime(dr["end_date"]).ToShortDateString();
                }
                if (dr["hours"] != DBNull.Value)
                {
                    nextEvtText += ": " + dr["hours"].ToString() + " hours ";
                }
                if (dr["description"] != DBNull.Value)
                {
                    nextEvtText += "(" + dr["description"].ToString() + ")";
                }

                Label lblNextEvent = e.Row.FindControl("lblNextEvent") as Label;                               
                lblNextEvent.Text = nextEvtText;
            }

            
        }
            /*
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
        */
    }
}