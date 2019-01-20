using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DataLayer;

namespace pto.Controls.Reports
{
    public partial class EmployeeBalanceReport : System.Web.UI.UserControl
    {
        string connString;
        DBAccess data;

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public void LoadEmployeeBalanceReport()
        {
            pnlEmployeeBalance.Visible = true;
            lblReportHeader.Text = "Overall Employee Balance (as of " + DateTime.Now.ToShortDateString() + ")";
            LoadEmployeeBalance();
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
    }
}