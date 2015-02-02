using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Itsyazilim.Web.DLL;
using Itsyazilim.Web.Domain;
namespace Itsyazilim.Web.BLL
{
    public static class MembershipBusinessLogic
    {
        #region [Declaration]

        #endregion

        #region [Methods

        /// <summary>
        /// Get Membership Details
        /// </summary>
        /// <returns></returns>
        public static MembershipDTO GetMembershipDetails(string emailId)
        {
            var membershipRepository = new MembershipRepository();
            return membershipRepository.GetMembershipDetails(emailId);
        }

        ///// <summary>
        ///// Register user
        ///// </summary>
        ///// <returns></returns>
        //public int Register(tblOrganizationDTO tblOrganizationDTO)
        //{
        //    try
        //    {
        //        LogGenerator.Info(string.Format("Register-{0}", tblOrganizationDTO));
        //        var adminAccountRepository = new AdminAccountRepository();
        //        return adminAccountRepository.Register(tblOrganizationDTO);
        //    }
        //    catch (Exception ex)
        //    {
        //        LogGenerator.Error("Register", ex);
        //    }
        //    return 0;
        //}

        ///// <summary>
        ///// Check is mobile is already exists
        ///// </summary>
        ///// <param name="mobileNo"></param>
        ///// <returns></returns>
        //public bool IsMobileNoExists(string mobileNo)
        //{
        //    try
        //    {
        //        LogGenerator.Info(string.Format("IsMobileNoExists-{0}", mobileNo));
        //        var adminAccountRepository = new AdminAccountRepository();
        //        return adminAccountRepository.IsMobileNoExists(mobileNo);
        //    }
        //    catch (Exception ex)
        //    {
        //        LogGenerator.Error("IsMobileNoExists", ex);
        //    }
        //    return true;
        //}

        ///// <summary>
        ///// Check is organization name is already exists
        ///// </summary>
        ///// <param name="mobileNo"></param>
        ///// <returns></returns>
        //public bool IsOrganizationExists(string organizationName)
        //{
        //    try
        //    {
        //        LogGenerator.Info(string.Format("IsOrganizationExists-{0}", organizationName));
        //        var adminAccountRepository = new AdminAccountRepository();
        //        return adminAccountRepository.IsMobileNoExists(organizationName);
        //    }
        //    catch (Exception ex)
        //    {
        //        LogGenerator.Error("IsOrganizationExists", ex);
        //    }
        //    return true;
        //}

        #endregion
    }
}
