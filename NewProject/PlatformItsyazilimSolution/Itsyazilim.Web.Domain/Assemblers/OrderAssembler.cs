//-------------------------------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by EntitiesToDTOs.v3.2 (entitiestodtos.codeplex.com).
//     Timestamp: 2015-01-28 - 12:02:33
//
//     Changes to this file may cause incorrect behavior and will be lost if the code is regenerated.
// </auto-generated>
//-------------------------------------------------------------------------------------------------------
using System;
using System.Collections.Generic;
using System.Runtime.Serialization;
using System.Text;
using System.Linq;
using Itsyazilim.Web.Domain;
using Itsyazilim.Web.Database.ORM;
namespace Itsyazilim.Web.Domain
{

    /// <summary>
    /// Assembler for <see cref="Order"/> and <see cref="OrderDTO"/>.
    /// </summary>
    public static partial class OrderAssembler
    {
        /// <summary>
        /// Invoked when <see cref="ToDTO"/> operation is about to return.
        /// </summary>
        /// <param name="dto"><see cref="OrderDTO"/> converted from <see cref="Order"/>.</param>
        static partial void OnDTO(this Order entity, OrderDTO dto);

        /// <summary>
        /// Invoked when <see cref="ToEntity"/> operation is about to return.
        /// </summary>
        /// <param name="entity"><see cref="Order"/> converted from <see cref="OrderDTO"/>.</param>
        static partial void OnEntity(this OrderDTO dto, Order entity);

        /// <summary>
        /// Converts this instance of <see cref="OrderDTO"/> to an instance of <see cref="Order"/>.
        /// </summary>
        /// <param name="dto"><see cref="OrderDTO"/> to convert.</param>
        public static Order ToEntity(this OrderDTO dto)
        {
            if (dto == null) return null;

            var entity = new Order();

            entity.OrderId = dto.OrderId;
            entity.FirmId = dto.FirmId;
            entity.UserId = dto.UserId;
            entity.OrderTypeId = dto.OrderTypeId;
            entity.VehicleTypeId = dto.VehicleTypeId;
            entity.DepartureDate = dto.DepartureDate;
            entity.DepartureTime = dto.DepartureTime;
            entity.DepartureDateType = dto.DepartureDateType;
            entity.ArrivalDate = dto.ArrivalDate;
            entity.ArrivalDateType = dto.ArrivalDateType;
            entity.Comment = dto.Comment;
            entity.IsActive = dto.IsActive;
            entity.CreatedOn = dto.CreatedOn;
            entity.UpdatedOn = dto.UpdatedOn;

            dto.OnEntity(entity);

            return entity;
        }

        /// <summary>
        /// Converts this instance of <see cref="Order"/> to an instance of <see cref="OrderDTO"/>.
        /// </summary>
        /// <param name="entity"><see cref="Order"/> to convert.</param>
        public static OrderDTO ToDTO(this Order entity)
        {
            if (entity == null) return null;

            var dto = new OrderDTO();

            dto.OrderId = entity.OrderId;
            dto.FirmId = entity.FirmId;
            dto.UserId = entity.UserId;
            dto.OrderTypeId = entity.OrderTypeId;
            dto.VehicleTypeId = entity.VehicleTypeId;
            dto.DepartureDate = entity.DepartureDate;
            dto.DepartureTime = entity.DepartureTime;
            dto.DepartureDateType = entity.DepartureDateType;
            dto.ArrivalDate = entity.ArrivalDate;
            dto.ArrivalDateType = entity.ArrivalDateType;
            dto.Comment = entity.Comment;
            dto.IsActive = entity.IsActive;
            dto.CreatedOn = entity.CreatedOn;
            dto.UpdatedOn = entity.UpdatedOn;

            entity.OnDTO(dto);

            return dto;
        }

        /// <summary>
        /// Converts each instance of <see cref="OrderDTO"/> to an instance of <see cref="Order"/>.
        /// </summary>
        /// <param name="dtos"></param>
        /// <returns></returns>
        public static List<Order> ToEntities(this IEnumerable<OrderDTO> dtos)
        {
            if (dtos == null) return null;

            return dtos.Select(e => e.ToEntity()).ToList();
        }

        /// <summary>
        /// Converts each instance of <see cref="Order"/> to an instance of <see cref="OrderDTO"/>.
        /// </summary>
        /// <param name="entities"></param>
        /// <returns></returns>
        public static List<OrderDTO> ToDTOs(this IEnumerable<Order> entities)
        {
            if (entities == null) return null;

            return entities.Select(e => e.ToDTO()).ToList();
        }

    }
}
