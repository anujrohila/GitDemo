//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Itsyazilim.Web.SQLServer.ORM
{
    using System;
    using System.Collections.Generic;
    
    public partial class MembershipPasswordRenewal
    {
        public long RenewalId { get; set; }
        public string Email { get; set; }
        public string ActivateCode { get; set; }
        public string IP { get; set; }
        public System.DateTime CreatedOn { get; set; }
    }
}
