using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataLayer;
using System.Data;

namespace pto.Controls
{
    public partial class PTORequestFormCtrl : System.Web.UI.UserControl
    {
        string connString;
        DBAccess data;
        
        protected void Page_Load(object sender, EventArgs e)
        {


        }
        public event EventHandler PTORequestedSuccess;
        public event EventHandler PTORequestedCancel;
        public event EventHandler PTORequestedExist;


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

        public void UpdatePTORequest(int pto_ID)
        {
            //Used to load control for Admin
            ptoID.Value = pto_ID.ToString();

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
                //pnlExistingPTO.Visible = false;
                pnlPTORequestForm.Visible = true;

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

        protected void LoadPTORequest(int id, int userid)
        {
            connString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            data = new DBAccess(connString);

            //Load PTO Request By ID
            //PTORequest request = data.GetPTORequestByID(id, userid);
            PTORequest request = data.GetPTORequestDetailsByID(id);

            if (request != null)
            {
                ptoEmployee.SelectedValue = request.UserId.ToString();
                ptoType.SelectedValue = request.TypeId.ToString();
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

        protected bool PTORequestExists()
        {
            connString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            data = new DBAccess(connString);
            // Check for existing PTO Requests that fall during current PTO Request
            DataTable myResults = data.PTORequestsInRange(Int32.Parse(ptoEmployee.SelectedItem.Value),
                                                        DateTime.Parse(ptoFrom.Text).Date, 
                                                        DateTime.Parse(ptoTo.Text).Date);

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
            if (request.StartDate <= DateTime.Now)
            {
                data.UpdateUsedPTOBalance(request.UserId, request.Hours);
            }
            // If PTORequest already accured need to subtract from pto_taken
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
            if (PTORequestedCancel != null)
                this.PTORequestedCancel(this, new EventArgs());

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

                
                //if (PTORequestExists(request))
                //{
                    // Previous PTO Request overlaps with new PTO request
                    // Hide PTO Request form and show panel with matching PTO Requests
                 //   lblErrorMessage.Text = "There is a PTO request that overlaps with the dates provided.";
                 //   lblErrorMessage.Visible = true;
                    //if (PTORequestedExist != null)
                     //  this.PTORequestedExist(this, new EventArgs());

                //}
                //else
                //{
                    if (SaveData(request))
                    {
                        // Data saved successfull - redirect to dashboard
                        if (PTORequestedSuccess != null)
                            this.PTORequestedSuccess(this, new EventArgs());

                    }
                    else
                    {
                        // Error occurred while saving data
                        lblErrorMessage.Text += "There was an error saving requests.";
                        lblErrorMessage.Visible = true;
                    }
                //}




            }
        }
        protected void EditPTORequest(object sender, EventArgs e)
        {
            int id = Int32.Parse(((sender as LinkButton).CommandArgument).ToString());
            ptoID.Value = id.ToString();
        }



        protected void ValidateDates_ServerValidate(object source, ServerValidateEventArgs args)
        {
            try
            {

                if (PTORequestExists())
                {
                    args.IsValid = false;
                    

                }

            }

            catch (Exception ex)
            {

                args.IsValid = false;

            }
        }
    }

    }
