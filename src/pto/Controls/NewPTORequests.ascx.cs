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
        
        


    }
}