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
    public partial class PTORequestForm : System.Web.UI.UserControl
    {
        string connString;
        DBAccess data;
        protected void Page_Load(object sender, EventArgs e)
        {


        }
        public void NewPTORequest(int userid)
        {
            //Used to load control for Employees
            connString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            data = new DBAccess(connString);

            SetUpForm();
            Mode.Value = "new";
            UserID.Value = userid.ToString();
            ptoEmployee.SelectedValue = userid.ToString();
            rowEmployee.Visible = false;
        }
        public void NewPTORequest()
        {
            //Used to load control for Admin
            connString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            data = new DBAccess(connString);

            SetUpForm();
            Mode.Value = "new";
            UserID.Value = "";
        }

        protected void SetUpForm()
            {
                //Prevent autocomplete
                ptoFrom.Attributes.Add("autocomplete", "off");
                ptoTo.Attributes.Add("autocomplete", "off");

                //Load Employess drop down list
                ptoEmployee.DataSource = data.GetUsers();
                ptoEmployee.DataTextField = "name";
                ptoEmployee.DataValueField = "userid";
                ptoEmployee.DataBind();

                //Setup date restrictions on CalenderExtender
                ptoFrom_CalendarExtender.StartDate = DateTime.Now.AddMonths(-1);
                ptoFrom_CalendarExtender.EndDate = DateTime.Now.AddYears(1);
                ptoTo_CalendarExtender.StartDate = DateTime.Now.AddMonths(-1);
                ptoTo_CalendarExtender.EndDate = DateTime.Now.AddYears(1);

                //Load TimeOffType drop down list
                ptoType.DataSource = data.GetTimeOffType();
                ptoType.DataTextField = "description";
                ptoType.DataValueField = "typeid";
                ptoType.DataBind();

                //Reset visibility of panels
                lblErrorMessage.Visible = false;
                pnlExistingPTO.Visible = false;
                pnlPTORequestForm.Visible = true;
            }

        

        protected void LoadPTORequest(int id, int userid)
        {
            connString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            data = new DBAccess(connString);

            //Load PTO Request By ID
            PTORequest request = data.GetPTORequestByID(id, userid);
            if (request != null)
            {
                //ptoType.SelectedValue = request.TypeId.ToString();
                ptoFrom.Text = request.StartDate.ToShortDateString();
                ptoTo.Text = request.EndDate.ToShortDateString();
                if (request.StartDate == request.EndDate)
                {
                    ptoHours.SelectedValue = request.Hours.ToString();

                }
                else
                {
                    ptoHours.SelectedValue = "8";
                }
                ptoComments.Text = request.Comments;
            }


        }

        protected bool PTORequestExists(PTORequest request)
        {


            // Check for existing PTO Requests that fall during current PTO Request
            DataTable myResults = data.PTORequestsInRange(request.UserId, request.StartDate, request.EndDate);
            gvExistingRequests.DataSource = myResults;
            gvExistingRequests.DataBind();

            if ((myResults != null) && (myResults.Rows.Count > 0))
            {
                return true;
            }
            return false;
        }


        protected Boolean SaveData(PTORequest request)
        {
            //Save request
            data = new DBAccess(connString);
            data.InsertPTORequest(request);
            lblErrorMessage.Text = data.errorMessage;
            return !data.error;
        }
        protected Boolean UpdateData(PTORequest request)
        {
            //Save request
            data = new DBAccess(connString);
            data.UpdatePTORequest(request);
            return !data.error;
        }
        protected void Cancel(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }

        protected void SubmitForm(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                connString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                data = new DBAccess(connString);

                PTORequest request = new PTORequest
                {
                    UserId = Int32.Parse(ptoEmployee.SelectedItem.Value),
                    TypeId = Int32.Parse(ptoType.SelectedValue),
                    StartDate = DateTime.Parse(ptoFrom.Text).Date,
                    EndDate = DateTime.Parse(ptoTo.Text).Date,
                    Comments = ptoComments.Text
                };
                int hours = Int32.Parse(ptoHours.SelectedValue);
                request.Hours = GetWorkingDays(request.StartDate, request.EndDate) * hours;

                /*if (!String.IsNullOrEmpty(Request.QueryString["rid"]))
                {
                    request.Id = Convert.ToInt32(Request.QueryString["rid"]);
                    //Update PTORequest if rid in querystring
                    if (UpdateData(request))
                    {
                        // Data saved successfull - redirect to dashboard
                        Response.Redirect("Default.aspx");
                    }
                    else
                    {
                        // Error occurred while updating data
                        lblErrorMessage.Text = "There was an error saving requests.";
                        lblErrorMessage.Visible = true;
                    }
                }
                else */
                if (PTORequestExists(request))
                {
                    // Previous PTO Request overlaps with new PTO request
                    // Hide PTO Request form and show panel with matching PTO Requests
                    pnlPTORequestForm.Visible = false;
                    pnlExistingPTO.Visible = true;
                }
                else
                {
                    if (SaveData(request))
                    {
                        // Data saved successfull - redirect to dashboard
                        Response.Redirect("Default.aspx");
                    }
                    else
                    {
                        // Error occurred while saving data
                        //lblErrorMessage.Text += "There was an error saving requests.";
                        lblErrorMessage.Visible = true;
                    }
                }




            }
        }
        protected void gvExistingRequests_RowCommand(Object sender, GridViewCommandEventArgs e)
        {
            // If multiple buttons are used in a GridView control, use the
            // CommandName property to determine which button was clicked.
            if (e.CommandName == "Edit")
            {
                // Convert the row index stored in the CommandArgument
                // property to an Integer.
                int index = Convert.ToInt32(e.CommandArgument);

                // Retrieve the row that contains the button clicked 
                // by the user from the Rows collection.
                GridViewRow row = gvExistingRequests.Rows[index];
                int rID = Int32.Parse(gvExistingRequests.DataKeys[index].Value.ToString());
                ptoID.Value = rID.ToString();
                Mode.Value = "edit";
                // Now you have access to the gridviewrow.
            }
        }

        public static int GetWorkingDays(DateTime from, DateTime to)
        {
            var totalDays = 1;
            for (var date = from; date < to; date = date.AddDays(1))
            {
                if (date.DayOfWeek != DayOfWeek.Saturday
                    && date.DayOfWeek != DayOfWeek.Sunday)
                    totalDays++;
            }

            return totalDays;
        }

        protected void gvExistingRequests_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }
    }

    }
