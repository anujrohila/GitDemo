using System;
using System.Globalization;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using Itsyazilim.Web.UI.Models;
using System.Web.Security;
using System.Security.Cryptography;
using System.Text;
using System.Web.Routing;
using System.Net.Mail;
using Itsyazilim.Web.UI.Controllers;
using Itsyazilim.Web.Domain.Resources;
using Itsyazilim.Web.BLL;
using Itsyazilim.Web.Domain;

namespace Itsyazilim.Web.UI.Controllers
{
    public class AccountController : Controller
    {
        public int MaxSameOperationAttempt = 2000;


        public static string HashPassword(String Password)
        {
            var sha256 = new SHA384Managed();
            return Convert.ToBase64String(sha256.ComputeHash(UTF8Encoding.UTF8.GetBytes(String.Concat(Password, System.Web.HttpContext.Current.Application["PasswordSalt"]))));
        }


        //
        // GET: /Account/Register
        public ActionResult Register()
        {

            if (System.Web.HttpContext.Current.User.Identity.IsAuthenticated) return RedirectToAction("Index", "Home");
            return View();
        }

        //
        // POST: /Account/Register
        [HttpPost]
        public ActionResult Register(RegisterViewModel model)
        {
            if (System.Web.HttpContext.Current.User.Identity.IsAuthenticated) return RedirectToAction("Index", "Home");

            // Status Id
            // 0 Aktif Üye
            // 1 Hesap doğrulanmamış
            // 2 Hesap başka bir sebepten kitlenmiş
            // 3 Mail yollanamadı

            if (ModelState.IsValid)
            {
                var memberDetails = MembershipBusinessLogic.GetMembershipDetails(model.Email);
                if (memberDetails == null)
                {
                    TextInfo Ti = new CultureInfo(System.Threading.Thread.CurrentThread.CurrentCulture.ToString(), false).TextInfo;

                    string ActivateCode = Guid.NewGuid().ToString();

                    string Body = HttpContext.GetGlobalResourceObject("Email", "RegisterBody").ToString();
                    Body = Body.Replace("%UserName%", Ti.ToTitleCase(model.Name.Trim().ToLower()));
                    Body = Body.Replace("%Email%", model.Email);
                    Body = Body.Replace("%ActivateCode%", ActivateCode);
                    var IsMailSend = CommonFunctions.SendEmail(string.Format("{0}@turksmart.com", ActivateCode), ItsyazilimWebResources.lblWelcome, Body);

                    //try
                    //{
                    //    MailAddress From = new MailAddress("admın@turksmart.com", "Lts Tübitak");
                    //    MailAddress To = new MailAddress(model.Email.ToLower());

                    //    MailMessage mail = new MailMessage(From, To);
                    //    mail.Subject = "Hoş Geldiniz";
                    //    mail.IsBodyHtml = true;

                    //    string Body = HttpContext.GetGlobalResourceObject("Email", "RegisterBody").ToString();
                    //    Body = Body.Replace("%UserName%", Ti.ToTitleCase(model.Name.Trim().ToLower()));
                    //    Body = Body.Replace("%Email%", To.Address.ToString());
                    //    Body = Body.Replace("%ActivateCode%", ActivateCode);

                    //    mail.Body = Body;

                    //    SmtpClient smtp = new SmtpClient("mail.turksmart.com");
                    //    smtp.Send(mail);
                    //    IsMailSend = true;
                    //}
                    //catch (Exception exc)
                    //{
                    //    IsMailSend = false;
                    //    LogSystemMailSend LogModel = new LogSystemMailSend();
                    //    LogModel.Email = model.Email.ToLower();
                    //    LogModel.PageName = "Register";
                    //    //LogModel.ErrorMessage = exc.Message.ToString();
                    //    LogController.InsertErrorMailSend(LogModel);

                    //}

                    if (IsMailSend == true)
                    {
                        var membershipDTO = new MembershipDTO();
                        membershipDTO.Name = Ti.ToTitleCase(model.Name.Trim().ToLower());
                        membershipDTO.Surname = Ti.ToTitleCase(model.Surname.Trim().ToLower());
                        membershipDTO.Email = model.Email.ToLower();
                        membershipDTO.Password = HashPassword(model.Password.Trim());
                        membershipDTO.Comment = ActivateCode;
                        membershipDTO.IP = System.Web.HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"].ToString();
                        membershipDTO.FailedPasswordAttemptCount = 0;
                        membershipDTO.LastLoginDate = null;
                        membershipDTO.LastPasswordChangeDate = null;
                        //NewUser.StatusId = 1;
                        membershipDTO.StatusId = 0;
                        //NewUser.RoleId = 0;
                        membershipDTO.RoleId = 2;
                        membershipDTO.VerifyOn = null;
                        membershipDTO.CreatedOn = DateTime.Now;
                        membershipDTO.UpdatedOn = null;
                        membershipDTO.UserId = MembershipBusinessLogic.SaveMembership(membershipDTO);

                        string newUserAdminMailBody = HttpContext.GetGlobalResourceObject("Email", "ManageMailNewUserBody").ToString();
                        newUserAdminMailBody = newUserAdminMailBody.Replace("%Name%", membershipDTO.Name);
                        newUserAdminMailBody = newUserAdminMailBody.Replace("%Surname%", membershipDTO.Surname);
                        newUserAdminMailBody = newUserAdminMailBody.Replace("%Email%", membershipDTO.Email);
                        newUserAdminMailBody = newUserAdminMailBody.Replace("%IP%", membershipDTO.IP);
                        newUserAdminMailBody = newUserAdminMailBody.Replace("%CreatedOn%", membershipDTO.CreatedOn.ToString());
                        CommonFunctions.SendEmail(CommonFunctions.WebAdminMailAccount, ItsyazilimWebResources.lblNewUserRegistration, newUserAdminMailBody);
                        TempData["Status"] = "OK";
                    }
                    else
                    {
                        TempData["StatusId"] = "3";
                        TempData["Status"] = "Error";
                        LogController.InsertErrorMailSend(model.Email.ToLower(), "Register", ItsyazilimWebResources.lblErrorInMail);
                    }
                }
                else
                {
                    TempData["StatusId"] = memberDetails.StatusId;
                    TempData["Status"] = "Error";
                }
                TempData["Email"] = model.Email.ToLower();
                return RedirectToAction("RegisterResult", "Account");
            }
            return View();
        }

