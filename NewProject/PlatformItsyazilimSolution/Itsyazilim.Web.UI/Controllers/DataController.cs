using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;
using System.Text;
using System.Text.RegularExpressions;
//using DevExpress.Web.Mvc;
using System.ComponentModel;
using Itsyazilim.Web.UI.Models;
using Itsyazilim.Web.BLL;

namespace Itsyazilim.Web.UI.Controllers
{
    public partial class DataController : Controller
    {
        Itsyazilim.Web.UI.Models.LtsWebEntities db = new Itsyazilim.Web.UI.Models.LtsWebEntities();
        // GET: Data
        public ActionResult GetCounties()
        {
            ViewData["Counties"] = MasterBusinessLogic.GetAllCountry();
            return PartialView();
        }

        public ActionResult TreeListCountyList()
        {
            var model = db.ManageSelectCountyListForTreeView();
            return PartialView("_TreeListCountyList", model);
        }
    }
}