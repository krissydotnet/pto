using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pto.Admin
{
    public partial class AddPTORequest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            this.PTORequestFormCtrl.PTORequestedSuccess += PTORequestFormCtrl_PTORequestedSuccess;
            this.PTORequestFormCtrl.PTORequestedCancel += PTORequestFormCtrl_PTORequestedCancel;
            this.PTORequestFormCtrl.PTORequestedExist += PTORequestFormCtrl_PTORequestedExist;

            if (!IsPostBack)
            {
                PTORequestFormCtrl.NewPTORequest();
                ClientScript.RegisterStartupScript(this.GetType(), "none", "ShowPopup();", true);

            }
        }

        private void PTORequestFormCtrl_PTORequestedExist(object sender, EventArgs e)
        {
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