        //
        // GET: /Account/RegisterResult
        public ActionResult RegisterResult()
        {
            if (System.Web.HttpContext.Current.User.Identity.IsAuthenticated) return RedirectToAction("Index", "Home");
            return View();
        }

        //
        // POST: /Account/RegisterResult
        [HttpPost]
        public ActionResult RegisterResult(string UserStatus)
        {
            if (System.Web.HttpContext.Current.User.Identity.IsAuthenticated) return RedirectToAction("Index", "Home");
            return View();
        }

        //
        // GET: /Account/RegisterVerify        
        public ActionResult RegisterVerify(string Email, string ActivateCode)
        {
            if (System.Web.HttpContext.Current.User.Identity.IsAuthenticated) return RedirectToAction("Index", "Home");

            // StatusId
            // 0 kullanıcı aktif
            // 1 activate code yanlış
            // 2 hesap kitlenmiş
            // 3 kullanıcı yok
            // 4 OK
            // 255 Connection Error

            if (ModelState.IsValid)
            {
                if (Request.QueryString["e"] != null && Request.QueryString["ActivateCode"] != null)
                {
                    if (Request.QueryString["e"].ToString().Length > 4 && Request.QueryString["ActivateCode"].ToString().Length == 36)
                    {
                        bool Error;
                        try
                        {
                            Guid aG = new Guid(Request.QueryString["ActivateCode"].ToString());
                            Error = false;
                        }
                        catch
                        {
                            Error = true;
                        }
                        if (!Error)
                        {
                            if (Session["RegisterVerifyCount"] == null) { Session["RegisterVerifyCount"] = 0; }
                            Session["RegisterVerifyCount"] = Convert.ToInt32(Session["RegisterVerifyCount"]) + 1;

                            if ((Convert.ToInt32(Session["RegisterVerifyCount"])) > MaxSameOperationAttempt)
                            {
                                return RedirectToAction("../");
                            }
                            else
                            {
                                Email = Request.QueryString["e"].ToString().ToLower();
                                ActivateCode = Request.QueryString["ActivateCode"].ToString().ToLower();
                                if (!string.IsNullOrWhiteSpace(Email) && !string.IsNullOrWhiteSpace(ActivateCode))
                                {
                                    var memberDetails = MembershipBusinessLogic.GetMembershipDetails(Email);
                                    if (memberDetails == null)
                                    {
                                        TempData["StatusId"] = "3";
                                        TempData["Status"] = "Error";

                                    }
                                    else if (memberDetails.StatusId != 1)
                                    {
                                        TempData["StatusId"] = memberDetails.StatusId;
                                        TempData["Status"] = "Error";
                                    }

                                    else
                                    {
                                        if (string.Compare(memberDetails.Comment, ActivateCode, StringComparison.CurrentCultureIgnoreCase) == 0)
                                        {
                                            FormsAuthentication.SetAuthCookie(Email, false);
                                            memberDetails.StatusId = 0;
                                            memberDetails.RoleId = 2;
                                            memberDetails.Comment = "";
                                            memberDetails.VerifyOn = DateTime.Now;
                                            memberDetails.UpdatedOn = DateTime.Now;
                                            memberDetails.LastLoginDate = DateTime.Now;
                                            MembershipBusinessLogic.SaveMembership(memberDetails);
                                            return RedirectToAction("Index", "Manage");
                                        }
                                        else
                                        {
                                            TempData["StatusId"] = "1";
                                            TempData["Status"] = "Error";
                                        }
                                    }
                                }
                                TempData["Email"] = Request.QueryString["e"].ToString().ToLower();
                                LogController.InsertLogMembershipRegisterCheckActivateCode(Request.QueryString["e"].ToString().ToLower(), Convert.ToByte(TempData["StatusId"]));
                            }
                            return View();
                        }
                        else
                        {
                            Response.Redirect("RegisterReSendActivateCode?e=" + Request.QueryString["e"].ToString());
                        }
                    }
                    else
                    {
                        return RedirectToAction("../");
                    }
                }
            }
            return RedirectToAction("../");
        }

