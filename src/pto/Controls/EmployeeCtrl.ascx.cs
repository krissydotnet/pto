using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataLayer;
using System.Data;


namespace pto.Controls
{
    public partial class EmployeeCtrl : System.Web.UI.UserControl
    {
        public event EventHandler OnEmployeeChange;
        string connString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        public int EmployeeID;
        public string EmployeeName;
        public DataTable EmployeeList;

        protected void Page_Load(object sender, EventArgs e)
        {
            ddlEmployee.SelectedIndexChanged += ddlEmployee_SelectedIndexChanged;

            if (!IsPostBack)
            {
                LoadUsers(connString);

            }
        }

        private void ddlEmployee_SelectedIndexChanged(object sender, EventArgs e)
        {
            EmployeeID = Convert.ToInt32(ddlEmployee.SelectedItem.Value);
            EmployeeName = ddlEmployee.SelectedItem.Text;
            if (OnEmployeeChange != null)
                OnEmployeeChange(this, e);
        }
    

        protected void LoadUsers(string connString)
        {
            DBAccess data = new DBAccess(connString);
            EmployeeList = data.GetUsers();
            ddlEmployee.DataSource = EmployeeList;
            ddlEmployee.DataBind();
            ddlEmployee.DataTextField = "name";
            ddlEmployee.DataValueField = "userid";
            ddlEmployee.DataBind();
            ListItem l = new ListItem("All", "0", true);
            l.Selected = true;
            ddlEmployee.Items.Add(l);

        }
        public DataTable GetEmployeeList()
        {
            DBAccess data = new DBAccess(connString);
            EmployeeList = data.GetUsers();
            return EmployeeList;
        }
    }
}