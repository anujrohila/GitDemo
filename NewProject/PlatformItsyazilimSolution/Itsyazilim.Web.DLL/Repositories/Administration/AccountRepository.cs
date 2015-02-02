using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Itsyazilim.Web.Database.ORM;

namespace Itsyazilim.Web.DLL
{
    public class AccountRepository
    {
        //#region [Declaration]

        //#endregion

        //#region [Constructor]

        //public AdminAccountRepository()
        //{

        //}

        //#endregion

        //#region [Methods]

        ///// <summary>
        ///// Get AdminLogin details
        ///// </summary>
        ///// <returns></returns>
        //public tblEmployeeDTO GetAdminLoginDetail(tblEmployeeDTO tblEmployeeDTO)
        //{
        //    using (var OrderManagementDataContext = new OrderManagementDatabaseEntities())
        //    {
        //        return (from admin in OrderManagementDataContext.tblEmployees
        //                where string.Compare(admin.MobileNo, tblEmployeeDTO.MobileNo, StringComparison.CurrentCultureIgnoreCase) == 0
        //                      && string.Compare(admin.Password, tblEmployeeDTO.Password, StringComparison.CurrentCultureIgnoreCase) == 0
        //                select new tblEmployeeDTO()
        //                {
        //                    EmployeeId = admin.EmployeeId,
        //                    FirstName = admin.FirstName,
        //                    LastName = admin.LastName,
        //                    MobileNo = admin.MobileNo,
        //                    IsActive = admin.IsActive
        //                }).FirstOrDefault();
        //    }
        //}

        ///// <summary>
        ///// Register user
        ///// </summary>
        ///// <returns></returns>
        //public int Register(tblOrganizationDTO tblOrganizationDTO)
        //{
        //    using (var OrderManagementDataContext = new OrderManagementDatabaseEntities())
        //    {
        //        var tblOrganization = new tblOrganization();
        //        if (tblOrganizationDTO.OrganizationId == 0)
        //        {
        //            tblOrganization.FirstName = tblOrganizationDTO.FirstName;
        //            tblOrganization.LastName = tblOrganizationDTO.LastName;
        //            tblOrganization.MobileNo = tblOrganizationDTO.MobileNo;
        //            tblOrganization.OrganizationName = tblOrganizationDTO.OrganizationName;
        //            OrderManagementDataContext.tblOrganizations.Add(tblOrganization);

        //            //Adding Default Employees as per organization 
        //            var tblEmployee = new tblEmployee();
        //            tblEmployee.FirstName = tblOrganizationDTO.FirstName;
        //            tblEmployee.LastName = tblOrganizationDTO.LastName;
        //            tblEmployee.JobTitle = tblOrganizationDTO.JobTitle;
        //            tblEmployee.MobileNo = tblOrganizationDTO.MobileNo;
        //            tblEmployee.Password = tblOrganizationDTO.Password;
        //            tblEmployee.OrganizationId = tblOrganization.OrganizationId;
        //            tblEmployee.IsPrimary = true;
        //            tblEmployee.CreationOn = tblOrganizationDTO.CreationOn;
        //            tblEmployee.IsActive = true;
        //            tblEmployee.IsDeleted = false;
        //            OrderManagementDataContext.tblEmployees.Add(tblEmployee);
        //        }
        //        else
        //        {
        //            tblOrganization = OrderManagementDataContext.tblOrganizations.Find(tblOrganizationDTO.OrganizationId);
        //            tblOrganization.FirstName = tblOrganizationDTO.FirstName;
        //            tblOrganization.LastName = tblOrganizationDTO.LastName;
        //            tblOrganization.MobileNo = tblOrganizationDTO.MobileNo;
        //            tblOrganization.OrganizationName = tblOrganizationDTO.OrganizationName;
        //        }
        //        tblOrganization.CityId = tblOrganizationDTO.CityId;
        //        tblOrganization.JobTitle = tblOrganizationDTO.JobTitle;
        //        tblOrganization.Address = tblOrganizationDTO.Address;
        //        tblOrganization.Latitute = tblOrganizationDTO.Latitute;
        //        tblOrganization.Logitute = tblOrganizationDTO.Logitute;
        //        tblOrganization.MapAddress = tblOrganizationDTO.MapAddress;
        //        tblOrganization.EmailAddress = tblOrganizationDTO.EmailAddress;
        //        tblOrganization.OrganizationWebsite = tblOrganizationDTO.OrganizationWebsite;
        //        tblOrganization.CreationOn = tblOrganizationDTO.CreationOn;
        //        tblOrganization.ModificationOn = tblOrganizationDTO.ModificationOn;
        //        tblOrganization.IsActive = tblOrganizationDTO.IsActive;
        //        tblOrganization.IsWorkingStatus = tblOrganizationDTO.IsWorkingStatus;
        //        tblOrganization.IsWorkingStatusMessge = tblOrganizationDTO.IsWorkingStatusMessge;

        //        OrderManagementDataContext.SaveChanges();
        //        return tblOrganization.OrganizationId;
        //    }
        //}

        ///// <summary>
        ///// Check is mobile is already exists
        ///// </summary>
        ///// <param name="mobileNo"></param>
        ///// <returns></returns>
        //public bool IsMobileNoExists(string mobileNo)
        //{
        //    using (var OrderManagementDataContext = new OrderManagementDatabaseEntities())
        //    {
        //        return OrderManagementDataContext.tblEmployees
        //                                .Where(employee => string.Compare(employee.MobileNo, mobileNo, StringComparison.CurrentCultureIgnoreCase) == 0 && employee.IsDeleted == false)
        //                                .ToList()
        //                                .Count() > 0;
        //    }
        //}

        ///// <summary>
        ///// Check is organization name is already exists
        ///// </summary>
        ///// <param name="mobileNo"></param>
        ///// <returns></returns>
        //public bool IsOrganizationExists(string organizationName)
        //{
        //    using (var OrderManagementDataContext = new OrderManagementDatabaseEntities())
        //    {
        //        return OrderManagementDataContext.tblOrganizations
        //                                .Where(employee => string.Compare(employee.OrganizationName, organizationName, StringComparison.CurrentCultureIgnoreCase) == 0)
        //                                .ToList()
        //                                .Count() > 0;
        //    }
        //}


        //#endregion
    }
}
