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
    /// Assembler for <see cref="MembershipPasswordRenewal"/> and <see cref="MembershipPasswordRenewalDTO"/>.
    /// </summary>
    public static partial class MembershipPasswordRenewalAssembler
    {
        /// <summary>
        /// Invoked when <see cref="ToDTO"/> operation is about to return.
        /// </summary>
        /// <param name="dto"><see cref="MembershipPasswordRenewalDTO"/> converted from <see cref="MembershipPasswordRenewal"/>.</param>
        static partial void OnDTO(this MembershipPasswordRenewal entity, MembershipPasswordRenewalDTO dto);

        /// <summary>
        /// Invoked when <see cref="ToEntity"/> operation is about to return.
        /// </summary>
        /// <param name="entity"><see cref="MembershipPasswordRenewal"/> converted from <see cref="MembershipPasswordRenewalDTO"/>.</param>
        static partial void OnEntity(this MembershipPasswordRenewalDTO dto, MembershipPasswordRenewal entity);

        /// <summary>
        /// Converts this instance of <see cref="MembershipPasswordRenewalDTO"/> to an instance of <see cref="MembershipPasswordRenewal"/>.
        /// </summary>
        /// <param name="dto"><see cref="MembershipPasswordRenewalDTO"/> to convert.</param>
        public static MembershipPasswordRenewal ToEntity(this MembershipPasswordRenewalDTO dto)
        {
            if (dto == null) return null;

            var entity = new MembershipPasswordRenewal();

            entity.RenewalId = dto.RenewalId;
            entity.Email = dto.Email;
            entity.ActivateCode = dto.ActivateCode;
            entity.IP = dto.IP;
            entity.CreatedOn = dto.CreatedOn;

            dto.OnEntity(entity);

            return entity;
        }

        /// <summary>
        /// Converts this instance of <see cref="MembershipPasswordRenewal"/> to an instance of <see cref="MembershipPasswordRenewalDTO"/>.
        /// </summary>
        /// <param name="entity"><see cref="MembershipPasswordRenewal"/> to convert.</param>
        public static MembershipPasswordRenewalDTO ToDTO(this MembershipPasswordRenewal entity)
        {
            if (entity == null) return null;

            var dto = new MembershipPasswordRenewalDTO();

            dto.RenewalId = entity.RenewalId;
            dto.Email = entity.Email;
            dto.ActivateCode = entity.ActivateCode;
            dto.IP = entity.IP;
            dto.CreatedOn = entity.CreatedOn;

            entity.OnDTO(dto);

            return dto;
        }

        /// <summary>
        /// Converts each instance of <see cref="MembershipPasswordRenewalDTO"/> to an instance of <see cref="MembershipPasswordRenewal"/>.
        /// </summary>
        /// <param name="dtos"></param>
        /// <returns></returns>
        public static List<MembershipPasswordRenewal> ToEntities(this IEnumerable<MembershipPasswordRenewalDTO> dtos)
        {
            if (dtos == null) return null;

            return dtos.Select(e => e.ToEntity()).ToList();
        }

        /// <summary>
        /// Converts each instance of <see cref="MembershipPasswordRenewal"/> to an instance of <see cref="MembershipPasswordRenewalDTO"/>.
        /// </summary>
        /// <param name="entities"></param>
        /// <returns></returns>
        public static List<MembershipPasswordRenewalDTO> ToDTOs(this IEnumerable<MembershipPasswordRenewal> entities)
        {
            if (entities == null) return null;

            return entities.Select(e => e.ToDTO()).ToList();
        }

    }
}
