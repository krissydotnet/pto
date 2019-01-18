﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataLayer;
using System.Data;

namespace pto.Controls
{
    public partial class CalendarControl : System.Web.UI.UserControl
    {
        string connString;
        DBAccess data;


        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["SelectedDates"] != null)
            {
                List<DateTime> newList = (List<DateTime>)Session["SelectedDates"];
                foreach (DateTime dt in newList)
                {
                    Calendar1.SelectedDates.Add(dt);
                }
            }
        }

        public void LoadFuturePTORequests(int userid)
        {
            connString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            data = new DBAccess(connString);

            List<DateTime> list = new List<DateTime>();
            DateTime startDate = DateTime.Today;
            DateTime endDate = new DateTime(DateTime.Now.Year, 12, 31);

            DataTable myTable = data.PTORequestsInRange(userid, startDate, endDate);
            foreach (DataRow row in myTable.Rows)
            {
                DateTime start = DateTime.Parse(row["start_date"].ToString());
                DateTime end = DateTime.Parse(row["end_date"].ToString());

                for (var dt = start; dt <= end; dt = dt.AddDays(1))
                {
                    Calendar1.SelectedDates.Add(dt);
                    list.Add(dt);
                }
                
            }
            Session["SelectedDates"] = list;

        }
    }
}