using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DataLayer;
using System.Drawing;

namespace pto.Admin.Controls
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
            string id = ((sender as LinkButton).CommandArgument).ToString();
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "$('#myModal').modal();", true);
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



    }
}