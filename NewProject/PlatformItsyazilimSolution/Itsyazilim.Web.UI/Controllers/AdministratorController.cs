using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
//using DevExpress.Web.Mvc;
using System.Globalization;
using Itsyazilim.Web.UI.Models;
using System.Web.Security;
using Itsyazilim.Web.Domain.Resources;
namespace Itsyazilim.Web.UI.Controllers
{
    public class AdministratorController : Controller
    {
        Itsyazilim.Web.UI.Models.LtsWebEntities db = new Itsyazilim.Web.UI.Models.LtsWebEntities();
        public TextInfo Ti = new CultureInfo(System.Threading.Thread.CurrentThread.CurrentCulture.ToString(), false).TextInfo;

        public bool CheckLogin()
        {
            if (Session["LoggedUserId"] == null) { SetLogin(); }
            return (Convert.ToInt32(Session["LoggedUserRoleId"]) == 3) ? true : false;
        }

        public void SetLogin()
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
                    var user = db.Membership.Where(u => u.Email == User.Identity.Name).FirstOrDefault();

                    Session["LoggedUserId"] = user.UserId.ToString();
                    Session["LoggedUserRoleId"] = user.RoleId.ToString();
                    Session["LoggedUserName"] = user.Name.ToString();
                    Session["LoggedUserSurname"] = user.Surname.ToString();
                }
            }
        }

        // GET: Administrator
        public ActionResult Index()
        {
            //if (!CheckLogin()) return RedirectToAction("Index", "Manage");
            //return View();
            using (var db = new LtsWebEntities())
            {
                var user = db.Membership.FirstOrDefault(u => u.Email == "anuj.rohila94@gmail.com");
                Session["LoggedUserId"] = user.UserId.ToString();
                Session["LoggedUserRoleId"] = "3";
                Session["LoggedUserName"] = user.Name.ToString();
                Session["LoggedUserSurname"] = user.Surname.ToString();
                FormsAuthentication.SetAuthCookie(user.Email, true);
            }
            return View();
        }

        public ActionResult FirmList()
        {
            if (!CheckLogin()) return RedirectToAction("Index", "Manage");

            var model = db.AdministratorSelectFirms();
            return View(model);
        }

        [ValidateInput(false)]
        public ActionResult GridViewFirmList()
        {
            var model = db.AdministratorSelectFirms();
            return PartialView("_GridViewFirmList", model.ToList());
        }

        public ActionResult FirmDetails(int id)
        {
            if (!CheckLogin()) return RedirectToAction("Index", "Manage");

            if (id >= 0)
            {
                IEnumerable<AdministratorSelectFirmDetails_Result> model = db.AdministratorSelectFirmDetails(id).ToList();
                if (model.Any())
                {
                    return View(model);
                }
            }
            return RedirectToAction("FirmList");
        }

        public ActionResult UnApprovedFirmList()
        {
            if (!CheckLogin()) return RedirectToAction("Index", "Manage");

            //IEnumerable<Firm> model = (from firm in db.Firms
            //                           join user in db.Memberships on firm.CreatedBy equals user.UserId
            //                           where firm.IsApproved == false
            //                           select new IEnumerable<Firm> { firm.FirmName }).ToList();

            var model = db.AdministratorSelectUnapprovedFirms();

            //IEnumerable<Firm> model = db.Firms.Where(f => f.IsApproved == false).Join(db.Memberships, user => user.)
            //.Where(cm => cm.DeviceTypeId == deviceTypeId)
            //.Join(repository.ConfigurationParameterGroups, cm => cm.ConfigurationParameterGroupId, cg => cg.Id, (cm, cg) => cg)
            //.ToList()
            //.Select(cg =>
            // new SelectListItem
            // {
            //     Text = (cg.Name).Trim(),
            //     Value = cg.Id.ToString()
            // }).ToList();
            return View(model);
        }

        [ValidateInput(false)]
        public ActionResult GridViewUnApprovedFirmList()
        {
            var model = db.AdministratorSelectUnapprovedFirms();
            //var model = (from firm in db.Firms
            //             select new
            //             {
            //                 FirmId = firm.FirmId,
            //                 FirmName = firm.FirmName,
            //                 IsApproved = firm.IsApproved
            //             });
            return PartialView("_GridViewUnApprovedFirmList", model.ToList());
        }



        public ActionResult UnApprovedFirmDetails(int? id)
        {
            if (!CheckLogin()) return RedirectToAction("Home");

            if (id >= 0)
            {
                IEnumerable<AdministratorSelectUnApprovedFirmDetails_Result> model = db.AdministratorSelectUnApprovedFirmDetails(id).ToList();
                if (model.Any())
                {
                    return View(model);
                }
            }
            return RedirectToAction("UnApprovedFirmList");
        }

        //public ActionResult Test2()
        //{
        //    var model = db.Firms.ToList();
        //    return View(model);
        //}

        public ActionResult FirmApproval(int? id)
        {
            if (!CheckLogin()) return RedirectToAction("Home");

            if (id >= 0)
            {
                var LoggedUserId = Convert.ToInt32(Session["LoggedUserId"]);
                var firm = db.Firms.Where(r => r.FirmId == id && r.IsApproved == false).FirstOrDefault();
                if (firm != null)
                {
                    firm.IsApproved = true;
                    firm.ApprovedBy = Convert.ToInt32(Session["LoggedUserId"]);
                    firm.ApprovedOn = DateTime.Now;

                    var map = db.MapFirmToUser.Where(r => r.FirmId == LoggedUserId).FirstOrDefault();
                    map.IsActive = true;

                    db.SaveChanges();

                    var user = db.Membership.Where(r => r.UserId == firm.CreatedBy).FirstOrDefault();
                    CommunicationController.SendSMSToUserForFirmAccepted(user.Name + " " + user.Surname, firm.MobilePhone.ToString());
                }
            }
            return RedirectToAction("UnApprovedFirmList");

        }


        /*Definition*/

        public ActionResult DefVehicleTypes()
        {
            if (!CheckLogin()) return RedirectToAction("Index", "Manage");
            return View();
        }

        [ValidateInput(false)]
        public ActionResult GridViewDefVehicleTypes()
        {
            var model = db.DefVehicleTypes.Where(r => r.IsDeleted == false).OrderBy(r => r.VehicleTypeName);
            return PartialView("_GridViewDefVehicleTypes", model.ToList());
        }

        [HttpPost, ValidateInput(false)]
        public ActionResult GridViewDefVehicleTypesAddNew(DefVehicleTypes item)
        {
            var model = db.DefVehicleTypes;

            if (ModelState.IsValid)
            {
                try
                {
                    item.VehicleTypeName = Ti.ToTitleCase(item.VehicleTypeName.Trim().ToLower());
                    item.VehicleVolume = Math.Round(Convert.ToDecimal(item.VehicleWidth * item.VehicleHeight * item.VehicleLength), 2);
                    item.VehicleDesi = Convert.ToInt32(item.VehicleVolume * 1000 / 3);
                    item.CreatedBy = Convert.ToInt32(Session["LoggedUserId"]);
                    item.CreatedOn = DateTime.Now;

                    model.Add(item);
                    db.SaveChanges();
                }
                catch
                {
                    ViewData["EditError"] = ItsyazilimWebResources.valRequiredAllFields;
                }
            }
            else
                ViewData["EditError"] = ItsyazilimWebResources.valRequiredAllFields;
            return PartialView("_GridViewDefVehicleTypes", db.DefVehicleTypes.Where(r => r.IsDeleted == false).OrderBy(r => r.VehicleTypeName).ToList());
        }
        [HttpPost, ValidateInput(false)]
        public ActionResult GridViewDefVehicleTypesUpdate(DefVehicleTypes item)
        {
            var model = db.DefVehicleTypes;
            if (ModelState.IsValid)
            {
                try
                {
                    var modelItem = model.FirstOrDefault(it => it.VehicleTypeId == item.VehicleTypeId);
                    if (modelItem != null)
                    {
                        modelItem.VehicleTypeName = Ti.ToTitleCase(item.VehicleTypeName.Trim().ToLower());
                        modelItem.VehicleVolume = Math.Round(Convert.ToDecimal(item.VehicleWidth * item.VehicleHeight * item.VehicleLength), 2);
                        modelItem.VehicleDesi = Convert.ToInt32(Convert.ToDecimal(Convert.ToDecimal(item.VehicleWidth * item.VehicleHeight * item.VehicleLength) * 1000 / 3));
                        modelItem.VehicleHeight = item.VehicleHeight;
                        modelItem.VehicleLength = item.VehicleLength;
                        modelItem.VehicleWeight = item.VehicleWeight;
                        modelItem.VehicleWidth = item.VehicleWidth;

                        db.DefVehicleTypes.Attach(modelItem);
                        db.Entry(modelItem).State = System.Data.Entity.EntityState.Modified;
                        db.SaveChanges();
                    }
                }
                catch
                {
                    ViewData["EditError"] = ItsyazilimWebResources.valRequiredAllFields;
                }
            }
            else
                ViewData["EditError"] = ItsyazilimWebResources.valRequiredAllFields;
            return PartialView("_GridViewDefVehicleTypes", db.DefVehicleTypes.Where(r => r.IsDeleted == false).OrderBy(r => r.VehicleTypeName).ToList());
        }

        [HttpPost, ValidateInput(false)]
        public ActionResult GridViewDefVehicleTypesDelete(System.Byte VehicleTypeId)
        {
            var model = db.DefVehicleTypes;
            if (VehicleTypeId != null)
            {
                try
                {
                    var item = model.FirstOrDefault(it => it.VehicleTypeId == VehicleTypeId && it.IsDeleted == false);
                    if (item != null)
                    {
                        item.IsDeleted = true;
                        item.DeletedBy = Convert.ToInt32(Session["LoggedUserId"]);
                        item.DeletedOn = DateTime.Now;
                        db.SaveChanges();
                    }
                }
                catch
                {
                    ViewData["EditError"] = ItsyazilimWebResources.lblError;
                }
            }
            return PartialView("_GridViewDefVehicleTypes", db.DefVehicleTypes.Where(r => r.IsDeleted == false).OrderBy(r => r.VehicleTypeName).ToList());
        }


        public ActionResult DefProductPackages()
        {
            if (!CheckLogin()) return RedirectToAction("Index", "Manage");
            return View();

        }

        [ValidateInput(false)]
        public ActionResult GridViewDefProductPackages()
        {
            var model = db.DefProductPackages.Where(r => r.IsDeleted == false).OrderBy(r => r.ProductPackageName);
            return PartialView("_GridViewDefProductPackages", model.ToList());
        }

        [HttpPost, ValidateInput(false)]
        public ActionResult GridViewDefProductPackagesAddNew(DefProductPackages item)
        {
            var model = db.DefProductPackages;
            if (ModelState.IsValid)
            {
                try
                {
                    item.ProductPackageName = Ti.ToTitleCase(item.ProductPackageName.Trim().ToLower());
                    item.CreatedBy = Convert.ToInt32(Session["LoggedUserId"]);
                    item.CreatedOn = DateTime.Now;

                    model.Add(item);
                    db.SaveChanges();
                }
                catch
                {
                    ViewData["EditError"] = ItsyazilimWebResources.valRequiredAllFields;
                }
            }
            else
                ViewData["EditError"] = ItsyazilimWebResources.valRequiredAllFields;
            return PartialView("_GridViewDefProductPackages", model.Where(r => r.IsDeleted == false).OrderBy(r => r.ProductPackageName).ToList());
        }
        [HttpPost, ValidateInput(false)]
        public ActionResult GridViewDefProductPackagesUpdate(DefProductPackages item)
        {
            var model = db.DefProductPackages;
            if (ModelState.IsValid)
            {
                try
                {
                    var modelItem = model.FirstOrDefault(it => it.ProductPackageId == item.ProductPackageId);
                    if (modelItem != null)
                    {
                        modelItem.ProductPackageName = Ti.ToTitleCase(item.ProductPackageName.Trim().ToLower());
                        db.DefProductPackages.Attach(modelItem);
                        db.Entry(modelItem).State = System.Data.Entity.EntityState.Modified;
                        db.SaveChanges();
                    }
                }
                catch
                {
                    ViewData["EditError"] = ItsyazilimWebResources.valRequiredAllFields;
                }
            }
            else
                ViewData["EditError"] = ItsyazilimWebResources.valRequiredAllFields;
            return PartialView("_GridViewDefProductPackages", model.Where(r => r.IsDeleted == false).OrderBy(r => r.ProductPackageName).ToList());
        }
        [HttpPost, ValidateInput(false)]
        public ActionResult GridViewDefProductPackagesDelete(System.Byte ProductPackageId)
        {
            var model = db.DefProductPackages;
            if (ProductPackageId != null)
            {
                try
                {
                    var item = model.FirstOrDefault(it => it.ProductPackageId == ProductPackageId && it.IsDeleted == false);
                    if (item != null)
                    {
                        item.IsDeleted = true;
                        item.DeletedBy = Convert.ToInt32(Session["LoggedUserId"]);
                        item.DeletedOn = DateTime.Now;
                        db.SaveChanges();
                    }
                }
                catch
                {
                    ViewData["EditError"] = ItsyazilimWebResources.lblError;
                }
            }
            return PartialView("_GridViewDefProductPackages", model.Where(r => r.IsDeleted == false).OrderBy(r => r.ProductPackageName).ToList());
        }



        public ActionResult DefProductUnits()
        {
            if (!CheckLogin()) return RedirectToAction("Index", "Manage");
            return View();

        }

        [ValidateInput(false)]
        public ActionResult GridViewDefProductUnits()
        {
            var model = db.DefProductUnits.Where(r => r.IsDeleted == false).OrderBy(r => r.ProductUnitName);
            return PartialView("_GridViewDefProductUnits", model.ToList());
        }

        [HttpPost, ValidateInput(false)]
        public ActionResult GridViewDefProductUnitsAddNew(DefProductUnits item)
        {
            var model = db.DefProductUnits;
            if (ModelState.IsValid)
            {
                try
                {
                    item.ProductUnitName = Ti.ToTitleCase(item.ProductUnitName.Trim().ToLower());
                    item.CreatedBy = Convert.ToInt32(Session["LoggedUserId"]);
                    item.CreatedOn = DateTime.Now;

                    model.Add(item);
                    db.SaveChanges();
                }
                catch
                {
                    ViewData["EditError"] = ItsyazilimWebResources.valRequiredAllFields;
                }
            }
            else
                ViewData["EditError"] = ItsyazilimWebResources.valRequiredAllFields;
            return PartialView("_GridViewDefProductUnits", model.Where(r => r.IsDeleted == false).OrderBy(r => r.ProductUnitName).ToList());
        }
        [HttpPost, ValidateInput(false)]
        public ActionResult GridViewDefProductUnitsUpdate(DefProductUnits item)
        {
            var model = db.DefProductUnits;
            if (ModelState.IsValid)
            {
                try
                {
                    var modelItem = model.FirstOrDefault(it => it.ProductUnitId == item.ProductUnitId);
                    if (modelItem != null)
                    {
                        modelItem.ProductUnitName = Ti.ToTitleCase(item.ProductUnitName.Trim().ToLower());
                        db.DefProductUnits.Attach(modelItem);
                        db.Entry(modelItem).State = System.Data.Entity.EntityState.Modified;
                        db.SaveChanges();
                    }
                }
                catch
                {
                    ViewData["EditError"] = ItsyazilimWebResources.valRequiredAllFields;
                }
            }
            else
                ViewData["EditError"] = ItsyazilimWebResources.valRequiredAllFields;
            return PartialView("_GridViewDefProductUnits", model.Where(r => r.IsDeleted == false).OrderBy(r => r.ProductUnitName).ToList());
        }
        [HttpPost, ValidateInput(false)]
        public ActionResult GridViewDefProductUnitsDelete(System.Byte ProductUnitId)
        {
            var model = db.DefProductUnits;
            if (ProductUnitId != null)
            {
                try
                {
                    var item = model.FirstOrDefault(it => it.ProductUnitId == ProductUnitId && it.IsDeleted == false);
                    if (item != null)
                    {
                        item.IsDeleted = true;
                        item.DeletedBy = Convert.ToInt32(Session["LoggedUserId"]);
                        item.DeletedOn = DateTime.Now;
                        db.SaveChanges();
                    }
                }
                catch
                {
                    ViewData["EditError"] = ItsyazilimWebResources.lblError;
                }
            }
            return PartialView("_GridViewDefProductUnits", model.Where(r => r.IsDeleted == false).OrderBy(r => r.ProductUnitName).ToList());
        }



        public ActionResult DefProductProperties()
        {
            if (!CheckLogin()) return RedirectToAction("Index", "Manage");
            return View();

        }

        [ValidateInput(false)]
        public ActionResult GridViewDefProductProperties()
        {
            var model = db.DefProductProperties.Where(r => r.IsDeleted == false).OrderBy(r => r.ProductPropertyName);
            return PartialView("_GridViewDefProductProperties", model.ToList());
        }

        [HttpPost, ValidateInput(false)]
        public ActionResult GridViewDefProductPropertiesAddNew(DefProductProperties item)
        {
            var model = db.DefProductProperties;
            if (ModelState.IsValid)
            {
                try
                {
                    item.ProductPropertyName = Ti.ToTitleCase(item.ProductPropertyName.Trim().ToLower());
                    item.CreatedBy = Convert.ToInt32(Session["LoggedUserId"]);
                    item.CreatedOn = DateTime.Now;

                    model.Add(item);
                    db.SaveChanges();
                }
                catch
                {
                    ViewData["EditError"] = ItsyazilimWebResources.valRequiredAllFields;
                }
            }
            else
                ViewData["EditError"] = ItsyazilimWebResources.valRequiredAllFields;
            return PartialView("_GridViewDefProductProperties", model.Where(r => r.IsDeleted == false).OrderBy(r => r.ProductPropertyName).ToList());
        }
        [HttpPost, ValidateInput(false)]
        public ActionResult GridViewDefProductPropertiesUpdate(DefProductProperties item)
        {
            var model = db.DefProductProperties;
            if (ModelState.IsValid)
            {
                try
                {
                    var modelItem = model.FirstOrDefault(it => it.ProductPropertyId == item.ProductPropertyId);
                    if (modelItem != null)
                    {
                        modelItem.ProductPropertyName = Ti.ToTitleCase(item.ProductPropertyName.Trim().ToLower());
                        db.DefProductProperties.Attach(modelItem);
                        db.Entry(modelItem).State = System.Data.Entity.EntityState.Modified;
                        db.SaveChanges();
                    }
                }
                catch
                {
                    ViewData["EditError"] = ItsyazilimWebResources.valRequiredAllFields;
                }
            }
            else
                ViewData["EditError"] = ItsyazilimWebResources.valRequiredAllFields;
            return PartialView("_GridViewDefProductProperties", model.Where(r => r.IsDeleted == false).OrderBy(r => r.ProductPropertyName).ToList());
        }
        [HttpPost, ValidateInput(false)]
        public ActionResult GridViewDefProductPropertiesDelete(System.Byte ProductPropertyId)
        {
            var model = db.DefProductProperties;
            if (ProductPropertyId != null)
            {
                try
                {
                    var item = model.FirstOrDefault(it => it.ProductPropertyId == ProductPropertyId && it.IsDeleted == false);
                    if (item != null)
                    {
                        item.IsDeleted = true;
                        item.DeletedBy = Convert.ToInt32(Session["LoggedUserId"]);
                        item.DeletedOn = DateTime.Now;
                        db.SaveChanges();
                    }
                }
                catch
                {
                    ViewData["EditError"] = ItsyazilimWebResources.lblError;
                }
            }
            return PartialView("_GridViewDefProductProperties", model.Where(r => r.IsDeleted == false).OrderBy(r => r.ProductPropertyName).ToList());
        }



        public ActionResult DefProductTypes()
        {
            if (!CheckLogin()) return RedirectToAction("Index", "Manage");
            return View();
        }

        [ValidateInput(false)]
        public ActionResult GridViewDefProductTypes()
        {
            var model = db.DefProductTypes.Where(r => r.IsDeleted == false).OrderBy(r => r.ProductTypeName);
            return PartialView("_GridViewDefProductTypes", model.ToList());
        }

        [HttpPost, ValidateInput(false)]
        public ActionResult GridViewDefProductTypesAddNew(DefProductTypes item)
        {
            var model = db.DefProductTypes;
            if (ModelState.IsValid)
            {
                try
                {
                    item.ProductTypeName = Ti.ToTitleCase(item.ProductTypeName.Trim().ToLower());
                    item.CreatedBy = Convert.ToInt32(Session["LoggedUserId"]);
                    item.CreatedOn = DateTime.Now;

                    model.Add(item);
                    db.SaveChanges();
                }
                catch
                {
                    ViewData["EditError"] = ItsyazilimWebResources.valRequiredAllFields;
                }
            }
            else
                ViewData["EditError"] = ItsyazilimWebResources.valRequiredAllFields;
            return PartialView("_GridViewDefProductTypes", model.Where(r => r.IsDeleted == false).OrderBy(r => r.ProductTypeName).ToList());
        }
        [HttpPost, ValidateInput(false)]
        public ActionResult GridViewDefProductTypesUpdate(DefProductTypes item)
        {
            var model = db.DefProductTypes;
            if (ModelState.IsValid)
            {
                try
                {
                    var modelItem = model.FirstOrDefault(it => it.ProductTypeId == item.ProductTypeId);
                    if (modelItem != null)
                    {
                        modelItem.ProductTypeName = Ti.ToTitleCase(item.ProductTypeName.Trim().ToLower());
                        db.DefProductTypes.Attach(modelItem);
                        db.Entry(modelItem).State = System.Data.Entity.EntityState.Modified;
                        db.SaveChanges();
                    }
                }
                catch
                {
                    ViewData["EditError"] = ItsyazilimWebResources.valRequiredAllFields;
                }
            }
            else
                ViewData["EditError"] = ItsyazilimWebResources.valRequiredAllFields;
            return PartialView("_GridViewDefProductTypes", model.Where(r => r.IsDeleted == false).OrderBy(r => r.ProductTypeName).ToList());
        }
        [HttpPost, ValidateInput(false)]
        public ActionResult GridViewDefProductTypesDelete(System.Byte ProductTypeId)
        {
            var model = db.DefProductTypes;
            if (ProductTypeId != null)
            {
                try
                {
                    var item = model.FirstOrDefault(it => it.ProductTypeId == ProductTypeId && it.IsDeleted == false);
                    if (item != null)
                    {
                        item.IsDeleted = true;
                        item.DeletedBy = Convert.ToInt32(Session["LoggedUserId"]);
                        item.DeletedOn = DateTime.Now;
                        db.SaveChanges();
                    }
                }
                catch
                {
                    ViewData["EditError"] = ItsyazilimWebResources.lblError;
                }
            }
            return PartialView("_GridViewDefProductTypes", model.Where(r => r.IsDeleted == false).OrderBy(r => r.ProductTypeName).ToList());
        }
    }
}