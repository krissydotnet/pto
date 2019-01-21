using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataLayer;
using System.Data;

namespace pto.Controls
{
    public partial class CreditPTOCtrl : System.Web.UI.UserControl
    {
        string connString;
        DBAccess data;
        
        protected void Page_Load(object sender, EventArgs e)
        {


        }
        public event EventHandler PTOCreditedSuccess;
        public event EventHandler PTOCreditedCancel;



        public void CreditPTO()
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

                //Load Employess drop down list
                ptoEmployee.DataSource = data.GetUsers();
                ptoEmployee.DataTextField = "name";
                ptoEmployee.DataValueField = "userid";
                ptoEmployee.DataBind();



                //Reset visibility of panels
                lblErrorMessage.Visible = false;
                //pnlExistingPTO.Visible = false;
                pnlPTOCreditForm.Visible = true;

            }




        protected Boolean SaveData(PTORequest request)
        {
            //Save request
            data = new DBAccess(connString);
            data.InsertPTORequest(request);

            // If PTORequest already accured need to subtract from pto_taken
            lblErrorMessage.Text = data.errorMessage;
            return !data.error;
        }

        

        protected void Cancel(object sender, EventArgs e)
        {
            if (PTOCreditedCancel != null)
                this.PTOCreditedCancel(this, new EventArgs());

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
                    TypeId = 8, // Typeid 8 is PTO Credit
                    StartDate = DateTime.Now,
                    EndDate = DateTime.Now,
                    Hours = Int32.Parse(ptoHours.SelectedValue),
                    Credit = true,
                    Comments = ptoComments.Text
                };

                
                    if (SaveData(request))
                    {
                        // Data saved successfull - redirect to dashboard
                        if (PTOCreditedSuccess != null)
                            this.PTOCreditedSuccess(this, new EventArgs());

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




    }

}
