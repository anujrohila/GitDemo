//-------------------------------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by EntitiesToDTOs.v3.2 (entitiestodtos.codeplex.com).
//     Timestamp: 2015-01-28 - 12:02:28
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
    public partial class OrderDetailDTO
    {
        [DataMember()]
        public Int64 OrderDetailId { get; set; }

        [DataMember()]
        public Int64 OrderRouteId { get; set; }

        [DataMember()]
        public Boolean OrderDetailType { get; set; }

        [DataMember()]
        public Byte LoadProductPackageId { get; set; }

        [DataMember()]
        public Int16 LoadProductTypeId { get; set; }

        [DataMember()]
        public Int32 LoadProductWeight { get; set; }

        [DataMember()]
        public Decimal LoadProductVolume { get; set; }

        [DataMember()]
        public Decimal LoadProductVisibleVolume { get; set; }

        [DataMember()]
        public Byte LoadProductVolumeVisibleUnitId { get; set; }

        [DataMember()]
        public String Comment { get; set; }

        [DataMember()]
        public Nullable<DateTime> CreatedOn { get; set; }

        public OrderDetailDTO()
        {
        }

        public OrderDetailDTO(Int64 orderDetailId, Int64 orderRouteId, Boolean orderDetailType, Byte loadProductPackageId, Int16 loadProductTypeId, Int32 loadProductWeight, Decimal loadProductVolume, Decimal loadProductVisibleVolume, Byte loadProductVolumeVisibleUnitId, String comment, Nullable<DateTime> createdOn)
        {
			this.OrderDetailId = orderDetailId;
			this.OrderRouteId = orderRouteId;
			this.OrderDetailType = orderDetailType;
			this.LoadProductPackageId = loadProductPackageId;
			this.LoadProductTypeId = loadProductTypeId;
			this.LoadProductWeight = loadProductWeight;
			this.LoadProductVolume = loadProductVolume;
			this.LoadProductVisibleVolume = loadProductVisibleVolume;
			this.LoadProductVolumeVisibleUnitId = loadProductVolumeVisibleUnitId;
			this.Comment = comment;
			this.CreatedOn = createdOn;
        }
    }
}
