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
            if (Session["userid"] == null)
            {
                Response.Redirect("../Account/Login.aspx");
            }

            if (!IsPostBack)
            {
                PTORequestForm.NewPTORequest();
            }
        }
    }
}