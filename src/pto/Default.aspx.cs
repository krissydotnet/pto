using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;



namespace pto
{
    public partial class _Default : Page
    {
        

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userid"] == null)
            {
                this.LoginForm.LoginSuccess += LoginForm_LoginSuccess;
                LoadLoginForm();
            }
        }

        private void LoginForm_LoginSuccess(object sender, EventArgs e)
        {
            Response.Redirect("./Users");
        }

        protected void LoadLoginForm() {
                //LoginPanel.Visible = true;
            //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
            //"<script>$('#myModal').modal('show');</script> ", false);
            ClientScript.RegisterStartupScript(this.GetType(), "none", "ShowPopup();", true);
            upModal.Update();
        }


    }
}