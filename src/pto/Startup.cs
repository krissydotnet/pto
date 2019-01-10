using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(pto.Startup))]
namespace pto
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
