using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;
using Hangfire;
using DataLayer;
using Hangfire.Storage;

namespace pto
{
    public class Global : HttpApplication
    {
        private BackgroundJobServer _backgroundJobServer;

        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
            GlobalConfiguration.Configuration
                 .UseSqlServerStorage("ConnectionString");

            _backgroundJobServer = new BackgroundJobServer();
            string connString;
            connString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;


            using (var connection = JobStorage.Current.GetConnection())
            {
                foreach (var recurringJob in connection.GetRecurringJobs())
                {
                    RecurringJob.RemoveIfExists(recurringJob.Id);
                }
            }
            RecurringJob.AddOrUpdate(() => JobScheduler.RunAccrualJob(connString), Cron.Monthly);
            RecurringJob.AddOrUpdate(() => JobScheduler.RunDailyPTOCheck(connString), Cron.Daily, TimeZoneInfo.Local);

        }
        protected void Application_End(object sender, EventArgs e)
        {
            _backgroundJobServer.Dispose();
        }
    }
}