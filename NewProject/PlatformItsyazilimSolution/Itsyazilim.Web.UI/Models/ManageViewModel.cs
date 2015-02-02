using System.Collections.Generic;
using System;
using System.ComponentModel.DataAnnotations;

using System.Web.Mvc;

namespace Itsyazilim.Web.UI.Models
{
    public class FirmViewModel
    {
        public int FirmId { get; set; }

        //[Required(ErrorMessageResourceName="valRequiredCompanyName", ErrorMessageResourceType = typeof(Itsyazilim.Web.Domain.Resources.ItsyazilimWebResources))]
        [RegularExpression(@"[\u0000-\u007F\u0080-\u00FF\u0100-\u017F\u0180-\u024F]{5,100}", ErrorMessageResourceName = "valRequiredCompanyName")]
        public string FirmName { get; set; }

        [Required(ErrorMessageResourceName="valRequiredEmail")]
        [RegularExpression(@"[\u0000-\u007F\u0080-\u00FF\u0100-\u017F\u0180-\u024F]{5,100}", ErrorMessageResourceName = "valRequiredEmail")]
        // [RegularExpression(@"^[\S]([\u0000-\u007F\u0100-\u017F]{3,98})[\S]$", ErrorMessage = "Lütfen adresinizi belirtiniz")]
        public string Address { get; set; }

        [Required(ErrorMessageResourceName = "valSelectCompanyName", ErrorMessageResourceType = typeof(Itsyazilim.Web.Domain.Resources.ItsyazilimWebResources))]
        public int CountyId { get; set; }

        [Required(ErrorMessageResourceName = "valRequiredTelephone", ErrorMessageResourceType = typeof(Itsyazilim.Web.Domain.Resources.ItsyazilimWebResources))]
        //[Mask("(\\0 000) 000 00 00", IncludeLiterals = DevExpress.Web.MaskIncludeLiteralsMode.DecimalSymbol, PromptChar = '_', ErrorMessage = "Lütfen sabit telefon belirtiniz")]
        public string Phone1 { get; set; }

        //[Mask("(\\0 999) 999 99 99", IncludeLiterals = DevExpress.Web.MaskIncludeLiteralsMode.DecimalSymbol, PromptChar = '_', ErrorMessage = "Lütfen sabit telefon belirtiniz")]
        public string Phone2 { get; set; }

        //[Mask("(\\0 999) 999 99 99", IncludeLiterals = DevExpress.Web.MaskIncludeLiteralsMode.DecimalSymbol, PromptChar = '_', ErrorMessage = "Lütfen faks numarası belirtiniz")]
        public string Fax { get; set; }

        //[Mask("(\\0 999) 999 99 99", IncludeLiterals = DevExpress.Web.MaskIncludeLiteralsMode.DecimalSymbol, PromptChar = '_', ErrorMessage = "Lütfen mobil numara belirtiniz")]
        public string MobilePhone { get; set; }

        [Required(ErrorMessageResourceName = "valRequiredTaxOffice" ,ErrorMessageResourceType= typeof(Itsyazilim.Web.Domain.Resources.ItsyazilimWebResources))]
        [RegularExpression(@"[\u0000-\u007F\u0080-\u00FF\u0100-\u017F\u0180-\u024F]{5,30}", ErrorMessageResourceName = "valRequiredTaxOffice")]
        public string TaxOffice { get; set; }

        [Required(ErrorMessageResourceName="valRequiredTaxNumber", ErrorMessageResourceType=typeof(Itsyazilim.Web.Domain.Resources.ItsyazilimWebResources))]
        [RegularExpression(@"\d{10}", ErrorMessageResourceName = "valRequiredTaxNumber")]
        //[Mask("999-999-99-99", IncludeLiterals = DevExpress.Web.MaskIncludeLiteralsMode.DecimalSymbol, PromptChar = ' ', ErrorMessage = "Lütfen vergi numaranızı belirtiniz")]
        public string TaxNo { get; set; }

        [EmailAddress(ErrorMessageResourceName = "valEmailRegularExpression", ErrorMessageResourceType = typeof(Itsyazilim.Web.Domain.Resources.ItsyazilimWebResources))]
        public string Email { get; set; }

        [Url(ErrorMessageResourceName = "valReqularInternetValidAddress", ErrorMessageResourceType = typeof(Itsyazilim.Web.Domain.Resources.ItsyazilimWebResources))]
        public string WebSite { get; set; }

        public System.DateTime CreatedOn { get; set; }
        public System.DateTime UpdatedOn { get; set; }
        public int CreatedBy { get; set; }

        public bool IsApproved { get; set; }
        public int ApprovedBy { get; set; }
        public System.DateTime ApprovedOn { get; set; }

    }


    public class OrderType1Model
    {
        [Required(ErrorMessageResourceName = "valSelectVehicleType", ErrorMessageResourceType = typeof(Itsyazilim.Web.Domain.Resources.ItsyazilimWebResources))]
        public byte VehicleTypeId { get; set; }
    }

}