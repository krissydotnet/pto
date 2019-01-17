using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DataLayer;

namespace pto.Admin.Controls
{
    public partial class Summary : System.Web.UI.UserControl
    {
        string connString;
        DBAccess data;

        protected void Page_Load(object sender, EventArgs e)
        {
            LoadEmployeeBalance();
        }
        private void LoadEmployeeBalance()
        {
            connString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            data = new DBAccess(connString);


            //DataTable myTable = data.Report_EmployeeBalance();
            DataTable myTable = data.Report_EmployeeNextScheduledPTO();
            overviewRepeater.DataSource = myTable;
            overviewRepeater.DataBind();

        }

        protected void overviewRepeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                //Reference the Repeater Item.
                RepeaterItem item = e.Item;
                DataRowView dr = (DataRowView)e.Item.DataItem;
                string nextEvtText = "[none]";
                string nextEvtDetails = "";

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
                    nextEvtDetails += dr["hours"].ToString() + " hours ";
                }
                if (dr["description"] != DBNull.Value)
                {
                    nextEvtDetails += "(" + dr["description"].ToString() + ")";
                }
                Label lblNextEventDate = item.FindControl("lblNextEventDate") as Label;
                lblNextEventDate.Text = nextEvtText;
                Label lblNextEvent = item.FindControl("lblNextEvent") as Label;
                lblNextEvent.Text = nextEvtDetails;
            }
        }
    }
}