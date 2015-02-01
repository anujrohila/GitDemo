using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Net.Mail;
using Itsyazilim.Web.UI.Models;
using Itsyazilim.Web.Domain.Resources;

namespace Itsyazilim.Web.UI.Controllers
{
    public class ManageMailingController
    {
        public static void SendMailForNewUser(Membership NewUser)
        {
            try
            {
                MailAddress From = new MailAddress(Guid.NewGuid().ToString() + "@turksmart.com", ItsyazilimWebResources.lblTubitak);
                MailAddress To = new MailAddress("www@hakanhamzaoglu.com");

                MailMessage mail = new MailMessage(From, To);
                mail.Subject = ItsyazilimWebResources.lblNewUserRegistration;
                mail.IsBodyHtml = true;

                string Body = HttpContext.GetGlobalResourceObject("Email", "ManageMailNewUserBody").ToString();
                Body = Body.Replace("%Name%", NewUser.Name);
                Body = Body.Replace("%Surname%", NewUser.Surname);
                Body = Body.Replace("%Email%", NewUser.Email);
                Body = Body.Replace("%IP%", NewUser.IP);
                Body = Body.Replace("%CreatedOn%", NewUser.CreatedOn.ToString());

                mail.Body = Body;

                SmtpClient smtp = new SmtpClient("mail.turksmart.com");
                smtp.Send(mail);
            }
            catch
            {
            }
        }

        public static void SendMailForNewFirm(Firms NewFirm)
        {
            using (var db = new LtsWebEntities())
            {
                var user = db.Membership.FirstOrDefault(u => u.UserId == NewFirm.CreatedBy);
                var county = Itsyazilim.Web.UI.Models.DataProvider.GetCountyByCountyId(NewFirm.CountyId);
                try
                {
                    MailAddress From = new MailAddress(Guid.NewGuid().ToString() + "@turksmart.com", "Lts Tübitak");
                    MailAddress To = new MailAddress("www@hakanhamzaoglu.com");

                    MailMessage mail = new MailMessage(From, To);
                    mail.Subject = ItsyazilimWebResources.lblNewCompanyRegistration;
                    mail.IsBodyHtml = true;

                    string Body = HttpContext.GetGlobalResourceObject("Email", "ManageMailNewFirmBody").ToString();
                    Body = Body.Replace("%UserName%", user.Name + " " + user.Surname);
                    Body = Body.Replace("%FirmName%", NewFirm.FirmName);
                    Body = Body.Replace("%County%", county);
                    Body = Body.Replace("%Address%", NewFirm.Address);
                    Body = Body.Replace("%TaxOffice%", NewFirm.TaxOffice);
                    Body = Body.Replace("%TaxNo%", NewFirm.TaxNo);
                    Body = Body.Replace("%Phone1%", NewFirm.Phone1);
                    Body = Body.Replace("%DisplayFax%", (NewFirm.Fax == null) ? "display:none" : "");
                    Body = Body.Replace("%Fax%", NewFirm.Fax);
                    Body = Body.Replace("%DisplayMobilePhone%", (NewFirm.MobilePhone == null) ? "display:none" : "");
                    Body = Body.Replace("%MobilePhone%", NewFirm.MobilePhone);
                    Body = Body.Replace("%DisplayEmail%", (NewFirm.Email == null) ? "display:none" : "");
                    Body = Body.Replace("%Email%", NewFirm.Email);
                    Body = Body.Replace("%DisplayWebSite%", (NewFirm.WebSite == null) ? "display:none" : "");
                    Body = Body.Replace("%WebSite%", NewFirm.WebSite);
                    Body = Body.Replace("%CreatedOn%", NewFirm.CreatedOn.ToString());

                    mail.Body = Body;

                    SmtpClient smtp = new SmtpClient("mail.turksmart.com");
                    smtp.Send(mail);
                }
                catch
                {
                }
            }
        }
    }
}