        //
        // POST: /Account/RegisterVerify
        [HttpPost]
        public ActionResult RegisterVerify()
        {
            if (System.Web.HttpContext.Current.User.Identity.IsAuthenticated) return RedirectToAction("Index", "Home");
            return View();
        }

        //
        // GET: /Account/RegisterReSendActivateCode
        public ActionResult RegisterReSendActivateCode()
        {
            if (System.Web.HttpContext.Current.User.Identity.IsAuthenticated) return RedirectToAction("Index", "Home");
            return View();
        }

        //
        // POST: /Account/.RegisterReSendActivateCode
        [HttpPost]
        public ActionResult RegisterReSendActivateCode(RegisterReSendActivateCodeViewModel model)
        {
            if (System.Web.HttpContext.Current.User.Identity.IsAuthenticated) return RedirectToAction("Index", "Home");

            // StatusId
            // 0 kullanıcı aktif
            // 1 hesap doğrulanmamış (OK)
            // 2 hesap kitlenmiş
            // 3 kullanıcı yok
            // 4 son 60 dk içinde yollanmış
            // 5 fazla sayıda deneme (phising)
            // 254 Mail Error
            // 255 Connection Error

            if (ModelState.IsValid)
            {
                if (Session["ReSendActivateCodeCount"] == null) { Session["ReSendActivateCodeCount"] = 0; }
                Session["ReSendActivateCodeCount"] = Convert.ToInt32(Session["ReSendActivateCodeCount"]) + 1;

                if ((Convert.ToInt32(Session["ReSendActivateCodeCount"])) > MaxSameOperationAttempt)
                {
                    TempData["StatusId"] = "5";
                    TempData["Status"] = "Error";
                }
                else
                {

                    var memberDetails = MembershipBusinessLogic.GetMembershipDetails(model.Email);

                    if (memberDetails == null)
                    {
                        TempData["StatusId"] = "3";
                        TempData["Status"] = "Error";

                    }
                    else if (memberDetails.StatusId != 1)
                    {
                        TempData["StatusId"] = memberDetails.StatusId;
                        TempData["Status"] = "Error";
                    }

                    else
                    {
                        DateTime earliestDate = DateTime.Now.AddMinutes(-59);
                        var LogReSendCode = MembershipBusinessLogic.GetLogMembershipRegisterReSendCode(model.Email, earliestDate);
                        if (LogReSendCode == null)
                        {
                            TextInfo Ti = new CultureInfo(System.Threading.Thread.CurrentThread.CurrentCulture.ToString(), false).TextInfo;

                            bool IsMailSend;
                            try
                            {
                                MailAddress From = new MailAddress(Guid.NewGuid().ToString() + "@turksmart.com", "Lts Tübitak");
                                MailAddress To = new MailAddress(model.Email.ToLower());

                                MailMessage mail = new MailMessage(From, To);
                                mail.Subject = ItsyazilimWebResources.lblWelcome;
                                mail.IsBodyHtml = true;

                                string Body = HttpContext.GetGlobalResourceObject("Email", "RegisterBody").ToString();
                                Body = Body.Replace("%UserName%", memberDetails.Name);
                                Body = Body.Replace("%Email%", To.Address.ToString());
                                Body = Body.Replace("%ActivateCode%", memberDetails.Comment);

                                mail.Body = Body;

                                SmtpClient smtp = new SmtpClient("mail.turksmart.com");
                                smtp.Send(mail);
                                IsMailSend = true;
                            }
                            catch (Exception exc)
                            {
                                IsMailSend = false;
                                LogController.InsertErrorMailSend(model.Email.ToLower(), "RegisterReSendActivateCode", exc.Message.ToString());
                            }

                            if (IsMailSend == true)
                            {
                                TempData["StatusId"] = "1";
                                TempData["Status"] = "OK";
                            }
                            else
                            {
                                TempData["StatusId"] = "254";
                                TempData["Status"] = "Error";
                            }

                        }
                        else
                        {
                            TempData["StatusId"] = "4";
                            TempData["StatusLastSendedTime"] = (DateTime.Now - LogReSendCode.CreatedOn).Minutes + 1;
                            TempData["Status"] = "Error";
                        }
                    }
                    TempData["Email"] = model.Email.ToLower();
                    LogController.InsertLogMembershipRegisterReSendActivateCode(model.Email.ToLower(), Convert.ToByte(TempData["StatusId"]));
                }
                return RedirectToAction("RegisterReSendActivateCodeResult", "Account");

            }
            return View();
        }

