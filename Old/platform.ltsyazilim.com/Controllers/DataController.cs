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
using DevExpress.Web.Mvc;
using System.ComponentModel;
using platform.ltsyazilim.com.Models;

namespace platform.ltsyazilim.com.Controllers
{
    public partial class DataController : Controller
    {
        platform.ltsyazilim.com.Models.LtsWebEntities db = new platform.ltsyazilim.com.Models.LtsWebEntities();
        // GET: Data
        public ActionResult GetCounties()
        {
            ViewData["Counties"] = DataProvider.GetCounties();
            return PartialView();
        }

        public ActionResult TreeListCountyList()
        {
            var model = db.ManageSelectCountyListForTreeView();
            return PartialView("_TreeListCountyList", model.ToList());
        }
    }
}