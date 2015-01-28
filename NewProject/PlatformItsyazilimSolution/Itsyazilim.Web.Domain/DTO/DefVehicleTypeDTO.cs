//-------------------------------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by EntitiesToDTOs.v3.2 (entitiestodtos.codeplex.com).
//     Timestamp: 2015-01-28 - 12:02:26
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
    public partial class DefVehicleTypeDTO
    {
        [DataMember()]
        public Byte VehicleTypeId { get; set; }

        [DataMember()]
        public String VehicleTypeName { get; set; }

        [DataMember()]
        public Decimal VehicleWidth { get; set; }

        [DataMember()]
        public Decimal VehicleLength { get; set; }

        [DataMember()]
        public Decimal VehicleHeight { get; set; }

        [DataMember()]
        public Decimal VehicleVolume { get; set; }

        [DataMember()]
        public Int32 VehicleDesi { get; set; }

        [DataMember()]
        public Int32 VehicleWeight { get; set; }

        [DataMember()]
        public Int32 CreatedBy { get; set; }

        [DataMember()]
        public DateTime CreatedOn { get; set; }

        [DataMember()]
        public Boolean IsDeleted { get; set; }

        [DataMember()]
        public Nullable<Int32> DeletedBy { get; set; }

        [DataMember()]
        public Nullable<DateTime> DeletedOn { get; set; }

        public DefVehicleTypeDTO()
        {
        }

        public DefVehicleTypeDTO(Byte vehicleTypeId, String vehicleTypeName, Decimal vehicleWidth, Decimal vehicleLength, Decimal vehicleHeight, Decimal vehicleVolume, Int32 vehicleDesi, Int32 vehicleWeight, Int32 createdBy, DateTime createdOn, Boolean isDeleted, Nullable<Int32> deletedBy, Nullable<DateTime> deletedOn)
        {
			this.VehicleTypeId = vehicleTypeId;
			this.VehicleTypeName = vehicleTypeName;
			this.VehicleWidth = vehicleWidth;
			this.VehicleLength = vehicleLength;
			this.VehicleHeight = vehicleHeight;
			this.VehicleVolume = vehicleVolume;
			this.VehicleDesi = vehicleDesi;
			this.VehicleWeight = vehicleWeight;
			this.CreatedBy = createdBy;
			this.CreatedOn = createdOn;
			this.IsDeleted = isDeleted;
			this.DeletedBy = deletedBy;
			this.DeletedOn = deletedOn;
        }
    }
}