        //
        // GET: /Account/RegisterReSendActivateCodeResult
        public ActionResult RegisterReSendActivateCodeResult()
        {
            if (System.Web.HttpContext.Current.User.Identity.IsAuthenticated) return RedirectToAction("Index", "Home");
            return View();
        }

        //
        // POST: /Account/RegisterReSendActivateCodeResult
        [HttpPost]
        public ActionResult RegisterReSendActivateCodeResult(string UserStatus)
        {
            if (System.Web.HttpContext.Current.User.Identity.IsAuthenticated) return RedirectToAction("Index", "Home");
            return View();
        }

        //
        // GET: /Account/PasswordRenewal
        public ActionResult PasswordRenewal()
        {
            if (System.Web.HttpContext.Current.User.Identity.IsAuthenticated) return RedirectToAction("Index", "Home");
            return View();
        }

        //
        // POST: /Account/PasswordRenewal
        [HttpPost]
        public ActionResult PasswordRenewal(PasswordRenewalViewModel model)
        {
            if (System.Web.HttpContext.Current.User.Identity.IsAuthenticated) return RedirectToAction("Index", "Home");

            // StatusId
            // 0 kullanıcı aktif (OK)
            // 1 hesap doğrulanmamış
            // 2 hesap başka bir sebepten kitlenmiş
            // 3 son 60 dk içinde yollanmış
            // 4 kullanıcı yok
            // 5 fazla sayıda deneme (phising)
            // 254 Mail Error
            // 255 Connection Error

            if (ModelState.IsValid)
            {
                if (Session["SendPasswordRenewalCount"] == null) { Session["SendPasswordRenewalCount"] = 0; }
                Session["SendPasswordRenewalCount"] = Convert.ToInt32(Session["SendPasswordRenewalCount"]) + 1;

                if ((Convert.ToInt32(Session["SendPasswordRenewalCount"])) > MaxSameOperationAttempt)
                {
                    TempData["StatusId"] = "5";
                    TempData["Status"] = "Error";
                }
                else
                {
                    var memberDetails = MembershipBusinessLogic.GetMembershipDetails(model.Email);
                    if (memberDetails == null)
                    {
                        TempData["StatusId"] = "4";
                        TempData["Status"] = "Error";

                    }
                    else if (memberDetails.StatusId != 0)
                    {
                        TempData["StatusId"] = memberDetails.StatusId;
                        TempData["Status"] = "Error";
                    }

                    else
                    {
                        var db = new LtsWebEntities();
                        DateTime earliestDate = DateTime.Now.AddMinutes(-59);
                        var LastPasswordRenewal = MembershipBusinessLogic.GetMembershipPasswordRenewal(model.Email, earliestDate);
                        if (LastPasswordRenewal == null)
                        {
                            TextInfo Ti = new CultureInfo(System.Threading.Thread.CurrentThread.CurrentCulture.ToString(), false).TextInfo;
                            bool IsMailSend;
                            string ActivateCode = Guid.NewGuid().ToString();
                            try
                            {
                                MailAddress From = new MailAddress(Guid.NewGuid().ToString() + "@turksmart.com", "Lts Tübitak");
                                MailAddress To = new MailAddress(model.Email.ToLower());

                                MailMessage mail = new MailMessage(From, To);
                                mail.Subject = ItsyazilimWebResources.lblPasswordReset;
                                mail.IsBodyHtml = true;

                                string Body = HttpContext.GetGlobalResourceObject("Email", "PasswordRenewalBody").ToString();
                                Body = Body.Replace("%UserName%", memberDetails.Name);
                                Body = Body.Replace("%Email%", To.Address.ToString());
                                Body = Body.Replace("%ActivateCode%", ActivateCode);

                                mail.Body = Body;

                                SmtpClient smtp = new SmtpClient("mail.turksmart.com");
                                smtp.Send(mail);
                                IsMailSend = true;
                            }
                            catch (Exception exc)
                            {
                                IsMailSend = false;
                                LogController.InsertErrorMailSend(model.Email.ToLower(), "PasswwordRenewal", exc.Message.ToString());
                            }

                            if (IsMailSend == true)
                            {

                                MembershipBusinessLogic.RemoveAllMembershipPasswordRenewal(model.Email);
                                var membershipPasswordRenewalDTO = new MembershipPasswordRenewalDTO();
                                membershipPasswordRenewalDTO.Email = model.Email.ToLower();
                                membershipPasswordRenewalDTO.ActivateCode = ActivateCode;
                                membershipPasswordRenewalDTO.IP = System.Web.HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"].ToString();
                                membershipPasswordRenewalDTO.CreatedOn = DateTime.Now;
                                MembershipBusinessLogic.AddMembershipPasswordRenewal(membershipPasswordRenewalDTO);

                                TempData["StatusId"] = "0";
                                TempData["Status"] = "OK";
                            }
                            else
                            {
                                TempData["StatusId"] = "254";
                                TempData["Status"] = "Error";
                            }
                        }
                        else
                        {
                            TempData["StatusId"] = "3";
                            TempData["StatusLastSendedTime"] = (DateTime.Now - LastPasswordRenewal.CreatedOn).Minutes + 1;
                            TempData["Status"] = "Error";
                        }
                    }
                    TempData["Email"] = model.Email.ToLower();
                    LogController.InsertLogMembershipSendPasswordRenewal(model.Email.ToLower(), Convert.ToByte(TempData["StatusId"]));
                }
                return RedirectToAction("PasswordRenewalResult", "Account");
            }
            return View();
        }

