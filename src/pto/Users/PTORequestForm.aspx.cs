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
                Response.Redirect("../Account/Login.aspx");
            }

            if (!IsPostBack)
            {
                int userID = (int)Session["userid"];
                PTORequestFormCtrl.NewPTORequest(userID);
            }
        }
    }
}