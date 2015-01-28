//-------------------------------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by EntitiesToDTOs.v3.2 (entitiestodtos.codeplex.com).
//     Timestamp: 2015-01-28 - 12:02:31
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

namespace Itsyazilim.Web.Domain.Assemblers
{

    /// <summary>
    /// Assembler for <see cref="LogMembershipCheckPasswordRenewalCode"/> and <see cref="LogMembershipCheckPasswordRenewalCodeDTO"/>.
    /// </summary>
    public static partial class LogMembershipCheckPasswordRenewalCodeAssembler
    {
        /// <summary>
        /// Invoked when <see cref="ToDTO"/> operation is about to return.
        /// </summary>
        /// <param name="dto"><see cref="LogMembershipCheckPasswordRenewalCodeDTO"/> converted from <see cref="LogMembershipCheckPasswordRenewalCode"/>.</param>
        static partial void OnDTO(this LogMembershipCheckPasswordRenewalCode entity, LogMembershipCheckPasswordRenewalCodeDTO dto);

        /// <summary>
        /// Invoked when <see cref="ToEntity"/> operation is about to return.
        /// </summary>
        /// <param name="entity"><see cref="LogMembershipCheckPasswordRenewalCode"/> converted from <see cref="LogMembershipCheckPasswordRenewalCodeDTO"/>.</param>
        static partial void OnEntity(this LogMembershipCheckPasswordRenewalCodeDTO dto, LogMembershipCheckPasswordRenewalCode entity);

        /// <summary>
        /// Converts this instance of <see cref="LogMembershipCheckPasswordRenewalCodeDTO"/> to an instance of <see cref="LogMembershipCheckPasswordRenewalCode"/>.
        /// </summary>
        /// <param name="dto"><see cref="LogMembershipCheckPasswordRenewalCodeDTO"/> to convert.</param>
        public static LogMembershipCheckPasswordRenewalCode ToEntity(this LogMembershipCheckPasswordRenewalCodeDTO dto)
        {
            if (dto == null) return null;

            var entity = new LogMembershipCheckPasswordRenewalCode();

            entity.LogId = dto.LogId;
            entity.Email = dto.Email;
            entity.Result = dto.Result;
            entity.IP = dto.IP;
            entity.CreatedOn = dto.CreatedOn;

            dto.OnEntity(entity);

            return entity;
        }

        /// <summary>
        /// Converts this instance of <see cref="LogMembershipCheckPasswordRenewalCode"/> to an instance of <see cref="LogMembershipCheckPasswordRenewalCodeDTO"/>.
        /// </summary>
        /// <param name="entity"><see cref="LogMembershipCheckPasswordRenewalCode"/> to convert.</param>
        public static LogMembershipCheckPasswordRenewalCodeDTO ToDTO(this LogMembershipCheckPasswordRenewalCode entity)
        {
            if (entity == null) return null;

            var dto = new LogMembershipCheckPasswordRenewalCodeDTO();

            dto.LogId = entity.LogId;
            dto.Email = entity.Email;
            dto.Result = entity.Result;
            dto.IP = entity.IP;
            dto.CreatedOn = entity.CreatedOn;

            entity.OnDTO(dto);

            return dto;
        }

        /// <summary>
        /// Converts each instance of <see cref="LogMembershipCheckPasswordRenewalCodeDTO"/> to an instance of <see cref="LogMembershipCheckPasswordRenewalCode"/>.
        /// </summary>
        /// <param name="dtos"></param>
        /// <returns></returns>
        public static List<LogMembershipCheckPasswordRenewalCode> ToEntities(this IEnumerable<LogMembershipCheckPasswordRenewalCodeDTO> dtos)
        {
            if (dtos == null) return null;

            return dtos.Select(e => e.ToEntity()).ToList();
        }

        /// <summary>
        /// Converts each instance of <see cref="LogMembershipCheckPasswordRenewalCode"/> to an instance of <see cref="LogMembershipCheckPasswordRenewalCodeDTO"/>.
        /// </summary>
        /// <param name="entities"></param>
        /// <returns></returns>
        public static List<LogMembershipCheckPasswordRenewalCodeDTO> ToDTOs(this IEnumerable<LogMembershipCheckPasswordRenewalCode> entities)
        {
            if (entities == null) return null;

            return entities.Select(e => e.ToDTO()).ToList();
        }

    }
}
