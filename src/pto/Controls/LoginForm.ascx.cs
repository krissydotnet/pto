using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataLayer;
using Microsoft.AspNet.Identity.Owin;

namespace pto.Controls
{
    public partial class LoginForm : System.Web.UI.UserControl
    {
        string connString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadUsers(connString);
            }



        }
        public event EventHandler LoginSuccess;

        protected void LoadUsers(string connString)
        {
            DBAccess data = new DBAccess(connString);
            ddlUsers.DataSource = data.GetUsers();
            ddlUsers.DataBind();
            ddlUsers.DataTextField = "name";
            ddlUsers.DataValueField = "userid";
            ddlUsers.DataBind();

        }
        protected void LogIn(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {

                DBAccess data = new DBAccess(connString);
                User userInfo = data.GetUserInfo(int.Parse(ddlUsers.SelectedItem.Value));

                var result = SignInStatus.Failure;
                if (userInfo != null)
                {
                    result = SignInStatus.Success;
                }


                switch (result)
                {
                    case SignInStatus.Success:
                        Session["userid"] = userInfo.UserId;
                        Session["username"] = userInfo.Name;


                        if (userInfo.Admin == true)
                        {
                            Session["role"] = "admin";
                        }
                        else
                        {
                            Session["role"] = "user";
                        }
                        if (LoginSuccess != null)
                            this.LoginSuccess(this, new EventArgs());

                        break;

                    case SignInStatus.Failure:
                    default:
                        FailureText.Text = "Invalid login attempt";
                        ErrorMessage.Visible = true;
                        break;
                }
            }
        }
    }
}