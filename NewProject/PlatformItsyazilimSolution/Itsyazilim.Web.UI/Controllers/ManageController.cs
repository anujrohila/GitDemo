using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using System.Globalization;
using Itsyazilim.Web.UI.Models;


namespace Itsyazilim.Web.UI.Controllers
{

    [Authorize]
    public class ManageController : Controller
    {
        public TextInfo Ti = new CultureInfo(System.Threading.Thread.CurrentThread.CurrentCulture.ToString(), false).TextInfo;
        public LtsWebEntities db = new LtsWebEntities();

        public ActionResult Logout()
        {
            
            FormsAuthentication.SignOut();
            System.Web.HttpContext.Current.Session.Abandon();
            return RedirectToAction("Index", "Home");
        }

        public ActionResult SetLogin(string ActionName, string ControllerName)
        {

            // Roles Table
            // 0 Hiç bir firmayla bağlantısı olmayan kullanıcı
            // 1 bir firma eklemiş, firma sistem yönetici tarafından onaylanmamış
            // 2 Normal kullanıcı
            // 3 Sistem kullanıcısı
            if (Session["LoggedUserId"] == null)
            {
                using (var db = new LtsWebEntities())
                {
                    var user = db.Membership.FirstOrDefault(u => u.Email == User.Identity.Name);

                    Session["LoggedUserId"] = user.UserId.ToString();
                    Session["LoggedUserRoleId"] = user.RoleId.ToString();
                    Session["LoggedUserName"] = user.Name.ToString();
                    Session["LoggedUserSurname"] = user.Surname.ToString();
                }
            }


            switch (Session["LoggedUserRoleId"].ToString())
            {
                case "0":
                    return RedirectToAction("AddFirm", "Manage");
                case "1":
                    return RedirectToAction("WaitingFirmApproval", "Manage");
                case "3":
                    return RedirectToAction("Index", "Administrator", "Administrator");
                default:
                    return (ActionName == "") ? RedirectToAction("Index", "Manage") : RedirectToAction(ActionName, ControllerName);
            }
        }

        public ActionResult Index()
        {
            if (Session["LoggedUserId"] == null) { return SetLogin("Index", "Manage"); }
            else
            {
                if (Convert.ToInt32(Session["LoggedUserRoleId"]) != 2)
                    return SetLogin("Index", "Manage");
                else return View();
            }
        }

        [HttpGet]
        public ActionResult AddFirm()
        {
            if (Session["LoggedUserId"] == null) { return SetLogin("Index", "Manage"); }
            else
            {
                if (Convert.ToInt32(Session["LoggedUserRoleId"]) != 0)
                    return SetLogin("Index", "Manage");
                else return View();
            }
        }

        [HttpPost]
        public ActionResult AddFirm(FirmViewModel model)
        {
            if (Session["LoggedUserId"] == null) { return SetLogin("AddFirm", "Manage"); }
            else
            {
                if (Convert.ToInt32(Session["LoggedUserRoleId"]) != 0)
                { return SetLogin("Index", "Manage"); }
                else
                {
                    if (ModelState.IsValid)
                    {
                        using (var db = new LtsWebEntities())
                        {
                            var LoggedUserId = Convert.ToInt32(Session["LoggedUserId"]);
                            var MapFirmToUser = db.Firms.FirstOrDefault(u => u.IsApproved == false && u.CreatedBy == LoggedUserId);
                            if (MapFirmToUser == null)
                            {
                                var NewFirm = db.Firms.Create();
                                NewFirm.FirmName = Ti.ToTitleCase(model.FirmName.Trim().ToLower());
                                NewFirm.CountyId = model.CountyId;
                                NewFirm.Address = Ti.ToTitleCase(model.Address.Trim().ToLower());
                                NewFirm.TaxOffice = Ti.ToTitleCase(model.TaxOffice.Trim().ToLower());

                                NewFirm.TaxNo = model.TaxNo;
                                NewFirm.Phone1 = model.Phone1;
                                NewFirm.Phone2 = model.Phone2;
                                NewFirm.Fax = model.Fax;
                                NewFirm.MobilePhone = model.MobilePhone;
                                NewFirm.Email = (!String.IsNullOrEmpty(model.Email)) ? model.Email.Trim().ToLower() : model.Email;
                                NewFirm.WebSite = (!String.IsNullOrEmpty(model.WebSite)) ? model.WebSite.Trim().ToLower() : model.WebSite;
                                NewFirm.CreatedBy = LoggedUserId;
                                NewFirm.IsApproved = false;
                                NewFirm.CreatedOn = DateTime.Now;
                                NewFirm.UpdatedOn = null;

                                db.Firms.Add(NewFirm);
                                db.SaveChanges();

                                ManageMailingController.SendMailForNewFirm(NewFirm);

                                var NewMap = db.MapFirmToUser.Create();
                                var AddedFirm = db.Firms.FirstOrDefault(u => u.IsApproved == false && u.CreatedBy == LoggedUserId);
                                NewMap.UserId = LoggedUserId;
                                NewMap.FirmId = AddedFirm.FirmId;
                                NewMap.IsAdmin = true;
                                NewMap.CreatedOn = DateTime.Now;
                                NewMap.IsActive = false;
                                db.MapFirmToUser.Add(NewMap);
                                db.SaveChanges();


                                var user = db.Membership.FirstOrDefault(u => u.UserId == LoggedUserId);
                                user.RoleId = 1;
                                db.SaveChanges();

                                Session["LoggedUserId"] = null;
                                return SetLogin("AddFirm", "Manage");
                            }
                            else return View(model);
                        }
                    }
                    return View(model);
                }
            }
        }

