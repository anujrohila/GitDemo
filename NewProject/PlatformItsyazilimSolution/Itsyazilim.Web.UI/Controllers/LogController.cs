using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Itsyazilim.Web.UI.Controllers;
using Itsyazilim.Web.UI.Models;
using Itsyazilim.Web.Domain;
using Itsyazilim.Web.BLL;
namespace Itsyazilim.Web.UI.Controllers
{
    public class LogController : Controller
    {
        public static void InsertErrorMailSend(string emailAddress, string pageName, string errorMessage)
        {
            var LogSystemMailSendDTO = new LogSystemMailSendDTO();
            LogSystemMailSendDTO.Email = emailAddress;
            LogSystemMailSendDTO.ErrorMessage = errorMessage;
            LogSystemMailSendDTO.PageName = pageName;
            LogSystemMailSendDTO.IP = System.Web.HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"].ToString();
            LogSystemMailSendDTO.CreatedOn = DateTime.Now;
            MembershipBusinessLogic.InsertErrorMailSend(LogSystemMailSendDTO);
        }

        public static void InsertLogMembershipRegisterReSendActivateCode(string emailAddress, byte result)
        {
            var LogMembershipRegisterReSendCodeDTO = new LogMembershipRegisterReSendCodeDTO();
            LogMembershipRegisterReSendCodeDTO.Email = emailAddress;
            LogMembershipRegisterReSendCodeDTO.Result = result;
            LogMembershipRegisterReSendCodeDTO.IP = System.Web.HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"].ToString();
            LogMembershipRegisterReSendCodeDTO.CreatedOn = DateTime.Now;
            MembershipBusinessLogic.InsertLogMembershipRegisterReSendActivateCode(LogMembershipRegisterReSendCodeDTO);
        }

        public static void InsertLogMembershipRegisterCheckActivateCode(string emailAddress, byte result)
        {
            var LogMembershipRegisterCheckCodeDTO = new LogMembershipRegisterCheckCodeDTO();
            LogMembershipRegisterCheckCodeDTO.Email = emailAddress;
            LogMembershipRegisterCheckCodeDTO.Result = result;
            LogMembershipRegisterCheckCodeDTO.IP = System.Web.HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"].ToString();
            LogMembershipRegisterCheckCodeDTO.CreatedOn = DateTime.Now;
            MembershipBusinessLogic.InsertLogMembershipRegisterCheckActivateCode(LogMembershipRegisterCheckCodeDTO);
        }


        public static void InsertLogMembershipSendPasswordRenewal(string emailAddress, byte result)
        {
            var LogMembershipSendPasswordRenewalCodeDTO = new LogMembershipSendPasswordRenewalCodeDTO();
            LogMembershipSendPasswordRenewalCodeDTO.Email = emailAddress;
            LogMembershipSendPasswordRenewalCodeDTO.Result = result;
            LogMembershipSendPasswordRenewalCodeDTO.IP = System.Web.HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"].ToString();
            LogMembershipSendPasswordRenewalCodeDTO.CreatedOn = DateTime.Now;
            MembershipBusinessLogic.InsertLogMembershipSendPasswordRenewal(LogMembershipSendPasswordRenewalCodeDTO);
        }


        public static void InsertLogMembershipCheckPasswordRenewal(string emailAddress, byte result)
        {
            var LogMembershipCheckPasswordRenewalCodesDTO = new LogMembershipCheckPasswordRenewalCodeDTO();
            LogMembershipCheckPasswordRenewalCodesDTO.Email = emailAddress;
            LogMembershipCheckPasswordRenewalCodesDTO.Result = result;
            LogMembershipCheckPasswordRenewalCodesDTO.IP = System.Web.HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"].ToString();
            LogMembershipCheckPasswordRenewalCodesDTO.CreatedOn = DateTime.Now;
            MembershipBusinessLogic.InsertLogMembershipCheckPasswordRenewal(LogMembershipCheckPasswordRenewalCodesDTO);
        }

        public static void InsertLogMembershipLogin(string emailAddress, byte result)
        {
            var LogMembershipLoginDTO = new LogMembershipLoginDTO();
            LogMembershipLoginDTO.Email = emailAddress;
            LogMembershipLoginDTO.Result = result;
            LogMembershipLoginDTO.IP = System.Web.HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"].ToString();
            LogMembershipLoginDTO.CreatedOn = DateTime.Now;
            MembershipBusinessLogic.InsertLogMembershipLogin(LogMembershipLoginDTO);
        }
    }
}