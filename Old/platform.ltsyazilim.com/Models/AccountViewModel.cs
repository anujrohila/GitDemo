using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace platform.ltsyazilim.com.Models
{
    public class LoginViewModel
    {
        [StringLength(64, ErrorMessage = "E-posta adresiniz geçerli bir adres gibi gözükmüyor!")]
        //[DataType(DataType.EmailAddress)]
        public string Email { get; set; }

        [StringLength(64, ErrorMessage = "Şifrenizi girin", MinimumLength = 6)]
        [DataType(DataType.Password)]
        public string Password { get; set; }

        public bool RememberMe{ get; set; }
    }

    public class RegisterViewModel
    {
        // [Required(ErrorMessage = "Lütfen isminizi girin")]
        [StringLength(30, ErrorMessage = "Lütfen isminizi girin", MinimumLength = 2)]
        public string Name { get; set; }

        // [Required(ErrorMessage = "Lütfen soyisminizi girin")]
        [StringLength(30, ErrorMessage = "Lütfen soyisminizi girin", MinimumLength = 2)]
        public string Surname { get; set; }

        // [Required(ErrorMessage = "Lütfen e-posta adresinizi girin")]
        [StringLength(64, ErrorMessage = "E-posta adresiniz geçerli bir adres gibi gözükmüyor!")]
        //[DataType(DataType.EmailAddress)]
        public string Email { get; set; }

        //  [Required(ErrorMessage = "Lütfen şifrenizi girin")]
        [StringLength(64, ErrorMessage = "Şifreniz en az 6 karakter olmalı", MinimumLength = 6)]
        [DataType(DataType.Password)]
        public string Password { get; set; }
    }

    public class RegisterReSendActivateCodeViewModel
    {
        [StringLength(64, ErrorMessage = "E-posta adresiniz geçerli bir adres gibi gözükmüyor!")]
        public string Email { get; set; }
    }

    public class PasswordRenewalViewModel
    {
        [StringLength(64, ErrorMessage = "E-posta adresiniz geçerli bir adres gibi gözükmüyor!")]
        public string Email { get; set; }
    }

    public class PasswordRenewalChangeViewModel
    {
        [StringLength(64, ErrorMessage = "E-posta adresiniz geçerli bir adres gibi gözükmüyor!")]
        public string Email { get; set; }

        [StringLength(64, ErrorMessage = "Şifreniz en az 6 karakter olmalı", MinimumLength = 6)]
        [DataType(DataType.Password)]
        public string Password { get; set; }

        public bool AutoLogin { get; set; }
    }
}