using System;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using pto.Models;
using DataLayer;

namespace pto.Account
{
    public partial class Login : Page
    {
        string connString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadUsers(connString);
            }



        }
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
            if (IsValid)
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
                        
                        Response.Write("Welcome " + Session["username"]);

                        if (userInfo.Admin == true)
                        {
                            Session["role"] = "admin";
                        } else
                        {
                            Session["role"] = "user";
                        }

                        Response.Redirect("../Users");
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