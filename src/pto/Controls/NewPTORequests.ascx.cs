using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DataLayer;
using System.Drawing;

namespace pto.Controls
{
    public partial class NewPTORequests : System.Web.UI.UserControl
    {
        string connString;
        DBAccess data;

        protected void Page_Load(object sender, EventArgs e)
        {

                LoadNewPTORequests();



        }
        private void LoadNewPTORequests()
        {
            connString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            data = new DBAccess(connString);


            DataTable myTable = data.Report_NewPTORequests();
            gvNewRequests.DataSource = myTable;
            gvNewRequests.DataBind();
            lblTotal.Text = myTable.Rows.Count.ToString();

        }

        
        protected void ApprovePTO(object sender, EventArgs e)
        {
            int id = Int32.Parse(((sender as LinkButton).CommandArgument).ToString());
            connString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            data = new DBAccess(connString);
            data.ApprovePTORequest(id);
            if (!data.error)
            {
                LoadNewPTORequests();
            }
            else
            {
                lblErrorMessage.Text = data.errorMessage;
            }

        }

        protected void gvNewRequests_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DataRowView dr = (DataRowView)e.Row.DataItem;

                DateTime start_date = DateTime.Parse(dr["start_date"].ToString());
                DateTime end_date = DateTime.Parse(dr["end_date"].ToString());
                Label lblDates = e.Row.FindControl("lblDates") as Label;
                String PTOType = dr["description"].ToString();
                String Comments = dr["comments"].ToString();
                int Hours = Convert.ToInt32(dr["hours"]);
                Label lblPTOType = e.Row.FindControl("lblPTOType") as Label;
                lblPTOType.Text = PTOType;
                Label lblComments = e.Row.FindControl("lblComments") as Label;
                lblComments.Text = Comments;
                Label lblHours = e.Row.FindControl("lblHours") as Label;
                lblHours.Text = Hours.ToString() + " hours ";

                lblDates.Text = start_date.ToShortDateString();
                if (start_date.Date != end_date.Date)
                {
                    lblDates.Text += " - " + end_date.ToShortDateString();
                }
            }
        }
    }
}