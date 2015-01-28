using System.Collections.Generic;
using System;
using System.ComponentModel.DataAnnotations;
using DevExpress.Web.Mvc;
using System.Web.Mvc;

//using System.Web.Mvc;
//using DevExpress.Web.Mvc;

namespace platform.ltsyazilim.com.Models
{



    public class UnApprovedFirmList
    {
        public int FirmId { get; set; }
        public string FirmName { get; set; }
        public string CreatedBy { get; set; }
        public bool IsApproved { get; set; }
    }

}