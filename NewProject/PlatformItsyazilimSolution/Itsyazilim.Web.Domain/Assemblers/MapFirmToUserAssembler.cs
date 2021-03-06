//-------------------------------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by EntitiesToDTOs.v3.2 (entitiestodtos.codeplex.com).
//     Timestamp: 2015-01-28 - 12:02:32
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
    /// Assembler for <see cref="MapFirmToUser"/> and <see cref="MapFirmToUserDTO"/>.
    /// </summary>
    public static partial class MapFirmToUserAssembler
    {
        /// <summary>
        /// Invoked when <see cref="ToDTO"/> operation is about to return.
        /// </summary>
        /// <param name="dto"><see cref="MapFirmToUserDTO"/> converted from <see cref="MapFirmToUser"/>.</param>
        static partial void OnDTO(this MapFirmToUser entity, MapFirmToUserDTO dto);

        /// <summary>
        /// Invoked when <see cref="ToEntity"/> operation is about to return.
        /// </summary>
        /// <param name="entity"><see cref="MapFirmToUser"/> converted from <see cref="MapFirmToUserDTO"/>.</param>
        static partial void OnEntity(this MapFirmToUserDTO dto, MapFirmToUser entity);

        /// <summary>
        /// Converts this instance of <see cref="MapFirmToUserDTO"/> to an instance of <see cref="MapFirmToUser"/>.
        /// </summary>
        /// <param name="dto"><see cref="MapFirmToUserDTO"/> to convert.</param>
        public static MapFirmToUser ToEntity(this MapFirmToUserDTO dto)
        {
            if (dto == null) return null;

            var entity = new MapFirmToUser();

            entity.MapId = dto.MapId;
            entity.FirmId = dto.FirmId;
            entity.UserId = dto.UserId;
            entity.IsAdmin = dto.IsAdmin;
            entity.IsActive = dto.IsActive;
            entity.CreatedOn = dto.CreatedOn;

            dto.OnEntity(entity);

            return entity;
        }

        /// <summary>
        /// Converts this instance of <see cref="MapFirmToUser"/> to an instance of <see cref="MapFirmToUserDTO"/>.
        /// </summary>
        /// <param name="entity"><see cref="MapFirmToUser"/> to convert.</param>
        public static MapFirmToUserDTO ToDTO(this MapFirmToUser entity)
        {
            if (entity == null) return null;

            var dto = new MapFirmToUserDTO();

            dto.MapId = entity.MapId;
            dto.FirmId = entity.FirmId;
            dto.UserId = entity.UserId;
            dto.IsAdmin = entity.IsAdmin;
            dto.IsActive = entity.IsActive;
            dto.CreatedOn = entity.CreatedOn;

            entity.OnDTO(dto);

            return dto;
        }

        /// <summary>
        /// Converts each instance of <see cref="MapFirmToUserDTO"/> to an instance of <see cref="MapFirmToUser"/>.
        /// </summary>
        /// <param name="dtos"></param>
        /// <returns></returns>
        public static List<MapFirmToUser> ToEntities(this IEnumerable<MapFirmToUserDTO> dtos)
        {
            if (dtos == null) return null;

            return dtos.Select(e => e.ToEntity()).ToList();
        }

        /// <summary>
        /// Converts each instance of <see cref="MapFirmToUser"/> to an instance of <see cref="MapFirmToUserDTO"/>.
        /// </summary>
        /// <param name="entities"></param>
        /// <returns></returns>
        public static List<MapFirmToUserDTO> ToDTOs(this IEnumerable<MapFirmToUser> entities)
        {
            if (entities == null) return null;

            return entities.Select(e => e.ToDTO()).ToList();
        }

    }
}
