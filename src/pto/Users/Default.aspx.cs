using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataLayer;



namespace pto.Users
{
    public partial class Default : System.Web.UI.Page
    {
        string connString;
        DBAccess data;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userid"] == null)
            {
                Response.Redirect("~/");
            }
           

            int userID = (int)Session["userid"];
            LoadSummary(userID);
            CalendarControl.LoadFuturePTORequests(userID);
        }
        protected void LoadSummary(int userID)
        {
            connString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            data = new DBAccess(connString);
            User myUser = data.GetUserInfo(userID);
            lblBalance.Text = myUser.TotalPTO.ToString();
            lblFuturePTO.Text = myUser.UsedPTO.ToString();
            DateTime endOfYear = new DateTime(DateTime.Now.Year, 12, 31);
            int months = endOfYear.Month - DateTime.Today.Month;
            int futureAccrual = months * myUser.AccrualRate;
            lblAccrual.Text = futureAccrual.ToString();
        }
        protected void btAddPTORequest_Click(object sender, EventArgs e)
        {
            int userID = (int)Session["userid"];
            PTORequestForm.NewPTORequest(userID);
            pnlPTORequest.Visible = true;
            upModal.Update();
        }

    }
}