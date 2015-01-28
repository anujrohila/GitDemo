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

namespace Itsyazilim.Web.Domain.Assemblers
{

    /// <summary>
    /// Assembler for <see cref="LogMembershipSendPasswordRenewalCode"/> and <see cref="LogMembershipSendPasswordRenewalCodeDTO"/>.
    /// </summary>
    public static partial class LogMembershipSendPasswordRenewalCodeAssembler
    {
        /// <summary>
        /// Invoked when <see cref="ToDTO"/> operation is about to return.
        /// </summary>
        /// <param name="dto"><see cref="LogMembershipSendPasswordRenewalCodeDTO"/> converted from <see cref="LogMembershipSendPasswordRenewalCode"/>.</param>
        static partial void OnDTO(this LogMembershipSendPasswordRenewalCode entity, LogMembershipSendPasswordRenewalCodeDTO dto);

        /// <summary>
        /// Invoked when <see cref="ToEntity"/> operation is about to return.
        /// </summary>
        /// <param name="entity"><see cref="LogMembershipSendPasswordRenewalCode"/> converted from <see cref="LogMembershipSendPasswordRenewalCodeDTO"/>.</param>
        static partial void OnEntity(this LogMembershipSendPasswordRenewalCodeDTO dto, LogMembershipSendPasswordRenewalCode entity);

        /// <summary>
        /// Converts this instance of <see cref="LogMembershipSendPasswordRenewalCodeDTO"/> to an instance of <see cref="LogMembershipSendPasswordRenewalCode"/>.
        /// </summary>
        /// <param name="dto"><see cref="LogMembershipSendPasswordRenewalCodeDTO"/> to convert.</param>
        public static LogMembershipSendPasswordRenewalCode ToEntity(this LogMembershipSendPasswordRenewalCodeDTO dto)
        {
            if (dto == null) return null;

            var entity = new LogMembershipSendPasswordRenewalCode();

            entity.LogId = dto.LogId;
            entity.Email = dto.Email;
            entity.Result = dto.Result;
            entity.IP = dto.IP;
            entity.CreatedOn = dto.CreatedOn;

            dto.OnEntity(entity);

            return entity;
        }

        /// <summary>
        /// Converts this instance of <see cref="LogMembershipSendPasswordRenewalCode"/> to an instance of <see cref="LogMembershipSendPasswordRenewalCodeDTO"/>.
        /// </summary>
        /// <param name="entity"><see cref="LogMembershipSendPasswordRenewalCode"/> to convert.</param>
        public static LogMembershipSendPasswordRenewalCodeDTO ToDTO(this LogMembershipSendPasswordRenewalCode entity)
        {
            if (entity == null) return null;

            var dto = new LogMembershipSendPasswordRenewalCodeDTO();

            dto.LogId = entity.LogId;
            dto.Email = entity.Email;
            dto.Result = entity.Result;
            dto.IP = entity.IP;
            dto.CreatedOn = entity.CreatedOn;

            entity.OnDTO(dto);

            return dto;
        }

        /// <summary>
        /// Converts each instance of <see cref="LogMembershipSendPasswordRenewalCodeDTO"/> to an instance of <see cref="LogMembershipSendPasswordRenewalCode"/>.
        /// </summary>
        /// <param name="dtos"></param>
        /// <returns></returns>
        public static List<LogMembershipSendPasswordRenewalCode> ToEntities(this IEnumerable<LogMembershipSendPasswordRenewalCodeDTO> dtos)
        {
            if (dtos == null) return null;

            return dtos.Select(e => e.ToEntity()).ToList();
        }

        /// <summary>
        /// Converts each instance of <see cref="LogMembershipSendPasswordRenewalCode"/> to an instance of <see cref="LogMembershipSendPasswordRenewalCodeDTO"/>.
        /// </summary>
        /// <param name="entities"></param>
        /// <returns></returns>
        public static List<LogMembershipSendPasswordRenewalCodeDTO> ToDTOs(this IEnumerable<LogMembershipSendPasswordRenewalCode> entities)
        {
            if (entities == null) return null;

            return entities.Select(e => e.ToDTO()).ToList();
        }

    }
}
