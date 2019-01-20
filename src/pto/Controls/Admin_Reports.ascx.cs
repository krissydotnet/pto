using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataLayer;
using System.Data;

namespace pto.Controls
{
    public partial class Admin_Reports : System.Web.UI.UserControl
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
        public void LoadPTODetailsToDate(int uid, string username)
        {
            connString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            data = new DBAccess(connString);
            int userid = uid;
            string name = username;
            lblUserName.Text = name;
            lblReportHeader.Text = "Employee Detail Report: PTO Taken Year To Date";

            DateTime startDate = new DateTime(DateTime.Now.Year, 1, 1);
            DateTime endDate = DateTime.Today;
            lblReportHeader.Text += "(as of " + endDate.ToShortDateString() + ")";
            gvReport.DataSource = data.Report_EmployeeDetail(userid, startDate, endDate);
            gvReport.DataBind();
            gvReport.Columns[3].Visible = true;
            pnl_EmployeeDetail.Visible = true;
        }

        protected void gvDetail_RowDataBound(object sender, GridViewRowEventArgs e)
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
                }
                else
                {
                    subtotal = runningTotal - hours;
                }

                total.Text = subtotal.ToString();
                runningTotal = subtotal;
            }

        }
        public void LoadReport(int uid, string username, int selection = 1)
        {
            switch (selection)
            {
                case 1:
                    //pnl_ptoRequests.Visible = true;
                    LoadPTODetailsToDate(uid, username);
                    break;
                case 2:

                    //LoadScheduledPTO(uid, username);
                    break;
                default:
                    //pnl_ptoRequests.Visible = false;
                    break;
            }
        }
    }
}