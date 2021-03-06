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
    /// Assembler for <see cref="C_OrderStartPositions"/> and <see cref="C_OrderStartPositionsDTO"/>.
    /// </summary>
    public static partial class C_OrderStartPositionsAssembler
    {
        /// <summary>
        /// Invoked when <see cref="ToDTO"/> operation is about to return.
        /// </summary>
        /// <param name="dto"><see cref="C_OrderStartPositionsDTO"/> converted from <see cref="C_OrderStartPositions"/>.</param>
        static partial void OnDTO(this C_OrderStartPositions entity, C_OrderStartPositionsDTO dto);

        /// <summary>
        /// Invoked when <see cref="ToEntity"/> operation is about to return.
        /// </summary>
        /// <param name="entity"><see cref="C_OrderStartPositions"/> converted from <see cref="C_OrderStartPositionsDTO"/>.</param>
        static partial void OnEntity(this C_OrderStartPositionsDTO dto, C_OrderStartPositions entity);

        /// <summary>
        /// Converts this instance of <see cref="C_OrderStartPositionsDTO"/> to an instance of <see cref="C_OrderStartPositions"/>.
        /// </summary>
        /// <param name="dto"><see cref="C_OrderStartPositionsDTO"/> to convert.</param>
        public static C_OrderStartPositions ToEntity(this C_OrderStartPositionsDTO dto)
        {
            if (dto == null) return null;

            var entity = new C_OrderStartPositions();

            entity.OrderStartPositionId = dto.OrderStartPositionId;
            entity.OrderId = dto.OrderId;
            entity.CountyId = dto.CountyId;

            dto.OnEntity(entity);

            return entity;
        }

        /// <summary>
        /// Converts this instance of <see cref="C_OrderStartPositions"/> to an instance of <see cref="C_OrderStartPositionsDTO"/>.
        /// </summary>
        /// <param name="entity"><see cref="C_OrderStartPositions"/> to convert.</param>
        public static C_OrderStartPositionsDTO ToDTO(this C_OrderStartPositions entity)
        {
            if (entity == null) return null;

            var dto = new C_OrderStartPositionsDTO();

            dto.OrderStartPositionId = entity.OrderStartPositionId;
            dto.OrderId = entity.OrderId;
            dto.CountyId = entity.CountyId;

            entity.OnDTO(dto);

            return dto;
        }

        /// <summary>
        /// Converts each instance of <see cref="C_OrderStartPositionsDTO"/> to an instance of <see cref="C_OrderStartPositions"/>.
        /// </summary>
        /// <param name="dtos"></param>
        /// <returns></returns>
        public static List<C_OrderStartPositions> ToEntities(this IEnumerable<C_OrderStartPositionsDTO> dtos)
        {
            if (dtos == null) return null;

            return dtos.Select(e => e.ToEntity()).ToList();
        }

        /// <summary>
        /// Converts each instance of <see cref="C_OrderStartPositions"/> to an instance of <see cref="C_OrderStartPositionsDTO"/>.
        /// </summary>
        /// <param name="entities"></param>
        /// <returns></returns>
        public static List<C_OrderStartPositionsDTO> ToDTOs(this IEnumerable<C_OrderStartPositions> entities)
        {
            if (entities == null) return null;

            return entities.Select(e => e.ToDTO()).ToList();
        }

    }
}
