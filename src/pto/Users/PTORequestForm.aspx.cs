using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pto.Users
{
    public partial class PTORequestForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (Session["userid"] == null)
            {
                Response.Redirect("../Default.aspx");
            }

            this.PTORequestFormCtrl.PTORequestedSuccess += PTORequestFormCtrl_PTORequestedSuccess;
            this.PTORequestFormCtrl.PTORequestedCancel += PTORequestFormCtrl_PTORequestedCancel;
            this.PTORequestFormCtrl.PTORequestedExist += PTORequestFormCtrl_PTORequestedExist;

            if (!IsPostBack)
            {

                int userID = (int)Session["userid"];
                if (Request.QueryString["date"] != null)
                {
                    string startdate = Request.QueryString["date"].ToString();
                    PTORequestFormCtrl.NewPTORequest(userID, startdate);
                }
                PTORequestFormCtrl.NewPTORequest(userID);
                ClientScript.RegisterStartupScript(this.GetType(), "none", "ShowPopup();", true);
                //lblHeading.Text = "Request Time Off";
                //upModal.Update();
            }
        }

        private void PTORequestFormCtrl_PTORequestedExist(object sender, EventArgs e)
        {
            //ClientScript.RegisterStartupScript(this.GetType(), "none", "ShowPopup();", true);

        }

        private void PTORequestFormCtrl_PTORequestedCancel(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }

        private void PTORequestFormCtrl_PTORequestedSuccess(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }
    }
}