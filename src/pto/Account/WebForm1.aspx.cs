using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataLayer;

namespace pto.Account
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SaveTestData(connString);
        }
        protected void SaveTestData(string connString)
        {
            DBAccess data = new DBAccess(connString);
            /*

            PTORequest newrequest = new PTORequest
            {
                userid = 1,
                typeid = 2,
                comments = "Test 2 This is a test",
                start_date = DateTime.Now,
                end_date = DateTime.Now,
                hours = 8
            };

            data.InsertPTORequest(newrequest);

            */


            gvReport.DataSource = data.Report_EmployeeDetail(1);
            gvReport.DataBind();
            if (data.error)
            {
                Response.Write(data.errorMessage);
            }
        }
    }
}