//-------------------------------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by EntitiesToDTOs.v3.2 (entitiestodtos.codeplex.com).
//     Timestamp: 2015-01-28 - 12:02:29
//
//     Changes to this file may cause incorrect behavior and will be lost if the code is regenerated.
// </auto-generated>
//-------------------------------------------------------------------------------------------------------
using System;
using System.Collections.Generic;
using System.Runtime.Serialization;
using System.Text;

namespace Itsyazilim.Web.Domain
{
    [DataContract()]
    public partial class OrderRouteDTO
    {
        [DataMember()]
        public Int64 OrderRootId { get; set; }

        [DataMember()]
        public Nullable<Int64> OrderId { get; set; }

        [DataMember()]
        public Nullable<Int32> StartCountyId { get; set; }

        [DataMember()]
        public Nullable<Int32> EndCountyId { get; set; }

        public OrderRouteDTO()
        {
        }

        public OrderRouteDTO(Int64 orderRootId, Nullable<Int64> orderId, Nullable<Int32> startCountyId, Nullable<Int32> endCountyId)
        {
			this.OrderRootId = orderRootId;
			this.OrderId = orderId;
			this.StartCountyId = startCountyId;
			this.EndCountyId = endCountyId;
        }
    }
}