        //
        // GET: /Account/PasswordRenewalResult
        public ActionResult PasswordRenewalResult()
        {
            if (System.Web.HttpContext.Current.User.Identity.IsAuthenticated) return RedirectToAction("Index", "Home");
            return View();
        }

        //
        // POST: /Account/PasswordRenewalResult
        [HttpPost]
        public ActionResult PasswordRenewalResult(string UserStatus)
        {
            if (System.Web.HttpContext.Current.User.Identity.IsAuthenticated) return RedirectToAction("Index", "Home");
            return View();
        }

        //
        // GET: /Account/PasswordRenewalCheck
        public ActionResult PasswordRenewalCheck(string Email, string ActivateCode)
        {
            if (System.Web.HttpContext.Current.User.Identity.IsAuthenticated) return RedirectToAction("Index", "Home");

            // StatusId
            // 0 OK
            // 1 Hesap doğrulanmamış
            // 2 hesap kitlenmiş
            // 3 kullanıcı yok
            // 4 aktivasyon code yanlış
            // 5 Activation code süresi dolmuş
            // 6 renewal kaydı bulunamadı
            // 7 Activation code kullanıldı
            // 8 fazla sayıda deneme (phising)
            // 255 Connection Error

            if (Request.QueryString["e"] != null && Request.QueryString["ActivateCode"] != null)
            {
                if (Request.QueryString["e"].ToString().Length > 4 && Request.QueryString["ActivateCode"].ToString().Length == 36)
                {
                    bool Error;
                    try
                    {
                        Guid aG = new Guid(Request.QueryString["ActivateCode"].ToString());
                        Error = false;
                    }
                    catch
                    {
                        Error = true;
                    }
                    if (!Error)
                    {
                        if (Session["CheckPasswordRenewalCount"] == null) { Session["CheckPasswordRenewalCount"] = 0; }
                        Session["CheckPasswordRenewalCount"] = Convert.ToInt32(Session["CheckPasswordRenewalCount"]) + 1;

                        if ((Convert.ToInt32(Session["CheckPasswordRenewalCount"])) > MaxSameOperationAttempt)
                        {
                            TempData["StatusId"] = "8";
                            TempData["Status"] = "Error";
                        }
                        else
                        {
                            Email = Request.QueryString["e"].ToString().ToLower();
                            ActivateCode = Request.QueryString["ActivateCode"].ToString().ToLower();
                            using (var db = new LtsWebEntities())
                            {
                                var user = db.Membership.FirstOrDefault(u => u.Email == Email);
                                if (user == null)
                                {
                                    TempData["StatusId"] = "3";
                                    TempData["Status"] = "Error";
                                }
                                else if (user.StatusId != 0)
                                {
                                    TempData["StatusId"] = user.StatusId;
                                    TempData["Status"] = "Error";
                                }

                                else
                                {
                                    var CheckCode = db.MembershipPasswordRenewals.Where(i => i.Email == Email).FirstOrDefault();

                                    if (CheckCode == null)
                                    {
                                        TempData["StatusId"] = "6";
                                        TempData["Status"] = "Error";
                                    }
                                    else if (CheckCode.CreatedOn.AddMinutes(60) < DateTime.Now)
                                    {
                                        if (CheckCode.ActivateCode == ActivateCode)
                                        {
                                            TempData["StatusId"] = "5";
                                            TempData["Status"] = "Error";
                                        }
                                        else
                                        {
                                            TempData["StatusId"] = "6";
                                            TempData["Status"] = "Error";
                                        }
                                    }
                                    else
                                    {
                                        if (CheckCode.ActivateCode == ActivateCode)
                                        {
                                            var CodeIsUsed = db.LogMembershipCheckPasswordRenewalCodes.Where(i => i.Email == Email && i.Result == 0).FirstOrDefault();
                                            if (CodeIsUsed != null && CodeIsUsed.CreatedOn.AddMinutes(60) >= DateTime.Now)
                                            {
                                                TempData["StatusId"] = "7";
                                                TempData["Status"] = "Error";
                                            }
                                            else
                                            {
                                                TempData["StatusId"] = "0";
                                                TempData["Status"] = "OK";
                                                Session["PasswordRenewalChangeEmail"] = Email;
                                            }
                                        }
                                        else
                                        {
                                            TempData["StatusId"] = "4";
                                            TempData["Status"] = "Error";
                                        }
                                    }
                                }
                            }

                            TempData["Email"] = Request.QueryString["e"].ToString().ToLower();
                            LogController.InsertLogMembershipCheckPasswordRenewal(Request.QueryString["e"].ToString().ToLower(), Convert.ToByte(TempData["StatusId"]));
                            if (TempData["StatusId"].ToString() == "0") return RedirectToAction("PasswordRenewalChange");
                            else return View();
                        }
                        return View();

                    }
                    else
                    {
                        Response.Redirect("PasswordRenewal?e=" + Request.QueryString["e"].ToString());
                    }
                }
                else
                {
                    return RedirectToAction("../");
                }
            }
            return RedirectToAction("../");
        }

