using System;
using System.Text;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using Itsyazilim.Web.Domain;
using Itsyazilim.Web.UI;

namespace Itsyazilim.Web.UI
{
    public class BaseController : Controller
    {
        /// <summary>
        /// The below method will generate jave script file with json object same as resource file
        /// Object Name will be ``
        /// </summary>
        /// <returns></returns>
        public JavaScriptResult OrderManagementResource()
        {
            return ResourceJavaScripter.GetResourceScript(OrderManagementApplicationWebUI.ResourceScript);

        }

    }

}
