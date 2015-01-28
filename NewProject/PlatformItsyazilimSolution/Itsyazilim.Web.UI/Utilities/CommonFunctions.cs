using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;

namespace Itsyazilim.Web.UI
{
    public static class CommonFunctions
    {

        #region [Variable]

        public static string WebAdminMailAccount = System.Configuration.ConfigurationManager.AppSettings["WebAdminMailAccount"];

        #endregion

        #region [Methods]

        /// <summary>
        /// Send email
        /// </summary>
        /// <param name="toAddress"></param>
        /// <param name="subject"></param>
        /// <param name="body"></param>
        /// <returns></returns>
        public static bool SendEmail(string toAddress, string subject, string body)
        {
            string senderID = "skynettesting01@gmail.com";// use sender’s email id here..
            const string senderPassword = "skynet2014"; // sender password here…
            try
            {
                SmtpClient smtp = new SmtpClient
                {
                    Host = "smtp.gmail.com", // smtp server address here…
                    Port = 587,
                    EnableSsl = true,
                    DeliveryMethod = SmtpDeliveryMethod.Network,
                    Credentials = new System.Net.NetworkCredential(senderID, senderPassword),
                    Timeout = 30000
                };
                MailMessage message = new MailMessage(senderID, toAddress, subject, body);
                message.DeliveryNotificationOptions = DeliveryNotificationOptions.OnFailure;
                message.IsBodyHtml = true;
                smtp.Send(message);
            }
            catch (Exception ex)
            {
                return false;
            }
            return true;
        }

        #endregion

    }
}