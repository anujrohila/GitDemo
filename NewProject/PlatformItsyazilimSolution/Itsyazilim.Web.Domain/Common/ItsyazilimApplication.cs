using System;
using System.Resources;

namespace Itsyazilim.Web.Domain
{
    /// <summary>
    /// This is a main class (static) it will store application specific settings to access from whole application
    /// This class is used in web.ui only
    /// </summary>
    public static class OrderManagementApplicationWebUI
    {
        static OrderManagementApplicationWebUI()
        {

        }
        public static string WebUrlPrefix
        {
            get
            {
                return Convert.ToString(System.Configuration.ConfigurationManager.AppSettings["WebUrlPrefix"]);
            }
        }

        public static ResourceManager ResourceScript
        {
            get
            {
                return Itsyazilim.Web.Domain.Resources.ItsyazilimWebResources.ResourceManager;
            }
        }
    }
}
