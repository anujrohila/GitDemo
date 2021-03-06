//-------------------------------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by EntitiesToDTOs.v3.2 (entitiestodtos.codeplex.com).
//     Timestamp: 2015/02/03 - 22:39:29
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
    /// Assembler for <see cref="Role"/> and <see cref="RoleDTO"/>.
    /// </summary>
    public static partial class RoleAssembler
    {
        /// <summary>
        /// Invoked when <see cref="ToDTO"/> operation is about to return.
        /// </summary>
        /// <param name="dto"><see cref="RoleDTO"/> converted from <see cref="Role"/>.</param>
        static partial void OnDTO(this Role entity, RoleDTO dto);

        /// <summary>
        /// Invoked when <see cref="ToEntity"/> operation is about to return.
        /// </summary>
        /// <param name="entity"><see cref="Role"/> converted from <see cref="RoleDTO"/>.</param>
        static partial void OnEntity(this RoleDTO dto, Role entity);

        /// <summary>
        /// Converts this instance of <see cref="RoleDTO"/> to an instance of <see cref="Role"/>.
        /// </summary>
        /// <param name="dto"><see cref="RoleDTO"/> to convert.</param>
        public static Role ToEntity(this RoleDTO dto)
        {
            if (dto == null) return null;

            var entity = new Role();

            entity.RoleId = dto.RoleId;
            entity.RoleName = dto.RoleName;
            entity.Description = dto.Description;

            dto.OnEntity(entity);

            return entity;
        }

        /// <summary>
        /// Converts this instance of <see cref="Role"/> to an instance of <see cref="RoleDTO"/>.
        /// </summary>
        /// <param name="entity"><see cref="Role"/> to convert.</param>
        public static RoleDTO ToDTO(this Role entity)
        {
            if (entity == null) return null;

            var dto = new RoleDTO();

            dto.RoleId = entity.RoleId;
            dto.RoleName = entity.RoleName;
            dto.Description = entity.Description;

            entity.OnDTO(dto);

            return dto;
        }

        /// <summary>
        /// Converts each instance of <see cref="RoleDTO"/> to an instance of <see cref="Role"/>.
        /// </summary>
        /// <param name="dtos"></param>
        /// <returns></returns>
        public static List<Role> ToEntities(this IEnumerable<RoleDTO> dtos)
        {
            if (dtos == null) return null;

            return dtos.Select(e => e.ToEntity()).ToList();
        }

        /// <summary>
        /// Converts each instance of <see cref="Role"/> to an instance of <see cref="RoleDTO"/>.
        /// </summary>
        /// <param name="entities"></param>
        /// <returns></returns>
        public static List<RoleDTO> ToDTOs(this IEnumerable<Role> entities)
        {
            if (entities == null) return null;

            return entities.Select(e => e.ToDTO()).ToList();
        }

    }
}