        [HttpGet]
        public ActionResult WaitingFirmApproval()
        {
            if (Session["LoggedUserId"] == null) { return SetLogin("Index", "Manage"); }
            else
            {
                if (Convert.ToInt32(Session["LoggedUserRoleId"]) != 1)
                    return SetLogin("Index", "Manage");
                else
                {
                    var db = new LtsWebEntities();
                    var LoggedUserId = Convert.ToInt32(Session["LoggedUserId"]);
                    var firm = db.Firms.FirstOrDefault(u => u.IsApproved == false && u.CreatedBy == LoggedUserId);
                    if (firm != null)
                    {
                        FirmViewModel model = new FirmViewModel();
                        model.FirmId = firm.FirmId;
                        model.Address = firm.Address;
                        model.CountyId = firm.CountyId;
                        model.CreatedBy = firm.CreatedBy;
                        model.CreatedOn = firm.CreatedOn;
                        model.Email = firm.Email;
                        model.Fax = firm.Fax;
                        model.FirmId = firm.FirmId;
                        model.FirmName = firm.FirmName;
                        model.MobilePhone = firm.MobilePhone;
                        model.Phone1 = firm.Phone1;
                        model.Phone2 = firm.Phone2;
                        model.TaxNo = firm.TaxNo;
                        model.TaxOffice = firm.TaxOffice;
                        model.WebSite = firm.WebSite;
                        return View(model);
                    }
                    else
                    {
                        Session["LoggedUserId"] = null;
                        return SetLogin("WaitingFirmApproval", "Manage");
                    }
                }
            }
        }

        [HttpPost]
        public ActionResult WaitingFirmApproval(FirmViewModel model)
        {
            if (Session["LoggedUserId"] == null) { return SetLogin("AddFirm", "Manage"); }
            else
            {
                if (Convert.ToInt32(Session["LoggedUserRoleId"]) != 1)
                { return SetLogin("Index", "Manage"); }
                else
                {
                    if (ModelState.IsValid)
                    {
                        var db = new LtsWebEntities();
                        var LoggedUserId = Convert.ToInt32(Session["LoggedUserId"]);
                        var firm = db.Firms.FirstOrDefault(u => u.FirmId == model.FirmId && u.IsApproved == false);
                        if (firm != null)
                        {
                            model.FirmName = Ti.ToTitleCase(model.FirmName.Trim().ToLower());
                            model.Address = Ti.ToTitleCase(model.Address.Trim().ToLower());
                            model.TaxOffice = Ti.ToTitleCase(model.TaxOffice.Trim().ToLower());
                            model.Email = (!String.IsNullOrEmpty(model.Email)) ? model.Email.Trim().ToLower() : model.Email;
                            model.WebSite = (!String.IsNullOrEmpty(model.WebSite)) ? model.WebSite.Trim().ToLower() : model.WebSite;

                            firm.FirmName = model.FirmName;
                            firm.CountyId = model.CountyId;
                            firm.Address = model.Address;
                            firm.TaxOffice = model.TaxOffice;

                            firm.TaxNo = model.TaxNo;
                            firm.Phone1 = model.Phone1;
                            firm.Phone2 = model.Phone2;
                            firm.Fax = model.Fax;
                            firm.MobilePhone = model.MobilePhone;
                            firm.Email = model.Email;
                            firm.WebSite = model.WebSite;
                            firm.UpdatedOn = DateTime.Now;
                            db.SaveChanges();
                            TempData["Updated"] = "Yes";
                            return View(model);
                        }
                        else
                        {
                            Session["LoggedUserId"] = null;
                            return SetLogin("WaitingFirmApproval", "Manage");
                        }
                    }
                    return View(model);
                }
            }
        }


        [HttpGet]
        public ActionResult AddOrder()
        {
            if (Session["LoggedUserId"] == null) { return SetLogin("Index", "Manage"); }
            else
            {
                if (Convert.ToInt32(Session["LoggedUserRoleId"]) != 2)
                    return SetLogin("Index", "Manage");
                else
                {
                    return View();
                }
            }
        }


        public PartialViewResult AddOrderType1(OrderType1Model model)
        {
            return PartialView("_AddOrderType1", model);
        }
        public PartialViewResult AddOrderType2(Orders model)
        {
            return PartialView("_AddOrderType2", model);
        }
        public PartialViewResult AddOrderType3(Orders model)
        {
            return PartialView("_AddOrderType3", model);
        }
        public PartialViewResult AddOrderType4(Orders model)
        {
            return PartialView("_AddOrderType4", model);
        }

        public ActionResult _TreeListOrderFromWhere()
        {
            var model = db.ManageSelectCountyListForTreeView();
            return PartialView("_TreeListOrderFromWhere", model.ToList());
        }
    }


}