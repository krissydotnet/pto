﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataLayer;
using System.Data;

namespace pto.Controls
{
    public partial class ScheduledPTO : System.Web.UI.UserControl
    {
        string connString;
        DBAccess data;

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public void LoadPTODetailsToDate(int uid, string username)
        {
            connString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            data = new DBAccess(connString);
            int userid = uid;
            string name = username;
            lblUserName.Text = name;

            DateTime startDate = new DateTime(DateTime.Now.Year, 1, 1);
            DateTime endDate = DateTime.Today;
            gvReport.DataSource = data.Report_EmployeeDetail(userid, startDate, endDate);
            gvReport.DataBind();
            gvReport.Columns[3].Visible = true;
            pnl_ptoRequests.Visible = true;
        }

        public void LoadScheduledPTO(int uid, string username)
        {
            connString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            data = new DBAccess(connString);
            int userid = uid;
            string name = username;
            lblUserName.Text = name;
            DateTime startDate = DateTime.Today;
            DateTime endDate = new DateTime(DateTime.Now.Year, 12, 31);
            DataTable myTable = data.Report_EmployeeDetail(userid, startDate, endDate);
            gvReport.DataSource = myTable;
            gvReport.DataBind();
            gvReport.Columns[3].Visible = false;
            pnl_ptoRequests.Visible = true;
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
                }
                else
                {
                    subtotal = runningTotal - hours;
                }

                total.Text = subtotal.ToString();
                runningTotal = subtotal;

                // Format Dates
                DateTime start_date = DateTime.Parse(dr["start_date"].ToString());
                DateTime end_date = DateTime.Parse(dr["end_date"].ToString());
                Label lblDates = e.Row.FindControl("lblDates") as Label;
                lblDates.Text = start_date.ToShortDateString();
                if (start_date.Date != end_date.Date)
                {
                    lblDates.Text += " - " + end_date.ToShortDateString();
                }

            }

        }
        public void LoadReport(int uid, string username, int selection = 1)
        {
            switch (selection)
            {
                case 1:
                    pnl_ptoRequests.Visible = true;
                    LoadPTODetailsToDate(uid, username);
                    break;
                case 2:
                 
                    LoadScheduledPTO(uid, username);
                    break;
                default:
                    pnl_ptoRequests.Visible = false;
                    break;
            }
        }
    }
}