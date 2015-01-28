using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Itsyazilim.Web.UI.Controllers;
using Itsyazilim.Web.UI.Models;

namespace Itsyazilim.Web.UI.Controllers
{
    public class LogController : Controller
    {
        public static void InsertErrorMailSend(LogSystemMailSend model)
        {
            using (var db = new LtsWebEntities())
            {
                var NewLog = db.LogSystemMailSend.Create();
                NewLog.Email = model.Email;
                NewLog.ErrorMessage = model.ErrorMessage;
                NewLog.PageName = model.PageName;
                NewLog.IP = System.Web.HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"].ToString();
                NewLog.CreatedOn = DateTime.Now;

                db.LogSystemMailSend.Add(NewLog);
                db.SaveChanges();
            }
        }

        public static void InsertLogMembershipRegisterReSendActivateCode(LogMembershipRegisterReSendCodes model)
        {
            using (var db = new LtsWebEntities())
            {
                var NewLog = db.LogMembershipRegisterReSendCodes.Create();
                NewLog.Email = model.Email;
                NewLog.Result = model.Result;
                NewLog.IP = System.Web.HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"].ToString();
                NewLog.CreatedOn = DateTime.Now;

                db.LogMembershipRegisterReSendCodes.Add(NewLog);
                db.SaveChanges();
            }
        }

        public static void InsertLogMembershipRegisterCheckActivateCode(LogMembershipRegisterCheckCodes model)
        {
            using (var db = new LtsWebEntities())
            {
                var NewLog = db.LogMembershipRegisterCheckCodes.Create();
                NewLog.Email = model.Email;
                NewLog.Result = model.Result;
                NewLog.IP = System.Web.HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"].ToString();
                NewLog.CreatedOn = DateTime.Now;

                db.LogMembershipRegisterCheckCodes.Add(NewLog);
                db.SaveChanges();
            }
        }


        public static void InsertLogMembershipSendPasswordRenewal(LogMembershipSendPasswordRenewalCodes model)
        {
            using (var db = new LtsWebEntities())
            {
                var NewLog = db.LogMembershipSendPasswordRenewalCodes.Create();
                NewLog.Email = model.Email;
                NewLog.Result = model.Result;
                NewLog.IP = System.Web.HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"].ToString();
                NewLog.CreatedOn = DateTime.Now;

                db.LogMembershipSendPasswordRenewalCodes.Add(NewLog);
                db.SaveChanges();
            }
        }


        public static void InsertLogMembershipCheckPasswordRenewal(LogMembershipCheckPasswordRenewalCodes model)
        {
            using (var db = new LtsWebEntities())
            {
                var NewLog = db.LogMembershipCheckPasswordRenewalCodes.Create();
                NewLog.Email = model.Email;
                NewLog.Result = model.Result;
                NewLog.IP = System.Web.HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"].ToString();
                NewLog.CreatedOn = DateTime.Now;

                db.LogMembershipCheckPasswordRenewalCodes.Add(NewLog);
                db.SaveChanges();
            }
        }

        public static void InsertLogMembershipLogin( LogMembershipLogins model)
        {
            using (var db = new LtsWebEntities())
            {
                var NewLog = db.LogMembershipLogins.Create();
                NewLog.Email = model.Email;
                NewLog.Result = model.Result;
                NewLog.IP = System.Web.HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"].ToString();
                NewLog.CreatedOn = DateTime.Now;

                db.LogMembershipLogins.Add(NewLog);
                db.SaveChanges();
            }
        }
    }
}