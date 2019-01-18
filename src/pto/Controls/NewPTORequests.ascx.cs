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

        protected void gvNewRequests_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {

                //e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(gvNewRequests, "Select$" + e.Row.RowIndex);
                //e.Row.Attributes["style"] = "cursor:pointer";


            }
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
        protected void ViewPTO(object sender, EventArgs e)
        {
            string id = ((sender as LinkButton).CommandArgument).ToString();
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "$('#myModal').modal();", true);
            connString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            data = new DBAccess(connString);
            
            PTORequest details = data.GetPTORequestDetailsByID(Int32.Parse(id));
            lblID.Text = id;
            lblEmployee.Text = details.Name;
            if (details.EndDate.Date > details.StartDate.Date)
            {
                lblDates.Text = details.StartDate.ToShortDateString() + " - " + details.EndDate.ToShortDateString();

            } else
            {
                lblDates.Text = details.StartDate.ToShortDateString();
            }
            lblType.Text = details.Description;
            lblHours.Text = details.Hours.ToString();
            lblComments.Text = details.Comments;
            upModal.Update();


        }
        protected void OnSelectedIndexChanged(object sender, EventArgs e)
        {
            foreach (GridViewRow row in gvNewRequests.Rows)
            {
                if (row.RowIndex == gvNewRequests.SelectedIndex)
                {
                    //Response.Write("Testing");

                }
                else
                {
                    //row.BackColor = ColorTranslator.FromHtml("#FFFFFF");
                    //row.ToolTip = "Click to select this row.";
                }
            }
        }



        protected void btnApprove_Click1(object sender, EventArgs e)
        {
            int id = Int32.Parse(lblID.Text);
            connString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            data = new DBAccess(connString);
            data.ApprovePTORequest(id);
            if (!data.error)
            {
                Response.Write("Success");
            } else
            {
                //lblErrMsg.Text = data.errorMessage;
            }
        }
    }
}