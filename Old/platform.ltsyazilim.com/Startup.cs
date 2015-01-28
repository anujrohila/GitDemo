using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(platform.ltsyazilim.com.Startup))]
namespace platform.ltsyazilim.com
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            
        }
    }
}
