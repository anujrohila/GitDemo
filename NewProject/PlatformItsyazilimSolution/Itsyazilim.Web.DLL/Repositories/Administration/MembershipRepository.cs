using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Itsyazilim.Web.Database.ORM;
using Itsyazilim.Web.Domain;

namespace Itsyazilim.Web.DLL
{
    public class MembershipRepository
    {
        #region [Declaration]

        #endregion

        #region [Constructor]

        public MembershipRepository()
        {

        }

        #endregion

        #region [Methods]

        /// <summary>
        /// Get Membership Details
        /// </summary>
        /// <returns></returns>
        public MembershipDTO GetMembershipDetails(string emailId)
        {
            using (var LtsyazilimDatabaseEntities = new LtsyazilimDatabaseEntities())
            {
                return (LtsyazilimDatabaseEntities.Memberships.Where(member => string.Compare(member.Email, emailId, StringComparison.CurrentCultureIgnoreCase) == 0).FirstOrDefault()).ToDTO();
            }
        }

        /// <summary>
        /// Save Membership
        /// </summary>
        /// <returns></returns>
        public int SaveMembership(MembershipDTO membershipDTO)
        {
            using (var LtsyazilimDatabaseEntities = new LtsyazilimDatabaseEntities())
            {
                var memberDetails = new Membership();
                if (membershipDTO.UserId == 0)
                {
                    memberDetails = membershipDTO.ToEntity();
                    LtsyazilimDatabaseEntities.Memberships.Add(memberDetails);
                }
                else
                {
                    memberDetails = LtsyazilimDatabaseEntities.Memberships.Where(member => member.UserId == membershipDTO.UserId).FirstOrDefault();
                    memberDetails = membershipDTO.ToEntity();
                }
                LtsyazilimDatabaseEntities.SaveChanges();
                return memberDetails.UserId;
            }
        }

        public void InsertLogMembershipLogin(LogMembershipLoginDTO logMembershipLoginDTO)
        {
            using (var LtsyazilimDatabaseEntities = new LtsyazilimDatabaseEntities())
            {
                LtsyazilimDatabaseEntities.LogMembershipLogins.Add(logMembershipLoginDTO.ToEntity());
                LtsyazilimDatabaseEntities.SaveChanges();
            }
        }

        public void InsertLogMembershipCheckPasswordRenewal(LogMembershipCheckPasswordRenewalCodeDTO logMembershipCheckPasswordRenewalCodeDTO)
        {
            using (var LtsyazilimDatabaseEntities = new LtsyazilimDatabaseEntities())
            {
                LtsyazilimDatabaseEntities.LogMembershipCheckPasswordRenewalCodes.Add(logMembershipCheckPasswordRenewalCodeDTO.ToEntity());
                LtsyazilimDatabaseEntities.SaveChanges();
            }
        }

        public void InsertLogMembershipSendPasswordRenewal(LogMembershipSendPasswordRenewalCodeDTO logMembershipSendPasswordRenewalCodeDTO)
        {
            using (var LtsyazilimDatabaseEntities = new LtsyazilimDatabaseEntities())
            {
                LtsyazilimDatabaseEntities.LogMembershipSendPasswordRenewalCodes.Add(logMembershipSendPasswordRenewalCodeDTO.ToEntity());
                LtsyazilimDatabaseEntities.SaveChanges();
            }
        }

        public void InsertLogMembershipRegisterCheckActivateCode(LogMembershipRegisterCheckCodeDTO logMembershipRegisterCheckCodeDTO)
        {
            using (var LtsyazilimDatabaseEntities = new LtsyazilimDatabaseEntities())
            {
                LtsyazilimDatabaseEntities.LogMembershipRegisterCheckCodes.Add(logMembershipRegisterCheckCodeDTO.ToEntity());
                LtsyazilimDatabaseEntities.SaveChanges();
            }
        }

        public void InsertLogMembershipRegisterReSendActivateCode(LogMembershipRegisterReSendCodeDTO logMembershipRegisterReSendCodeDTO)
        {
            using (var LtsyazilimDatabaseEntities = new LtsyazilimDatabaseEntities())
            {
                LtsyazilimDatabaseEntities.LogMembershipRegisterReSendCodes.Add(logMembershipRegisterReSendCodeDTO.ToEntity());
                LtsyazilimDatabaseEntities.SaveChanges();
            }
        }

        public void InsertErrorMailSend(LogSystemMailSendDTO logSystemMailSendDTO)
        {
            using (var LtsyazilimDatabaseEntities = new LtsyazilimDatabaseEntities())
            {
                LtsyazilimDatabaseEntities.LogSystemMailSends.Add(logSystemMailSendDTO.ToEntity());
                LtsyazilimDatabaseEntities.SaveChanges();
            }
        }

        public LogMembershipRegisterReSendCodeDTO GetLogMembershipRegisterReSendCode(string emailId, DateTime createdOn)
        {
            using (var LtsyazilimDatabaseEntities = new LtsyazilimDatabaseEntities())
            {
                return LtsyazilimDatabaseEntities.LogMembershipRegisterReSendCodes.Where(log => string.Compare(log.Email, emailId, StringComparison.CurrentCultureIgnoreCase) == 0
                                                                                     && log.CreatedOn > createdOn
                                                                                     && log.Result == 1).FirstOrDefault().ToDTO();
            }
        }

        public LogMembershipRegisterReSendCodeDTO RemoveAllMembershipPasswordRenewal(string emailId)
        {
            using (var LtsyazilimDatabaseEntities = new LtsyazilimDatabaseEntities())
            {
                var result = LtsyazilimDatabaseEntities.MembershipPasswordRenewals.Where(renewal =>  string.Compare(renewal.Email, emailId, StringComparison.CurrentCultureIgnoreCase) == 0));
                LtsyazilimDatabaseEntities.MembershipPasswordRenewals.RemoveRange(result);
            }
        }

        public bool AddMembershipPasswordRenewal(MembershipPasswordRenewalDTO membershipPasswordRenewalDTO)
        {
            using (var LtsyazilimDatabaseEntities = new LtsyazilimDatabaseEntities())
            {
                LtsyazilimDatabaseEntities.MembershipPasswordRenewals.Add(membershipPasswordRenewalDTO.ToEntity());
                return LtsyazilimDatabaseEntities.SaveChanges() > 0;
            }
        }






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


        #endregion
    }
}
