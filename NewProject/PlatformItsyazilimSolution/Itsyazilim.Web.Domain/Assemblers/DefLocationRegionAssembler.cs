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
    /// Assembler for <see cref="DefLocationRegion"/> and <see cref="DefLocationRegionDTO"/>.
    /// </summary>
    public static partial class DefLocationRegionAssembler
    {
        /// <summary>
        /// Invoked when <see cref="ToDTO"/> operation is about to return.
        /// </summary>
        /// <param name="dto"><see cref="DefLocationRegionDTO"/> converted from <see cref="DefLocationRegion"/>.</param>
        static partial void OnDTO(this DefLocationRegion entity, DefLocationRegionDTO dto);

        /// <summary>
        /// Invoked when <see cref="ToEntity"/> operation is about to return.
        /// </summary>
        /// <param name="entity"><see cref="DefLocationRegion"/> converted from <see cref="DefLocationRegionDTO"/>.</param>
        static partial void OnEntity(this DefLocationRegionDTO dto, DefLocationRegion entity);

        /// <summary>
        /// Converts this instance of <see cref="DefLocationRegionDTO"/> to an instance of <see cref="DefLocationRegion"/>.
        /// </summary>
        /// <param name="dto"><see cref="DefLocationRegionDTO"/> to convert.</param>
        public static DefLocationRegion ToEntity(this DefLocationRegionDTO dto)
        {
            if (dto == null) return null;

            var entity = new DefLocationRegion();

            entity.RegionId = dto.RegionId;
            entity.Name = dto.Name;
            entity.CountryId = dto.CountryId;
            entity.LocalCode = dto.LocalCode;

            dto.OnEntity(entity);

            return entity;
        }

        /// <summary>
        /// Converts this instance of <see cref="DefLocationRegion"/> to an instance of <see cref="DefLocationRegionDTO"/>.
        /// </summary>
        /// <param name="entity"><see cref="DefLocationRegion"/> to convert.</param>
        public static DefLocationRegionDTO ToDTO(this DefLocationRegion entity)
        {
            if (entity == null) return null;

            var dto = new DefLocationRegionDTO();

            dto.RegionId = entity.RegionId;
            dto.Name = entity.Name;
            dto.CountryId = entity.CountryId;
            dto.LocalCode = entity.LocalCode;

            entity.OnDTO(dto);

            return dto;
        }

        /// <summary>
        /// Converts each instance of <see cref="DefLocationRegionDTO"/> to an instance of <see cref="DefLocationRegion"/>.
        /// </summary>
        /// <param name="dtos"></param>
        /// <returns></returns>
        public static List<DefLocationRegion> ToEntities(this IEnumerable<DefLocationRegionDTO> dtos)
        {
            if (dtos == null) return null;

            return dtos.Select(e => e.ToEntity()).ToList();
        }

        /// <summary>
        /// Converts each instance of <see cref="DefLocationRegion"/> to an instance of <see cref="DefLocationRegionDTO"/>.
        /// </summary>
        /// <param name="entities"></param>
        /// <returns></returns>
        public static List<DefLocationRegionDTO> ToDTOs(this IEnumerable<DefLocationRegion> entities)
        {
            if (entities == null) return null;

            return entities.Select(e => e.ToDTO()).ToList();
        }

    }
}
