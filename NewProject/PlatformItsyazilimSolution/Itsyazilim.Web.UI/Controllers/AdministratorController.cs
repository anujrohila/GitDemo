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
using Itsyazilim.Web.BLL;
using Itsyazilim.Web.Domain;

namespace Itsyazilim.Web.UI.Controllers
{
    public class AdministratorController : Controller
    {
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
                var memberDetails = MembershipBusinessLogic.GetMembershipDetails(User.Identity.Name);
                Session["LoggedUserId"] = memberDetails.UserId.ToString();
                Session["LoggedUserRoleId"] = memberDetails.RoleId.ToString();
                Session["LoggedUserName"] = memberDetails.Name.ToString();
                Session["LoggedUserSurname"] = memberDetails.Surname.ToString();
            }
        }

        // GET: Administrator
        public ActionResult Index()
        {
            //if (!CheckLogin()) return RedirectToAction("Index", "Manage");
            //return View();
            var memberDetails = MembershipBusinessLogic.GetMembershipDetails("anuj.rohila94@gmail.com");
            Session["LoggedUserId"] = memberDetails.UserId.ToString();
            Session["LoggedUserRoleId"] = "3";
            Session["LoggedUserName"] = memberDetails.Name.ToString();
            Session["LoggedUserSurname"] = memberDetails.Surname.ToString();
            FormsAuthentication.SetAuthCookie(memberDetails.Email, true);
            return View();
        }

        public ActionResult FirmList()
        {
            if (!CheckLogin()) return RedirectToAction("Index", "Manage");

            var model = AdministratorBusinessLogic.GetAllFirms();
            return View(model);
        }

        [ValidateInput(false)]
        public ActionResult GridViewFirmList()
        {
            var model = AdministratorBusinessLogic.GetAllFirms();
            return PartialView("_GridViewFirmList", model.ToList());
        }

        public ActionResult FirmDetails(int id)
        {
            if (!CheckLogin()) return RedirectToAction("Index", "Manage");

            if (id >= 0)
            {
                var firmDetails = AdministratorBusinessLogic.GetFirm(id);
                if (firmDetails != null)
                {
                    return View(firmDetails);
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

            var unApprovedFirmList = AdministratorBusinessLogic.GetAllStatusBasedFirmList(false);

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
            return View(unApprovedFirmList);
        }

        [ValidateInput(false)]
        public ActionResult GridViewUnApprovedFirmList()
        {
            var unApprovedFirmList = AdministratorBusinessLogic.GetAllStatusBasedFirmList(false);
            //var model = (from firm in db.Firms
            //             select new
            //             {
            //                 FirmId = firm.FirmId,
            //                 FirmName = firm.FirmName,
            //                 IsApproved = firm.IsApproved
            //             });
            return PartialView("_GridViewUnApprovedFirmList", unApprovedFirmList);
        }

        public ActionResult UnApprovedFirmDetails(int? id)
        {
            if (!CheckLogin()) return RedirectToAction("Home");

            if (id >= 0)
            {
                var firmDetails = AdministratorBusinessLogic.GetFirm(id ?? 0);
                if (firmDetails != null)
                {
                    return View(firmDetails);
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
                var firm = AdministratorBusinessLogic.GetFirm(id ?? 0);
                if (firm != null)
                {
                    firm.IsApproved = true;
                    firm.ApprovedBy = LoggedUserId;
                    firm.ApprovedOn = DateTime.Now;

                    // IsActive map to firm
                    var mapToFirm = AdministratorBusinessLogic.GetMapToFirm(id ?? 0);
                    mapToFirm.IsActive = true;
                    AdministratorBusinessLogic.SaveMapToFirm(mapToFirm);

                    // get Memeber details
                    var memberDetails = MembershipBusinessLogic.GetMembershipDetails(LoggedUserId);
                    CommunicationController.SendSMSToUserForFirmAccepted(memberDetails.Name + " " + memberDetails.Surname, firm.MobilePhone.ToString());
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
            var vehicleTypesList = AdministratorBusinessLogic.GetAllVehicleType().Where(vehicleType => vehicleType.IsDeleted == false);
            return PartialView("_GridViewDefVehicleTypes", vehicleTypesList);
        }

        [HttpPost, ValidateInput(false)]
        public ActionResult GridViewDefVehicleTypesAddNew(DefVehicleTypeDTO defVehicleTypeDTO)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    defVehicleTypeDTO.VehicleTypeName = Ti.ToTitleCase(defVehicleTypeDTO.VehicleTypeName.Trim().ToLower());
                    defVehicleTypeDTO.VehicleVolume = Math.Round(Convert.ToDecimal(defVehicleTypeDTO.VehicleWidth * defVehicleTypeDTO.VehicleHeight * defVehicleTypeDTO.VehicleLength), 2);
                    defVehicleTypeDTO.VehicleDesi = Convert.ToInt32(defVehicleTypeDTO.VehicleVolume * 1000 / 3);
                    defVehicleTypeDTO.CreatedBy = Convert.ToInt32(Session["LoggedUserId"]);
                    defVehicleTypeDTO.CreatedOn = DateTime.Now;
                    AdministratorBusinessLogic.SaveVehicleType(defVehicleTypeDTO);
                }
                catch
                {
                    ViewData["EditError"] = ItsyazilimWebResources.valRequiredAllFields;
                }
            }
            else
                ViewData["EditError"] = ItsyazilimWebResources.valRequiredAllFields;
            var vehicleTypesList = AdministratorBusinessLogic.GetAllVehicleType().Where(vehicleType => vehicleType.IsDeleted == false);
            return PartialView("_GridViewDefVehicleTypes", vehicleTypesList);
        }
        [HttpPost, ValidateInput(false)]
        public ActionResult GridViewDefVehicleTypesUpdate(DefVehicleTypeDTO defVehicleTypeDTO)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    var vehicleTypeDetails = AdministratorBusinessLogic.GetVehicleType(defVehicleTypeDTO.VehicleTypeId);
                    if (vehicleTypeDetails != null)
                    {
                        vehicleTypeDetails.VehicleTypeName = Ti.ToTitleCase(defVehicleTypeDTO.VehicleTypeName.Trim().ToLower());
                        vehicleTypeDetails.VehicleVolume = Math.Round(Convert.ToDecimal(defVehicleTypeDTO.VehicleWidth * defVehicleTypeDTO.VehicleHeight * defVehicleTypeDTO.VehicleLength), 2);
                        vehicleTypeDetails.VehicleDesi = Convert.ToInt32(Convert.ToDecimal(Convert.ToDecimal(defVehicleTypeDTO.VehicleWidth * defVehicleTypeDTO.VehicleHeight * defVehicleTypeDTO.VehicleLength) * 1000 / 3));
                        vehicleTypeDetails.VehicleHeight = defVehicleTypeDTO.VehicleHeight;
                        vehicleTypeDetails.VehicleLength = defVehicleTypeDTO.VehicleLength;
                        vehicleTypeDetails.VehicleWeight = defVehicleTypeDTO.VehicleWeight;
                        vehicleTypeDetails.VehicleWidth = defVehicleTypeDTO.VehicleWidth;

                        AdministratorBusinessLogic.SaveVehicleType(vehicleTypeDetails);
                    }
                }
                catch
                {
                    ViewData["EditError"] = ItsyazilimWebResources.valRequiredAllFields;
                }
            }
            else
                ViewData["EditError"] = ItsyazilimWebResources.valRequiredAllFields;
            var vehicleTypesList = AdministratorBusinessLogic.GetAllVehicleType().Where(vehicleType => vehicleType.IsDeleted == false).OrderBy(r => r.VehicleTypeName).ToList();
            return PartialView("_GridViewDefVehicleTypes", vehicleTypesList);
        }

        [HttpPost, ValidateInput(false)]
        public ActionResult GridViewDefVehicleTypesDelete(System.Byte VehicleTypeId)
        {
            if (VehicleTypeId != null)
            {
                try
                {
                    var vehicleTypeDetails = AdministratorBusinessLogic.GetVehicleType(VehicleTypeId);
                    if (vehicleTypeDetails != null)
                    {
                        vehicleTypeDetails.IsDeleted = true;
                        vehicleTypeDetails.DeletedBy = Convert.ToInt32(Session["LoggedUserId"]);
                        vehicleTypeDetails.DeletedOn = DateTime.Now;
                        AdministratorBusinessLogic.SaveVehicleType(vehicleTypeDetails);
                    }
                }
                catch
                {
                    ViewData["EditError"] = ItsyazilimWebResources.lblError;
                }
            }
            var vehicleTypesList = AdministratorBusinessLogic.GetAllVehicleType().Where(vehicleType => vehicleType.IsDeleted == false).OrderBy(r => r.VehicleTypeName).ToList();
            return PartialView("_GridViewDefVehicleTypes", vehicleTypesList);
        }


        public ActionResult DefProductPackages()
        {
            if (!CheckLogin()) return RedirectToAction("Index", "Manage");
            return View();

        }

        [ValidateInput(false)]
        public ActionResult GridViewDefProductPackages()
        {
            var getAllProductPackageResult = AdministratorBusinessLogic.GetAllProductPackage().Where(productPackage => productPackage.IsDeleted == false)
                                                                         .OrderBy(r => r.ProductPackageName);
            return PartialView("_GridViewDefProductPackages", getAllProductPackageResult);
        }

        [HttpPost, ValidateInput(false)]
        public ActionResult GridViewDefProductPackagesAddNew(DefProductPackageDTO defProductPackageDTO)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    defProductPackageDTO.ProductPackageName = Ti.ToTitleCase(defProductPackageDTO.ProductPackageName.Trim().ToLower());
                    defProductPackageDTO.CreatedBy = Convert.ToInt32(Session["LoggedUserId"]);
                    defProductPackageDTO.CreatedOn = DateTime.Now;
                    AdministratorBusinessLogic.SaveProductPackage(defProductPackageDTO);
                }
                catch
                {
                    ViewData["EditError"] = ItsyazilimWebResources.valRequiredAllFields;
                }
            }
            else
                ViewData["EditError"] = ItsyazilimWebResources.valRequiredAllFields;
            var getAllProductPackageResult = AdministratorBusinessLogic.GetAllProductPackage().Where(productPackage => productPackage.IsDeleted == false)
                                                                        .OrderBy(r => r.ProductPackageName);
            return PartialView("_GridViewDefProductPackages", getAllProductPackageResult);
        }
        [HttpPost, ValidateInput(false)]
        public ActionResult GridViewDefProductPackagesUpdate(DefProductPackageDTO defProductPackageDTO)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    var getProductPackageResult = AdministratorBusinessLogic.GetProductPackage(defProductPackageDTO.ProductPackageId);
                    if (getProductPackageResult != null)
                    {
                        getProductPackageResult.ProductPackageName = Ti.ToTitleCase(defProductPackageDTO.ProductPackageName.Trim().ToLower());
                        AdministratorBusinessLogic.SaveProductPackage(getProductPackageResult);
                    }
                }
                catch
                {
                    ViewData["EditError"] = ItsyazilimWebResources.valRequiredAllFields;
                }
            }
            else
                ViewData["EditError"] = ItsyazilimWebResources.valRequiredAllFields;
            var getAllProductPackageResult = AdministratorBusinessLogic.GetAllProductPackage().Where(productPackage => productPackage.IsDeleted == false)
                                                                        .OrderBy(r => r.ProductPackageName);
            return PartialView("_GridViewDefProductPackages", getAllProductPackageResult);
        }

        [HttpPost, ValidateInput(false)]
        public ActionResult GridViewDefProductPackagesDelete(System.Byte ProductPackageId)
        {
            if (ProductPackageId != null)
            {
                try
                {
                    var getProductPackageResult = AdministratorBusinessLogic.GetProductPackage(ProductPackageId);
                    if (getProductPackageResult != null)
                    {
                        getProductPackageResult.IsDeleted = true;
                        getProductPackageResult.DeletedBy = Convert.ToInt32(Session["LoggedUserId"]);
                        getProductPackageResult.DeletedOn = DateTime.Now;
                        AdministratorBusinessLogic.SaveProductPackage(getProductPackageResult);
                    }
                }
                catch
                {
                    ViewData["EditError"] = ItsyazilimWebResources.lblError;
                }
            }
            var getAllProductPackageResult = AdministratorBusinessLogic.GetAllProductPackage().Where(productPackage => productPackage.IsDeleted == false)
                                                                       .OrderBy(r => r.ProductPackageName);
            return PartialView("_GridViewDefProductPackages", getAllProductPackageResult);
        }



        public ActionResult DefProductUnits()
        {
            if (!CheckLogin()) return RedirectToAction("Index", "Manage");
            return View();

        }

        [ValidateInput(false)]
        public ActionResult GridViewDefProductUnits()
        {
            var getAllProductUnitResult = AdministratorBusinessLogic.GetAllProductUnit().Where(productUnit => productUnit.IsDeleted == false).OrderBy(r => r.ProductUnitName);
            return PartialView("_GridViewDefProductUnits", getAllProductUnitResult);
        }

        [HttpPost, ValidateInput(false)]
        public ActionResult GridViewDefProductUnitsAddNew(DefProductUnitDTO defProductUnitDTO)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    defProductUnitDTO.ProductUnitName = Ti.ToTitleCase(defProductUnitDTO.ProductUnitName.Trim().ToLower());
                    defProductUnitDTO.CreatedBy = Convert.ToInt32(Session["LoggedUserId"]);
                    defProductUnitDTO.CreatedOn = DateTime.Now;
                    AdministratorBusinessLogic.SaveProductUnit(defProductUnitDTO);
                }
                catch
                {
                    ViewData["EditError"] = ItsyazilimWebResources.valRequiredAllFields;
                }
            }
            else
                ViewData["EditError"] = ItsyazilimWebResources.valRequiredAllFields;
            var getAllProductUnitResult = AdministratorBusinessLogic.GetAllProductUnit().Where(productUnit => productUnit.IsDeleted == false).OrderBy(r => r.ProductUnitName);
            return PartialView("_GridViewDefProductUnits", getAllProductUnitResult);
        }
        [HttpPost, ValidateInput(false)]
        public ActionResult GridViewDefProductUnitsUpdate(DefProductUnitDTO defProductUnitDTO)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    var productUnitDetails = AdministratorBusinessLogic.GetProductUnit(defProductUnitDTO.ProductUnitId);
                    if (productUnitDetails != null)
                    {
                        productUnitDetails.ProductUnitName = Ti.ToTitleCase(defProductUnitDTO.ProductUnitName.Trim().ToLower());
                        AdministratorBusinessLogic.SaveProductUnit(productUnitDetails);
                    }
                }
                catch
                {
                    ViewData["EditError"] = ItsyazilimWebResources.valRequiredAllFields;
                }
            }
            else
                ViewData["EditError"] = ItsyazilimWebResources.valRequiredAllFields;
            var getAllProductUnitResult = AdministratorBusinessLogic.GetAllProductUnit().Where(productUnit => productUnit.IsDeleted == false).OrderBy(r => r.ProductUnitName);
            return PartialView("_GridViewDefProductUnits", getAllProductUnitResult);
        }
        [HttpPost, ValidateInput(false)]
        public ActionResult GridViewDefProductUnitsDelete(System.Byte ProductUnitId)
        {
            if (ProductUnitId != null)
            {
                try
                {
                    var productUnitDetails = AdministratorBusinessLogic.GetProductUnit(ProductUnitId);
                    if (productUnitDetails != null)
                    {
                        productUnitDetails.IsDeleted = true;
                        productUnitDetails.DeletedBy = Convert.ToInt32(Session["LoggedUserId"]);
                        productUnitDetails.DeletedOn = DateTime.Now;
                        AdministratorBusinessLogic.SaveProductUnit(productUnitDetails);
                    }
                }
                catch
                {
                    ViewData["EditError"] = ItsyazilimWebResources.lblError;
                }
            }
            var getAllProductUnitResult = AdministratorBusinessLogic.GetAllProductUnit().Where(productUnit => productUnit.IsDeleted == false).OrderBy(r => r.ProductUnitName);
            return PartialView("_GridViewDefProductUnits", getAllProductUnitResult);
        }



        public ActionResult DefProductProperties()
        {
            if (!CheckLogin()) return RedirectToAction("Index", "Manage");
            return View();

        }

        [ValidateInput(false)]
        public ActionResult GridViewDefProductProperties()
        {
            var getAllProductPropertyResult = AdministratorBusinessLogic.GetAllProductProperty().Where(productProperty => productProperty.IsDeleted == false).OrderBy(r => r.ProductPropertyName);
            return PartialView("_GridViewDefProductProperties", getAllProductPropertyResult);
        }

        [HttpPost, ValidateInput(false)]
        public ActionResult GridViewDefProductPropertiesAddNew(DefProductPropertyDTO defProductPropertyDTO)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    defProductPropertyDTO.ProductPropertyName = Ti.ToTitleCase(defProductPropertyDTO.ProductPropertyName.Trim().ToLower());
                    defProductPropertyDTO.CreatedBy = Convert.ToInt32(Session["LoggedUserId"]);
                    defProductPropertyDTO.CreatedOn = DateTime.Now;
                    AdministratorBusinessLogic.SaveProductProperty(defProductPropertyDTO);
                }
                catch
                {
                    ViewData["EditError"] = ItsyazilimWebResources.valRequiredAllFields;
                }
            }
            else
                ViewData["EditError"] = ItsyazilimWebResources.valRequiredAllFields;
            var getAllProductPropertyResult = AdministratorBusinessLogic.GetAllProductProperty().Where(productProperty => productProperty.IsDeleted == false).OrderBy(r => r.ProductPropertyName);
            return PartialView("_GridViewDefProductProperties", getAllProductPropertyResult);
        }
        [HttpPost, ValidateInput(false)]
        public ActionResult GridViewDefProductPropertiesUpdate(DefProductPropertyDTO defProductPropertyDTO)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    var productPropertyDetails = AdministratorBusinessLogic.GetProductProperty(defProductPropertyDTO.ProductPropertyId);
                    if (productPropertyDetails != null)
                    {
                        productPropertyDetails.ProductPropertyName = Ti.ToTitleCase(defProductPropertyDTO.ProductPropertyName.Trim().ToLower());
                        AdministratorBusinessLogic.SaveProductProperty(defProductPropertyDTO);
                    }
                }
                catch
                {
                    ViewData["EditError"] = ItsyazilimWebResources.valRequiredAllFields;
                }
            }
            else
                ViewData["EditError"] = ItsyazilimWebResources.valRequiredAllFields;
            var getAllProductPropertyResult = AdministratorBusinessLogic.GetAllProductProperty().Where(productProperty => productProperty.IsDeleted == false).OrderBy(r => r.ProductPropertyName);
            return PartialView("_GridViewDefProductProperties", getAllProductPropertyResult);
        }
        [HttpPost, ValidateInput(false)]
        public ActionResult GridViewDefProductPropertiesDelete(System.Byte ProductPropertyId)
        {
            if (ProductPropertyId != 0)
            {
                try
                {
                    var productPropertyDetails = AdministratorBusinessLogic.GetProductProperty(ProductPropertyId);
                    if (productPropertyDetails != null)
                    {
                        productPropertyDetails.IsDeleted = true;
                        productPropertyDetails.DeletedBy = Convert.ToInt32(Session["LoggedUserId"]);
                        productPropertyDetails.DeletedOn = DateTime.Now;
                        AdministratorBusinessLogic.SaveProductProperty(productPropertyDetails);
                    }
                }
                catch
                {
                    ViewData["EditError"] = ItsyazilimWebResources.lblError;
                }
            }
            var getAllProductPropertyResult = AdministratorBusinessLogic.GetAllProductProperty().Where(productProperty => productProperty.IsDeleted == false).OrderBy(r => r.ProductPropertyName);
            return PartialView("_GridViewDefProductProperties", getAllProductPropertyResult);
        }



        public ActionResult DefProductTypes()
        {
            if (!CheckLogin()) return RedirectToAction("Index", "Manage");
            return View();
        }

        [ValidateInput(false)]
        public ActionResult GridViewDefProductTypes()
        {
            var getAllProductTypeResult = AdministratorBusinessLogic.GetAllProductType().Where(productType => productType.IsDeleted == false).OrderBy(r => r.ProductTypeName);
            return PartialView("_GridViewDefProductTypes", getAllProductTypeResult);
        }

        [HttpPost, ValidateInput(false)]
        public ActionResult GridViewDefProductTypesAddNew(DefProductTypeDTO defProductTypeDTO)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    defProductTypeDTO.ProductTypeName = Ti.ToTitleCase(defProductTypeDTO.ProductTypeName.Trim().ToLower());
                    defProductTypeDTO.CreatedBy = Convert.ToInt32(Session["LoggedUserId"]);
                    defProductTypeDTO.CreatedOn = DateTime.Now;
                    AdministratorBusinessLogic.SaveProductType(defProductTypeDTO);
                }
                catch
                {
                    ViewData["EditError"] = ItsyazilimWebResources.valRequiredAllFields;
                }
            }
            else
                ViewData["EditError"] = ItsyazilimWebResources.valRequiredAllFields;
            var getAllProductTypeResult = AdministratorBusinessLogic.GetAllProductType().Where(productType => productType.IsDeleted == false).OrderBy(r => r.ProductTypeName);
            return PartialView("_GridViewDefProductTypes", getAllProductTypeResult);
        }
        [HttpPost, ValidateInput(false)]
        public ActionResult GridViewDefProductTypesUpdate(DefProductTypeDTO defProductTypeDTO)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    var productTypeDetails = AdministratorBusinessLogic.GetProductType(defProductTypeDTO.ProductTypeId);
                    if (productTypeDetails != null)
                    {
                        productTypeDetails.ProductTypeName = Ti.ToTitleCase(defProductTypeDTO.ProductTypeName.Trim().ToLower());
                        AdministratorBusinessLogic.SaveProductType(defProductTypeDTO);
                    }
                }
                catch
                {
                    ViewData["EditError"] = ItsyazilimWebResources.valRequiredAllFields;
                }
            }
            else
                ViewData["EditError"] = ItsyazilimWebResources.valRequiredAllFields;
            var getAllProductTypeResult = AdministratorBusinessLogic.GetAllProductType().Where(productType => productType.IsDeleted == false).OrderBy(r => r.ProductTypeName);
            return PartialView("_GridViewDefProductTypes", getAllProductTypeResult);
        }
        [HttpPost, ValidateInput(false)]
        public ActionResult GridViewDefProductTypesDelete(System.Byte ProductTypeId)
        {
            if (ProductTypeId != 0)
            {
                try
                {
                    var productTypeDetails = AdministratorBusinessLogic.GetProductType(ProductTypeId);
                    if (productTypeDetails != null)
                    {
                        productTypeDetails.IsDeleted = true;
                        productTypeDetails.DeletedBy = Convert.ToInt32(Session["LoggedUserId"]);
                        productTypeDetails.DeletedOn = DateTime.Now;
                        AdministratorBusinessLogic.SaveProductType(productTypeDetails);
                    }
                }
                catch
                {
                    ViewData["EditError"] = ItsyazilimWebResources.lblError;
                }
            }
            var getAllProductTypeResult = AdministratorBusinessLogic.GetAllProductType().Where(productType => productType.IsDeleted == false).OrderBy(r => r.ProductTypeName);
            return PartialView("_GridViewDefProductTypes", getAllProductTypeResult);
        }



        [ValidateInput(false)]
        public ActionResult RoleList()
        {
            return View();
        }

        [ValidateInput(false)]
        public ActionResult _GridViewRoleList()
        {
            var getAllRoleResult = AdministratorBusinessLogic.GetAllRole().OrderBy(r => r.RoleName);
            return PartialView("_GridViewRoleList", getAllRoleResult);
        }

        [HttpPost, ValidateInput(false)]
        public ActionResult AddRole(RoleDTO roleDTO)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    roleDTO.RoleName = Ti.ToTitleCase(roleDTO.RoleName.Trim().ToLower());
                    roleDTO.Description = Ti.ToTitleCase(roleDTO.Description.Trim().ToLower());
                    AdministratorBusinessLogic.SaveRole(roleDTO);
                }
                catch
                {
                    ViewData["EditError"] = ItsyazilimWebResources.valRequiredAllFields;
                }
            }
            else
                ViewData["EditError"] = ItsyazilimWebResources.valRequiredAllFields;
            var getAllRoleResult = AdministratorBusinessLogic.GetAllRole().OrderBy(r => r.RoleName);
            return PartialView("_GridViewRoleList", getAllRoleResult);
        }

        [HttpPost, ValidateInput(false)]
        public ActionResult UpdateRole(RoleDTO roleDTO)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    roleDTO.RoleName = Ti.ToTitleCase(roleDTO.RoleName.Trim().ToLower());
                    roleDTO.Description = Ti.ToTitleCase(roleDTO.Description.Trim().ToLower());
                    AdministratorBusinessLogic.SaveRole(roleDTO);
                }
                catch
                {
                    ViewData["EditError"] = ItsyazilimWebResources.valRequiredAllFields;
                }
            }
            else
                ViewData["EditError"] = ItsyazilimWebResources.valRequiredAllFields;
            var getAllRoleResult = AdministratorBusinessLogic.GetAllRole().OrderBy(r => r.RoleName);
            return PartialView("_GridViewRoleList", getAllRoleResult);
        }

        [HttpPost, ValidateInput(false)]
        public ActionResult DeleteRole(int roleId)
        {
            if (roleId != 0)
            {
                try
                {
                    AdministratorBusinessLogic.DeleteRole(roleId);
                }
                catch
                {
                    ViewData["EditError"] = ItsyazilimWebResources.lblError;
                }
            }
            var getAllRoleResult = AdministratorBusinessLogic.GetAllRole().OrderBy(r => r.RoleName);
            return PartialView("_GridViewRoleList", getAllRoleResult);
        }

    }
}