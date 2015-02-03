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

        /// <summary>
        /// Save Membership
        /// </summary>
        /// <returns></returns>
        public static int SaveMembership(MembershipDTO membershipDTO)
        {
            var membershipRepository = new MembershipRepository();
            return membershipRepository.SaveMembership(membershipDTO);
        }

        /// <summary>
        /// Save Membership
        /// </summary>
        /// <returns></returns>
        public static void InsertLogMembershipLogin(LogMembershipLoginDTO logMembershipLoginDTO)
        {
            var membershipRepository = new MembershipRepository();
            membershipRepository.InsertLogMembershipLogin(logMembershipLoginDTO);
        }

        public static void InsertLogMembershipCheckPasswordRenewal(LogMembershipCheckPasswordRenewalCodeDTO logMembershipCheckPasswordRenewalCodeDTO)
        {
            var membershipRepository = new MembershipRepository();
            membershipRepository.InsertLogMembershipCheckPasswordRenewal(logMembershipCheckPasswordRenewalCodeDTO);
        }

        public static void InsertLogMembershipSendPasswordRenewal(LogMembershipSendPasswordRenewalCodeDTO logMembershipSendPasswordRenewalCodeDTO)
        {
            var membershipRepository = new MembershipRepository();
            membershipRepository.InsertLogMembershipSendPasswordRenewal(logMembershipSendPasswordRenewalCodeDTO);
        }

        public static void InsertLogMembershipRegisterCheckActivateCode(LogMembershipRegisterCheckCodeDTO logMembershipRegisterCheckCodeDTO)
        {
            var membershipRepository = new MembershipRepository();
            membershipRepository.InsertLogMembershipRegisterCheckActivateCode(logMembershipRegisterCheckCodeDTO);
        }

        public static void InsertLogMembershipRegisterReSendActivateCode(LogMembershipRegisterReSendCodeDTO logMembershipRegisterReSendCodeDTO)
        {
            var membershipRepository = new MembershipRepository();
            membershipRepository.InsertLogMembershipRegisterReSendActivateCode(logMembershipRegisterReSendCodeDTO);
        }

        public static void InsertErrorMailSend(LogSystemMailSendDTO logSystemMailSendDTO)
        {
            var membershipRepository = new MembershipRepository();
            membershipRepository.InsertErrorMailSend(logSystemMailSendDTO);
        }

        public static LogMembershipRegisterReSendCodeDTO GetLogMembershipRegisterReSendCode(string emailId, DateTime createdOn)
        {
            var membershipRepository = new MembershipRepository();
            return membershipRepository.GetLogMembershipRegisterReSendCode(emailId, createdOn);
        }

        public static bool RemoveAllMembershipPasswordRenewal(string emailId)
        {
            var membershipRepository = new MembershipRepository();
            return membershipRepository.RemoveAllMembershipPasswordRenewal(emailId);
        }

        public static bool AddMembershipPasswordRenewal(MembershipPasswordRenewalDTO membershipPasswordRenewalDTO)
        {
            var membershipRepository = new MembershipRepository();
            return membershipRepository.AddMembershipPasswordRenewal(membershipPasswordRenewalDTO);
        }

        public static MembershipPasswordRenewalDTO GetMembershipPasswordRenewal(string emailId, DateTime createdOn)
        {
            var membershipRepository = new MembershipRepository();
            return membershipRepository.GetMembershipPasswordRenewal(emailId, createdOn);
        }

        #endregion
    }
}
