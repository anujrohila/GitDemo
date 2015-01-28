using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Itsyazilim.Web.UI.Models;

namespace Itsyazilim.Web.UI.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index(LoginViewModel model)
        {
            if (Request.IsAuthenticated) return RedirectToAction("Index", "Manage");
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Hakkımızda";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "İletişim sayfası";

            return View();
        }
    }
}