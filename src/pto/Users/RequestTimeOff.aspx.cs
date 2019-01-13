using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataLayer;

namespace pto.Users
{
    public partial class RequestTimeOff : System.Web.UI.Page
    {
        string connString;
        DBAccess data;

        protected void Page_Load(object sender, EventArgs e)
        {
            connString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            data = new DBAccess(connString);
            if (!IsPostBack)
            {
                //Load Time Off Type
                LoadTimeOffType();
            }

        }
        protected void LoadTimeOffType()
        {
            ptoType.DataSource = data.GetTimeOffType();
            ptoType.DataTextField = "description";
            ptoType.DataValueField = "typeid";
            ptoType.DataBind();

        }

        protected void Save(object sender, EventArgs e)
        {
            if(IsValid)
            {
                PTORequest newrequest = new PTORequest
                {
                    userid = 1,
                    typeid = Int32.Parse(ptoType.SelectedValue),
                    comments = ptoComments.Text,
                    start_date = DateTime.Parse(ptoTo.Text),
                    end_date = DateTime.Parse(ptoFrom.Text),
                    hours = Int32.Parse(ptoHours.Text)
                };

                data.InsertPTORequest(newrequest);
            }

        }
        protected void Cancel(object sender, EventArgs e)
        {

        }
    }
}