        //
        // POST: /Account/PasswordRenewalCheck
        [HttpPost]
        public ActionResult PasswordRenewalCheck()
        {
            if (System.Web.HttpContext.Current.User.Identity.IsAuthenticated) return RedirectToAction("Index", "Home");
            return View();
        }

        // GET: /Account/PasswordRenewalChange
        public ActionResult PasswordRenewalChange()
        {
            if (System.Web.HttpContext.Current.User.Identity.IsAuthenticated || Session["PasswordRenewalChangeEmail"] == null) return RedirectToAction("Index", "Home");
            return View();
        }

        //
        // POST: /Account/PasswordRenewalChange
        [HttpPost]
        public ActionResult PasswordRenewalChange(PasswordRenewalChangeViewModel model)
        {
            if (System.Web.HttpContext.Current.User.Identity.IsAuthenticated || Session["PasswordRenewalChangeEmail"] == null) return RedirectToAction("Index", "Home");

            if (ModelState.IsValid)
            {
                model.Email = Session["PasswordRenewalChangeEmail"].ToString();
                using (var db = new LtsWebEntities())
                {
                    var user = db.Membership.FirstOrDefault(u => u.Email == model.Email);
                    if (user != null)
                    {
                        user.Password = HashPassword(model.Password);
                        user.UpdatedOn = DateTime.Now;
                        user.LastPasswordChangeDate = DateTime.Now;
                        if (model.AutoLogin) user.LastLoginDate = DateTime.Now;
                        db.SaveChanges();

                        Session["PasswordRenewalChangeEmail"] = null;
                        if (model.AutoLogin)
                        {
                            FormsAuthentication.SetAuthCookie(model.Email, false);
                            return RedirectToAction("Index", "Manage");
                        }
                        else
                        {
                            return RedirectToAction("Login", "Account");
                        }
                    }
                }
            }
            return View();
        }

