using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataLayer;
using System.Data;
using pto.Controls.Reports;
using pto.Controls;

namespace pto.Admin
{
    public partial class Reports : System.Web.UI.Page
    {


        protected void Page_Load(object sender, EventArgs e)
        {
            EmployeeCtrl.OnEmployeeChange += EmployeeCtrl_OnEmployeeChange;
            EmployeeCtrl1.OnEmployeeChange += EmployeeCtrl1_OnEmployeeChange;

            {
                if ((Request.QueryString["rid"] != null))
                {
                LoadReports(Convert.ToInt32(Request.QueryString["rid"]));
                }
                
            }
        }

        private void EmployeeCtrl1_OnEmployeeChange(object sender, EventArgs e)
        {
            LoadScheduledPTO();
        }

        private void EmployeeCtrl_OnEmployeeChange(object sender, EventArgs e)
        {
            LoadEmployeeDetailReport();

        }

        protected void LoadReports(int rid)
        {
            switch(rid)
            {
                case 1:
                    pnl_EmployeeBalanceReport.Visible = true;
                    EmployeeBalanceReport.LoadEmployeeBalanceReport();
                    break;
                case 2:
                    pnl_EmployeeDetailReport.Visible = true;
                    LoadEmployeeDetailReport();
                    break;
                case 3:
                    pnlScheduledPTO.Visible = true;
                    LoadScheduledPTO();
                    break;
                default:
                    break;
               
            }
        }
        protected void LoadEmployeeDetailReport()
        {

            // Load Employee Data
            DataTable EmployeeList = EmployeeCtrl.GetEmployeeList();
            if (EmployeeCtrl.EmployeeID != 0)
            {
                DataView dv = new DataView(EmployeeList);
                dv.RowFilter = "userid = " + EmployeeCtrl.EmployeeID;
                rptEmployeeDetailReport.DataSource = dv;
            }
            else
            {
                rptEmployeeDetailReport.DataSource = EmployeeList;
            }
            
            rptEmployeeDetailReport.DataBind();
        }


        protected void rptEmployeeDetailReport_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item ||
        e.Item.ItemType == ListItemType.AlternatingItem)
            {

                DataRowView employee = (DataRowView) e.Item.DataItem;
                EmployeeDetailReport control = (EmployeeDetailReport) e.Item.FindControl("EmployeeDetailReport");
                control.LoadPTODetailsToDate(Convert.ToInt32(employee["userid"]), Convert.ToString(employee["name"]));
    
            }



        }
        protected void LoadScheduledPTO()
        {

            // Load Employee Data
            DataTable EmployeeList = EmployeeCtrl1.GetEmployeeList();
            if (EmployeeCtrl1.EmployeeID != 0)
            {
                DataView dv = new DataView(EmployeeList);
                dv.RowFilter = "userid = " + EmployeeCtrl1.EmployeeID;
                rptScheduledPTO.DataSource = dv;
            }
            else
            {
                rptScheduledPTO.DataSource = EmployeeList;
            }

            rptScheduledPTO.DataBind();
        }

        protected void rptScheduledPTO_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item ||
        e.Item.ItemType == ListItemType.AlternatingItem)
            {

                DataRowView employee = (DataRowView)e.Item.DataItem;
                ScheduledPTO control = (ScheduledPTO)e.Item.FindControl("ScheduledPTO");
                control.LoadScheduledPTO(Convert.ToInt32(employee["userid"]), Convert.ToString(employee["name"]));

            }

        }
    }
}