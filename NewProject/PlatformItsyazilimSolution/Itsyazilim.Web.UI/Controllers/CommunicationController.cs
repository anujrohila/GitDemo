using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Net;
using Itsyazilim.Web.Domain.Resources;

namespace Itsyazilim.Web.UI.Controllers
{
    public class CommunicationController : Controller
    {
        static string APISender = "LTSTUBITAK";
        static string APIUserName = "8506671549";
        static string APIPassword = "131051";
        static string SMSDefaultText = "http://www.dakiksms.com/api/index.php?act=sendsms&user=%APIUserName%&pass=%APIPassword%&orgin=%APISender%&message=%Message%&numbers=%MobileNumbers%";
        /* Çoklu sms yollma için numaralar aralara virgül yazarak eklenir (5320000001,532000002)*/

        public static string TextToEnglish(string Text)
        {
            Text = Text.Replace('ö', 'o');
            Text = Text.Replace('ü', 'u');
            Text = Text.Replace('ğ', 'g');
            Text = Text.Replace('ş', 's');
            Text = Text.Replace('ı', 'i');
            Text = Text.Replace('ç', 'c');
            Text = Text.Replace('Ö', 'O');
            Text = Text.Replace('Ü', 'U');
            Text = Text.Replace('Ğ', 'G');
            Text = Text.Replace('Ş', 'S');
            Text = Text.Replace('İ', 'I');
            Text = Text.Replace('Ç', 'C');
            return Text;
        }

        public static void SendSMSToUserForFirmAccepted(string UserName, string MobileNumbers)
        {

            var SMSText = "Sn. " + UserName + ItsyazilimWebResources.lblCommunicationCompanyMsg + "www.turksmart.com";
            try
            {
                HttpWebRequest request = (HttpWebRequest)WebRequest.Create(TextToEnglish(SMSDefaultText.Replace("%APIUserName%", APIUserName).Replace("%APIPassword%", APIPassword).Replace("%APISender%", APISender).Replace("%Message%", SMSText).Replace("%MobileNumbers%", MobileNumbers)));
                request.GetResponse();
            }
            catch { }
        }
    }
}