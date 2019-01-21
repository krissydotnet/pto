using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataLayer;
using System.Data;

namespace pto.Controls.Reports
{
    public partial class EmployeeDetailReport : System.Web.UI.UserControl
    {
        string connString;
        DBAccess data;
        int runningTotal = 0;
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
                Label lblCredit = e.Row.FindControl("lblCredit") as Label;
                if (hours <= 0)
                {
                    lblCredit.Visible = false;
                }
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
    }
}