using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using Itsyazilim.Web.Domain.Resources;
namespace Itsyazilim.Web.UI.Models
{
    public class LoginViewModel
    {
        [StringLength(64, ErrorMessageResourceName = "valEmailRegularExpression", ErrorMessageResourceType = typeof(Itsyazilim.Web.Domain.Resources.ItsyazilimWebResources))]
        //[DataType(DataType.EmailAddress)]
        public string Email { get; set; }

        [StringLength(64, ErrorMessageResourceName = "valRequiredPassword", MinimumLength = 6, ErrorMessageResourceType = typeof(Itsyazilim.Web.Domain.Resources.ItsyazilimWebResources))]
        [DataType(DataType.Password)]
        public string Password { get; set; }

        public bool RememberMe{ get; set; }
    }

    public class RegisterViewModel
    {
        // [Required(ErrorMessage = "Lütfen isminizi girin")]
        [StringLength(30, ErrorMessageResourceName = "valRequiredName", MinimumLength = 2, ErrorMessageResourceType = typeof(Itsyazilim.Web.Domain.Resources.ItsyazilimWebResources))]
        public string Name { get; set; }

        // [Required(ErrorMessage = "Lütfen soyisminizi girin")]
        [StringLength(30, ErrorMessageResourceName = "valRequiredSurname", MinimumLength = 2, ErrorMessageResourceType = typeof(Itsyazilim.Web.Domain.Resources.ItsyazilimWebResources))]
        public string Surname { get; set; }

        // [Required(ErrorMessage = "Lütfen e-posta adresinizi girin")]
        [StringLength(64, ErrorMessageResourceName = "valEmailRegularExpression", ErrorMessageResourceType = typeof(Itsyazilim.Web.Domain.Resources.ItsyazilimWebResources))]
        //  [Required(ErrorMessage = "Lütfen şifrenizi girin")]
        [StringLength(64, ErrorMessageResourceName = "valPasswordMinLength", MinimumLength = 6, ErrorMessageResourceType = typeof(Itsyazilim.Web.Domain.Resources.ItsyazilimWebResources))]
        //  [Required(ErrorMessage = "Lütfen şifrenizi girin")]
        [DataType(DataType.Password)]
        public string Password { get; set; }
    }

    public class RegisterReSendActivateCodeViewModel
    {
        [StringLength(64, ErrorMessageResourceName = "valEmailRegularExpression", ErrorMessageResourceType = typeof(Itsyazilim.Web.Domain.Resources.ItsyazilimWebResources))]
        public string Email { get; set; }
    }

    public class PasswordRenewalViewModel
    {
        [StringLength(64, ErrorMessageResourceName = "valEmailRegularExpression", ErrorMessageResourceType = typeof(Itsyazilim.Web.Domain.Resources.ItsyazilimWebResources))]
        public string Email { get; set; }
    }

    public class PasswordRenewalChangeViewModel
    {
        [StringLength(64, ErrorMessageResourceName = "valEmailRegularExpression", ErrorMessageResourceType = typeof(Itsyazilim.Web.Domain.Resources.ItsyazilimWebResources))]
        public string Email { get; set; }

        [StringLength(64, ErrorMessageResourceName = "valPasswordMinLength", MinimumLength = 6, ErrorMessageResourceType = typeof(Itsyazilim.Web.Domain.Resources.ItsyazilimWebResources))]
        [DataType(DataType.Password)]
        public string Password { get; set; }

        public bool AutoLogin { get; set; }
    }
}