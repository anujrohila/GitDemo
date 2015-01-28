using System.Collections.Generic;
using System;
using System.ComponentModel.DataAnnotations;
using DevExpress.Web.Mvc;
using System.Web.Mvc;

//using System.Web.Mvc;
//using DevExpress.Web.Mvc;

namespace platform.ltsyazilim.com.Models
{
    public class FirmViewModel
    {
        public int FirmId { get; set; }

        [Required(ErrorMessage = "Lütfen firma ismini giriniz")]
        [RegularExpression(@"[\u0000-\u007F\u0080-\u00FF\u0100-\u017F\u0180-\u024F]{5,100}", ErrorMessage = "Lütfen firma ismini giriniz")]
        public string FirmName { get; set; }

        [Required(ErrorMessage = "Lütfen adresinizi belirtiniz")]
        [RegularExpression(@"[\u0000-\u007F\u0080-\u00FF\u0100-\u017F\u0180-\u024F]{5,100}", ErrorMessage = "Lütfen adresinizi belirtiniz")]
        // [RegularExpression(@"^[\S]([\u0000-\u007F\u0100-\u017F]{3,98})[\S]$", ErrorMessage = "Lütfen adresinizi belirtiniz")]
        public string Address { get; set; }

        [Required(ErrorMessage = "Lütfen firmanızın ilçesiniz seçiniz")]
        public int CountyId { get; set; }

        [Required(ErrorMessage = "Lütfen sabit telefon belirtiniz")]
        [Mask("(\\0 000) 000 00 00", IncludeLiterals = DevExpress.Web.MaskIncludeLiteralsMode.DecimalSymbol, PromptChar = '_', ErrorMessage = "Lütfen sabit telefon belirtiniz")]
        public string Phone1 { get; set; }

        [Mask("(\\0 999) 999 99 99", IncludeLiterals = DevExpress.Web.MaskIncludeLiteralsMode.DecimalSymbol, PromptChar = '_', ErrorMessage = "Lütfen sabit telefon belirtiniz")]
        public string Phone2 { get; set; }

        [Mask("(\\0 999) 999 99 99", IncludeLiterals = DevExpress.Web.MaskIncludeLiteralsMode.DecimalSymbol, PromptChar = '_', ErrorMessage = "Lütfen faks numarası belirtiniz")]
        public string Fax { get; set; }

        [Mask("(\\0 999) 999 99 99", IncludeLiterals = DevExpress.Web.MaskIncludeLiteralsMode.DecimalSymbol, PromptChar = '_', ErrorMessage = "Lütfen mobil numara belirtiniz")]
        public string MobilePhone { get; set; }

        [Required(ErrorMessage = "Lütfen vergi dairenizi belirtiniz")]
        [RegularExpression(@"[\u0000-\u007F\u0080-\u00FF\u0100-\u017F\u0180-\u024F]{5,30}", ErrorMessage = "Lütfen vergi dairenizi belirtiniz")]
        public string TaxOffice { get; set; }

        [Required(ErrorMessage = "Lütfen vergi numaranızı belirtiniz")]
        [RegularExpression(@"\d{10}", ErrorMessage = "Lütfen vergi numaranızı belirtiniz")]
        [Mask("999-999-99-99", IncludeLiterals = DevExpress.Web.MaskIncludeLiteralsMode.DecimalSymbol, PromptChar = ' ', ErrorMessage = "Lütfen vergi numaranızı belirtiniz")]
        public string TaxNo { get; set; }

        [EmailAddress (ErrorMessage = "E-posta adresiniz geçerli bir adres gözükmüyor")]
        public string Email { get; set; }

        [Url(ErrorMessage = "İnternet adresiniz geçerli bir adres gözükmüyor")]
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
        [Required(ErrorMessage = "Lütfen araç tipini belirtiniz")]
        public byte VehicleTypeId { get; set; }
    }

}