using Microsoft.Owin;
using Owin;
using Hangfire;

[assembly: OwinStartupAttribute(typeof(pto.Startup))]
namespace pto
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
            GlobalConfiguration.Configuration.UseSqlServerStorage("ConnectionString");

            app.UseHangfireDashboard();
            app.UseHangfireServer();
        }
    }
}
