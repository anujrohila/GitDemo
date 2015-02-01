using Itsyazilim.Web.Domain.Resources;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Itsyazilim.Web.UI.Models;
using System.Web.Security;

namespace Itsyazilim.Web.UI.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            using (var db = new LtsWebEntities())
            {
                var user = db.Membership.FirstOrDefault(u => u.Email == "anuj.rohila94@gmail.com");
                Session["LoggedUserId"] = user.UserId.ToString();
                Session["LoggedUserRoleId"] = user.RoleId.ToString();
                Session["LoggedUserName"] = user.Name.ToString();
                Session["LoggedUserSurname"] = user.Surname.ToString();
                FormsAuthentication.SetAuthCookie(user.Email, true);
            }
            return RedirectToAction("AddFirm", "Manage");
            //if (Request.IsAuthenticated) return RedirectToAction("Index", "Manage");
            //return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = ItsyazilimWebResources.lblAboutUs;

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = ItsyazilimWebResources.lblContactPage;

            return View();
        }
    }
}