        //
        // GET: /Account/PasswordRenewalChangeResult
        public ActionResult PasswordRenewalChangeResult()
        {
            if (System.Web.HttpContext.Current.User.Identity.IsAuthenticated) return RedirectToAction("Index", "Home");
            return View();
        }

        //
        // POST: /Account/PasswordRenewalChangeResult
        [HttpPost]
        public ActionResult PasswordRenewalChangeResult(string UserStatus)
        {
            if (System.Web.HttpContext.Current.User.Identity.IsAuthenticated) return RedirectToAction("Index", "Home");
            return View();
        }

        public ActionResult Login(LoginViewModel model)
        {
            if (System.Web.HttpContext.Current.User.Identity.IsAuthenticated) return RedirectToAction("Index", "Home");

            // StatusId
            // 0 OK
            // 1 Hesap doğrulanmamış
            // 2 hesap başka bir sebepten kitlenmiş
            // 3 kullanıcı yok
            // 4 Şifre yanlış
            // 5 fazla sayıda deneme (phising)
            // 255 Connection Error

            if (ModelState.IsValid)
            {
                if (model.Email != null && model.Password != null)
                {
                    if (model.Email.Length > 4 && model.Password.Length > 5)
                    {
                        if (Session["LoginCount"] == null) { Session["LoginCount"] = 0; }
                        Session["LoginCount"] = Convert.ToInt32(Session["LoginCount"]) + 1;

                        if ((Convert.ToInt32(Session["LoginCount"])) > MaxSameOperationAttempt)
                        {
                            TempData["StatusId"] = "5";
                            TempData["Status"] = "Error";
                        }
                        else
                        {
                            model.Email = model.Email.ToLower();


                            var memberDetails = MembershipBusinessLogic.GetMembershipDetails(model.Email);
                            if (memberDetails == null)
                            {
                                TempData["StatusId"] = "3";
                                TempData["Status"] = "Error";
                            }
                            else if (memberDetails.StatusId != 0)
                            {
                                TempData["StatusId"] = memberDetails.StatusId;
                                TempData["Status"] = "Error";
                            }
                            else if (memberDetails.Password != HashPassword(model.Password))
                            {
                                memberDetails.FailedPasswordAttemptCount = memberDetails.FailedPasswordAttemptCount + 1;
                                MembershipBusinessLogic.SaveMembership(memberDetails);
                                TempData["StatusId"] = "4";
                                TempData["Status"] = "Error";
                            }
                            else
                            {
                                memberDetails.LastLoginDate = System.DateTime.Now;
                                memberDetails.UpdatedOn = System.DateTime.Now;
                                MembershipBusinessLogic.SaveMembership(memberDetails);
                                FormsAuthentication.SetAuthCookie(model.Email, model.RememberMe);

                                Session["LoggedUserId"] = memberDetails.UserId.ToString();
                                Session["LoggedUserRoleId"] = memberDetails.RoleId.ToString();
                                Session["LoggedUserName"] = memberDetails.Name.ToString();
                                Session["LoggedUserSurnamoe"] = memberDetails.Surname.ToString();

                                if (memberDetails.RoleId == 2) return RedirectToAction("Index", "Manage");
                                if (memberDetails.RoleId == 3) return RedirectToAction("Index", "Administrator");
                            }
                            TempData["Email"] = model.Email.ToString();
                            LogController.InsertLogMembershipLogin(model.Email, Convert.ToByte(TempData["StatusId"]));
                        }
                    }
                    else
                    {
                        TempData["StatusId"] = "3";
                        TempData["Status"] = "Error";
                    }
                }
            }
            return View();
        }
    }
}