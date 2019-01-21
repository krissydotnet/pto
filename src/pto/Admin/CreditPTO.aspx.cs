using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pto.Admin
{
    public partial class CreditPTO : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.CreditPTOCtrl.PTOCreditedSuccess += CreditPTOCtrl_PTOCreditedSuccess;
            this.CreditPTOCtrl.PTOCreditedCancel += CreditPTOCtrl_PTOCreditedCancel;

            if (!IsPostBack)
            {
                CreditPTOCtrl.CreditPTO();
                ClientScript.RegisterStartupScript(this.GetType(), "none", "ShowPopup();", true);

            }
        }

        private void CreditPTOCtrl_PTOCreditedCancel(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }

        private void CreditPTOCtrl_PTOCreditedSuccess(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }


    }
}