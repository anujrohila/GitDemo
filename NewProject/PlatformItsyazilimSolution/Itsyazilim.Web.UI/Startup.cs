using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Itsyazilim.Web.UI.Startup))]
namespace Itsyazilim.Web.UI
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
