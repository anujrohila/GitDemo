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
    /// Assembler for <see cref="OrderProductProperty"/> and <see cref="OrderProductPropertyDTO"/>.
    /// </summary>
    public static partial class OrderProductPropertyAssembler
    {
        /// <summary>
        /// Invoked when <see cref="ToDTO"/> operation is about to return.
        /// </summary>
        /// <param name="dto"><see cref="OrderProductPropertyDTO"/> converted from <see cref="OrderProductProperty"/>.</param>
        static partial void OnDTO(this OrderProductProperty entity, OrderProductPropertyDTO dto);

        /// <summary>
        /// Invoked when <see cref="ToEntity"/> operation is about to return.
        /// </summary>
        /// <param name="entity"><see cref="OrderProductProperty"/> converted from <see cref="OrderProductPropertyDTO"/>.</param>
        static partial void OnEntity(this OrderProductPropertyDTO dto, OrderProductProperty entity);

        /// <summary>
        /// Converts this instance of <see cref="OrderProductPropertyDTO"/> to an instance of <see cref="OrderProductProperty"/>.
        /// </summary>
        /// <param name="dto"><see cref="OrderProductPropertyDTO"/> to convert.</param>
        public static OrderProductProperty ToEntity(this OrderProductPropertyDTO dto)
        {
            if (dto == null) return null;

            var entity = new OrderProductProperty();

            entity.OrderProductPropertiesId = dto.OrderProductPropertiesId;
            entity.OrderDetailId = dto.OrderDetailId;
            entity.ProductPropertyId = dto.ProductPropertyId;

            dto.OnEntity(entity);

            return entity;
        }

        /// <summary>
        /// Converts this instance of <see cref="OrderProductProperty"/> to an instance of <see cref="OrderProductPropertyDTO"/>.
        /// </summary>
        /// <param name="entity"><see cref="OrderProductProperty"/> to convert.</param>
        public static OrderProductPropertyDTO ToDTO(this OrderProductProperty entity)
        {
            if (entity == null) return null;

            var dto = new OrderProductPropertyDTO();

            dto.OrderProductPropertiesId = entity.OrderProductPropertiesId;
            dto.OrderDetailId = entity.OrderDetailId;
            dto.ProductPropertyId = entity.ProductPropertyId;

            entity.OnDTO(dto);

            return dto;
        }

        /// <summary>
        /// Converts each instance of <see cref="OrderProductPropertyDTO"/> to an instance of <see cref="OrderProductProperty"/>.
        /// </summary>
        /// <param name="dtos"></param>
        /// <returns></returns>
        public static List<OrderProductProperty> ToEntities(this IEnumerable<OrderProductPropertyDTO> dtos)
        {
            if (dtos == null) return null;

            return dtos.Select(e => e.ToEntity()).ToList();
        }

        /// <summary>
        /// Converts each instance of <see cref="OrderProductProperty"/> to an instance of <see cref="OrderProductPropertyDTO"/>.
        /// </summary>
        /// <param name="entities"></param>
        /// <returns></returns>
        public static List<OrderProductPropertyDTO> ToDTOs(this IEnumerable<OrderProductProperty> entities)
        {
            if (entities == null) return null;

            return entities.Select(e => e.ToDTO()).ToList();
        }

    }
}
