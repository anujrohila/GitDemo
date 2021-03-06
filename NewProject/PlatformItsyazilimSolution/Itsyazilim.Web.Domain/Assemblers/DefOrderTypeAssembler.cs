//-------------------------------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by EntitiesToDTOs.v3.2 (entitiestodtos.codeplex.com).
//     Timestamp: 2015-01-28 - 12:02:30
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
    /// Assembler for <see cref="DefOrderType"/> and <see cref="DefOrderTypeDTO"/>.
    /// </summary>
    public static partial class DefOrderTypeAssembler
    {
        /// <summary>
        /// Invoked when <see cref="ToDTO"/> operation is about to return.
        /// </summary>
        /// <param name="dto"><see cref="DefOrderTypeDTO"/> converted from <see cref="DefOrderType"/>.</param>
        static partial void OnDTO(this DefOrderType entity, DefOrderTypeDTO dto);

        /// <summary>
        /// Invoked when <see cref="ToEntity"/> operation is about to return.
        /// </summary>
        /// <param name="entity"><see cref="DefOrderType"/> converted from <see cref="DefOrderTypeDTO"/>.</param>
        static partial void OnEntity(this DefOrderTypeDTO dto, DefOrderType entity);

        /// <summary>
        /// Converts this instance of <see cref="DefOrderTypeDTO"/> to an instance of <see cref="DefOrderType"/>.
        /// </summary>
        /// <param name="dto"><see cref="DefOrderTypeDTO"/> to convert.</param>
        public static DefOrderType ToEntity(this DefOrderTypeDTO dto)
        {
            if (dto == null) return null;

            var entity = new DefOrderType();

            entity.OrderTypeId = dto.OrderTypeId;
            entity.OrderTypeName = dto.OrderTypeName;

            dto.OnEntity(entity);

            return entity;
        }

        /// <summary>
        /// Converts this instance of <see cref="DefOrderType"/> to an instance of <see cref="DefOrderTypeDTO"/>.
        /// </summary>
        /// <param name="entity"><see cref="DefOrderType"/> to convert.</param>
        public static DefOrderTypeDTO ToDTO(this DefOrderType entity)
        {
            if (entity == null) return null;

            var dto = new DefOrderTypeDTO();

            dto.OrderTypeId = entity.OrderTypeId;
            dto.OrderTypeName = entity.OrderTypeName;

            entity.OnDTO(dto);

            return dto;
        }

        /// <summary>
        /// Converts each instance of <see cref="DefOrderTypeDTO"/> to an instance of <see cref="DefOrderType"/>.
        /// </summary>
        /// <param name="dtos"></param>
        /// <returns></returns>
        public static List<DefOrderType> ToEntities(this IEnumerable<DefOrderTypeDTO> dtos)
        {
            if (dtos == null) return null;

            return dtos.Select(e => e.ToEntity()).ToList();
        }

        /// <summary>
        /// Converts each instance of <see cref="DefOrderType"/> to an instance of <see cref="DefOrderTypeDTO"/>.
        /// </summary>
        /// <param name="entities"></param>
        /// <returns></returns>
        public static List<DefOrderTypeDTO> ToDTOs(this IEnumerable<DefOrderType> entities)
        {
            if (entities == null) return null;

            return entities.Select(e => e.ToDTO()).ToList();
        }

    }
}
